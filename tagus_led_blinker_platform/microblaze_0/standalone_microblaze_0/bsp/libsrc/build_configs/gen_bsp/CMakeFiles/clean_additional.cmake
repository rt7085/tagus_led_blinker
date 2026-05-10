# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "/home/rt7085/repos/tagus_led_blinker/tagus_led_blinker_platform/microblaze_0/standalone_microblaze_0/bsp/include/sleep.h"
  "/home/rt7085/repos/tagus_led_blinker/tagus_led_blinker_platform/microblaze_0/standalone_microblaze_0/bsp/include/xiltimer.h"
  "/home/rt7085/repos/tagus_led_blinker/tagus_led_blinker_platform/microblaze_0/standalone_microblaze_0/bsp/include/xtimer_config.h"
  "/home/rt7085/repos/tagus_led_blinker/tagus_led_blinker_platform/microblaze_0/standalone_microblaze_0/bsp/lib/libxiltimer.a"
  )
endif()
