# 2026-05-10T15:53:51.722983334
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

platform = client.create_platform_component(name = "tagus_led_blinker_platform",hw_design = "$COMPONENT_LOCATION/../led_blinker_wrapper.xsa",os = "standalone",cpu = "microblaze_0",domain_name = "standalone_microblaze_0",compiler = "gcc")

comp = client.create_app_component(name="peripheral_tests",platform = "$COMPONENT_LOCATION/../tagus_led_blinker_platform/export/tagus_led_blinker_platform/tagus_led_blinker_platform.xpfm",domain = "standalone_microblaze_0",template = "peripheral_tests")

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.build()

status = platform.build()

comp = client.get_component(name="peripheral_tests")
comp.build()

comp = client.create_app_component(name="tagus_led_blinker",platform = "$COMPONENT_LOCATION/../tagus_led_blinker_platform/export/tagus_led_blinker_platform/tagus_led_blinker_platform.xpfm",domain = "standalone_microblaze_0",template = "empty_application")

status = platform.build()

comp = client.get_component(name="tagus_led_blinker")
comp.build()

status = platform.build()

comp.build()

client.delete_component(name="peripheral_tests")

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

