# 2026-09-26T15:16:11.694911537
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.build()

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

vitis.dispose()

