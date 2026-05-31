# 2026-05-30T18:50:10.604075194
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

client.delete_component(name="tagus_led_blinker")

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

vitis.dispose()

