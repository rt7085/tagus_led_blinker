# 2026-09-26T16:03:28.005912942
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../led_blinker_wrapper.xsa")

status = platform.build()

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

component = client.get_component(name="hello_world")

lscript = component.get_ld_script(path="/home/rt7085/repos/tagus_led_blinker/hello_world/src/lscript.ld")

lscript.update_memory_region("microblaze_0_local_memory_dlmb_bram_if_cntlr_memory_0", "0x50", "0xfffff")

status = platform.build()

comp.build()

vitis.dispose()

