# 2026-09-21T07:22:59.679534091
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

status = comp.clean()

status = comp.clean()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = comp.clean()

status = platform.build()

comp.build()

status = comp.clean()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["platform.c", "main.c"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["platform.c", "main.c", "serial.c"])

status = comp.clean()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_HEADER_SOURCES", values = ["serial.h"])

status = comp.clean()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_HEADER_SOURCES", values = [""])

comp.set_app_config(key = "USER_HEADER_SOURCES", values = [""])

comp.set_app_config(key = "USER_HEADER_SOURCES", values = [""])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["platform.c", "main.c"])

comp.set_app_config(key = "USER_HEADER_SOURCES", values = [""])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["platform.c", "main.c", "serial.c"])

status = comp.clean()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_LINKER_SCRIPT", values = ["/home/rt7085/repos/tagus_led_blinker/hello_world/src/lscript.ld"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

