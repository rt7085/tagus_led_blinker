# 2026-05-16T19:35:47.415600553
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../led_blinker_wrapper.xsa")

status = platform.build()

status = platform.build()

comp = client.get_component(name="tagus_led_blinker")
comp.build()

vitis.dispose()

