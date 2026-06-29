# Chronological Project Steps taken

## Always
- Regenerate the wrapper in a block design
- check that the pinout is correct / check the contraints

Recompiled tagus_pcie_dma_4 to check for it working. 

>Make sure that you hit the reset button before repooting the PC

sudo ./pcimem /dev/mem 0xF6C00000 w 0x00000001 controls the LED. (This command turns it blue)
Note that green is always on when the board is in uplink

note that only the lower 2 bits can be written as they control the GPIO pin to blue and red LEDs

04/27/26: The GPIO is working as expected. But the memory does not work. The smart connect block placed between the BRAM controller and the xDMA was reported as problematic. We are replacing with the (discontinued ) AXI interconnect instead in the block diagram. Same result.

Instead of address 0x0 for the memory area we are going to use the initially suggested C000_0000. This does not matter either.

sudo ./pcimem /dev/mem 0xF6F00000 w 0xDEADBEEF does not work as expected.

Discovery was made that BAR0 is PCIe DMA memory. The XDMA Linux driver must be installed along with the tools and tests to access this memory. The can be obtained here:

https://github.com/Xilinx/dma_ip_drivers (installed in \repos\driver on Capybara)

Follow the steps in the readme.txt file inside the XDMA directory to install the drivers. 

After this, it appears that we can write and write the BRAM using the dma_to_device and dma_from_device tools inside the \tools directory. We are writing to memory segment 0xF6C00000. The test file contents are writen and read back with success. They are the same.

>cd /home/rt7085/repos/drivers/dma_ip_drivers/XDMA/linux-kernel/tools

>sudo ./dma_to_device -d /dev/xdma0_h2c_0 -f ../tests/data/datafile0_4K.bin -s 4096 -a 0

>sudo ./dma_from_device -d /dev/xdma0_c2h_0 -f ../tests/data/output_datafile0_4K.bin -s 4096 -a 0

>hexedit ../tests/data/datafile0_4K.bin
>hexedit ../tests/data/output_datafile0_4K.bin

Results look the same (test with):
diff -s ../tests/data/datafile0_4K.bin ../tests/data/output_datafile0_4K.bin

It appears that the JTAG-to-AXI master block would allow us to peek and poke the BRAM memory using the JTAG debugger. We need to install Vitis for this (done). This would confirm that access this memory truly works. 

The JTAG-TO-AXI block was installed in the Tagus_pcie_dma_4 design. This video leads to the hints needed: https://www.youtube.com/watch?v=L9P_Vn-gals

The hw_axi_1 interface now enumerates in the hardware manager. This means that the TCL command can be issued. 

The memory address range is C000_0000 to C000_FFFF and it covers 64k bytes of memory.

This document describes how to access the BRAM memory through the JTAG-TO-AXI interface:
https://docs.amd.com/r/en-US/ug908-vivado-programming-debugging/Debug-Probe-Conditions

The command to run (see UG908):

Reset the JTAG interface first:
>reset_hw_axi [get_hw_axis hw_axi_1]

A read command:
>create_hw_axi_txn read_txn2 [get_hw_axis hw_axi_1] -type READ -address c0000000 -len 4

Execute the command:
>run_hw_axi [get_hw_axi_txns read_txn2]

Read the results:
>report_hw_axi_txn [get_hw_axi_txns read_txn2]

Write command:
>create_hw_axi_txn write_txn2 [get_hw_axis hw_axi_1] -type WRITE -address c0000000 -len 4 -data {11111111_22222222_33333333_44444444}

Execute command:
>run_hw_axi [get_hw_axi_txns write_txn2]

This appears to work, but I cannot read the dma channels with the PCIe driver any more.

06/28/26:

The new project tagus_led_blinker is a rework of tagus_pcie_dma_4 project. It appears that the JTAG-to-AXI master block has been known to interfere with the xdma0 block reaching into memory. Instead it was decided to integrate a Microblaze processor. This provides the flexibility to manipulate the logic on the FPGA directly and build little state machines to monitor and control things locally. I proved to myself that I can read and write memeory using the JTAG mrd and mwd command using the XSDB console in VITIS. Also the Microblaze can read and write the memory. The Microblaze has been attached to DDR3 adn BRAM. Both work. And now it is also possible to reach into this memory with the xdma0 block using DMA data moves from the Linux user space.

Checking memory with the XSDB console in VITIS:

> connect
> targets
> xsdb% targets
  1  xc7a200t
     2  MicroBlaze Debug Module at USER2
        3  MicroBlaze #0 (Running)
> targets 3
> xsdb% mrd 0xC0000000 32
C0000000:   13121110
C0000004:   17161514
C0000008:   1B1A1918
C000000C:   1F1E1D1C
C0000010:   23222120
C0000014:   27262524
C0000018:   2B2A2928
C000001C:   2F2E2D2C
....

This data was written into the BRAM using: 
> sudo ./dma_to_device --device /dev/xdma0_h2c_0 --address 0xC0000000 --size 4096 --file ./data/datafile0_4K.bin
sscanf() = 1, value = 0xc0000000
sscanf() = 1, value = 0x00001000
device = /dev/xdma0_h2c_0, address = 0xc0000000, size = 0x00001000, offset = 0x00000000, count = 1
host memory buffer = 0x58c282cdb000
CLOCK_MONOTONIC reports 0.000067877 seconds (total) for last transfer of 4096 bytes

