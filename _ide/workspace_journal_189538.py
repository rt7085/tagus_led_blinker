# 2026-11-16T06:38:49.543375948
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

vitis.dispose()

