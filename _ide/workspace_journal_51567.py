# 2026-11-09T06:26:54.765988750
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["interrupt.c", "timer.c", "platform.c", "serial.c", "main.c", "i2c.c"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

