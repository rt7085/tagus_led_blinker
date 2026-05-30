# 2026-05-17T08:06:48.106356817
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

comp = client.create_app_component(name="hello_world",platform = "$COMPONENT_LOCATION/../tagus_led_blinker_platform/export/tagus_led_blinker_platform/tagus_led_blinker_platform.xpfm",domain = "standalone_microblaze_0",template = "hello_world")

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp = client.get_component(name="tagus_led_blinker")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

