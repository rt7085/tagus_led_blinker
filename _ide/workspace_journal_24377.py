# 2026-09-26T15:03:54.360233082
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../led_blinker_wrapper.xsa")

status = platform.build()

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

vitis.dispose()