Make sure that the size of the bin file matches --size option. 
> hexedit data/datafile0_4K.bin
00000000   10 11 12 13  14 15 16 17  18 19 1A 1B  1C 1D 1E 1F  20 21 22 23  24 25 26 27  28 29 2A 2B  2C 2D 2E 2F  30 31 32 33  34 35 36 37  38 39 3A 3B  3C 3D 3E 3F  40 41 42 43  ................ !"#$%&'()*+,-./0123456789:;<=>?@ABC
00000034   44 45 46 47  48 49 4A 4B  4C 4D 4E 4F  50 51 52 53  54 55 56 57  58 59 5A 5B  5C 5D 5E 5F  60 61 62 63  64 65 66 67  68 69 6A 6B  6C 6D 6E 6F  70 71 72 73  74 75 76 77  DEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvw
00000068   78 79 7A 7B  7C 7D 7E 7F  80 81 82 83  84 85 86 87  88 89 8A 8B  8C 8D 8E 8F  90 91 92 93  94 95 96 97  98 99 9A 9B  9C 9D 9E 9F  A0 A1 A2 A3  A4 A5 A6 A7  A8 A9 AA AB  xyz{|}~.............................................

Same process was repeated to the DDR3 at address 0x8000000 succesfully:

> sudo ./dmafrom_device --device /dev/xdma0_c2h_0 --address 0x80000000 --size 4096 --file ./ddr3file0_4K.bin
sudo: password for rt7085: 
sscanf() = 1, value = 0x80000000
sscanf() = 1, value = 0x00001000
device = /dev/xdma0_h2c_0, address = 0x80000000, size = 0x00001000, offset = 0x00000000, count = 1
host memory buffer = 0x5ee882384000
CLOCK_MONOTONIC reports 0.000063549 seconds (total) for last transfer of 4096 bytes

Reading it back from ddr3:
> sudo ./dma_from_device --device /dev/xdma0_c2h_0 --address 0x80000000 --size 4096 --file ./ddr3file0_4K.bin
sscanf() = 1, value = 0x80000000
sscanf() = 1, value = 0x00001000
device = /dev/xdma0_c2h_0, address = 0x80000000, size = 0x00001000, offset = 0x00000000, count = 1
host memory buffer = 0x5adebe8ba000
CLOCK_MONOTONIC reports 0.000057558 seconds (total) for last transfer of 4096 bytes
> hexedit ./ddr3file0_4K.bin
00000000   10 11 12 13  14 15 16 17  18 19 1A 1B  1C 1D 1E 1F  20 21 22 23

Driver installation:
/home/rt7085/repos/drivers/XilinxAR654444 contains the drivers.
The drivers had to be recompiled and corrected to get them to work in Kernel 6.17.0-35-generic.
The xdma driver was then installed using the modprobe command as described in Xilinx_Answer_654444_Linux.pdf. 

When successful the driver is enumerated in the lspci -vvv command:
> sudo lspci -vvv -s 01:00.0
01:00.0 RAM memory: Xilinx Corporation Device 7021
	Subsystem: Xilinx Corporation Device 0007
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 91
	IOMMU group: 12
	Region 0: Memory at f6c00000 (32-bit, non-prefetchable) [size=1M]
	Region 1: Memory at f6d00000 (32-bit, non-prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: xdma
	Kernel modules: xdma


And the interrupt events, and dma channels etc should show in the /dev directory:

crw-rw-rw-   1 root   root    237,  36 Jun 27 17:55 xdma0_c2h_0
crw-rw-rw-   1 root   root    237,  37 Jun 27 17:55 xdma0_c2h_1
crw-rw-rw-   1 root   root    237,   1 Jun 27 17:55 xdma0_control
crw-rw-rw-   1 root   root    237,  10 Jun 27 17:55 xdma0_events_0
crw-rw-rw-   1 root   root    237,  11 Jun 27 17:55 xdma0_events_1
crw-rw-rw-   1 root   root    237,  20 Jun 27 17:55 xdma0_events_10
crw-rw-rw-   1 root   root    237,  21 Jun 27 17:55 xdma0_events_11
crw-rw-rw-   1 root   root    237,  22 Jun 27 17:55 xdma0_events_12
crw-rw-rw-   1 root   root    237,  23 Jun 27 17:55 xdma0_events_13
crw-rw-rw-   1 root   root    237,  24 Jun 27 17:55 xdma0_events_14
crw-rw-rw-   1 root   root    237,  25 Jun 27 17:55 xdma0_events_15
crw-rw-rw-   1 root   root    237,  12 Jun 27 17:55 xdma0_events_2
crw-rw-rw-   1 root   root    237,  13 Jun 27 17:55 xdma0_events_3
crw-rw-rw-   1 root   root    237,  14 Jun 27 17:55 xdma0_events_4
crw-rw-rw-   1 root   root    237,  15 Jun 27 17:55 xdma0_events_5
crw-rw-rw-   1 root   root    237,  16 Jun 27 17:55 xdma0_events_6
crw-rw-rw-   1 root   root    237,  17 Jun 27 17:55 xdma0_events_7
crw-rw-rw-   1 root   root    237,  18 Jun 27 17:55 xdma0_events_8
crw-rw-rw-   1 root   root    237,  19 Jun 27 17:55 xdma0_events_9
crw-rw-rw-   1 root   root    237,  32 Jun 27 17:55 xdma0_h2c_0
crw-rw-rw-   1 root   root    237,  33 Jun 27 17:55 xdma0_h2c_1
crw-rw-rw-   1 root   root    237,   0 Jun 27 17:55 xdma0_user




