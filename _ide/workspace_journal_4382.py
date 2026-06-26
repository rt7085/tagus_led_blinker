# 2026-06-20T12:32:37.110265903
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../led_blinker_wrapper.xsa")

status = platform.build()

vitis.dispose()

