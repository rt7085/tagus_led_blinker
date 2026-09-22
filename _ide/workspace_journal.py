# 2026-09-22T07:17:36.593503825
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_LINKER_SCRIPT", values = ["/home/rt7085/repos/tagus_led_blinker/hello_world/src/lscript.ld"])

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.build()

comp.build()

comp.set_app_config(key = "USER_LINKER_SCRIPT", values = ["/home/rt7085/repos/tagus_led_blinker/hello_world/src/lscript.ld"])

comp.set_app_config(key = "USER_LINKER_SCRIPT", values = ["/home/rt7085/repos/tagus_led_blinker/hello_world/src/lscript.ld"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

