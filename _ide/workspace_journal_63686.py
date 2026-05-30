# 2026-05-17T07:17:34.517646937
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../led_blinker_wrapper.xsa")

status = platform.build()

status = platform.build()

comp = client.get_component(name="tagus_led_blinker")
comp.build()

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../led_blinker_wrapper.xsa")

status = platform.build()

status = platform.build()

comp.build()

vitis.dispose()

