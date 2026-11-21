# 2026-11-21T09:58:52.495449487
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["interrupt.c", "timer.c", "platform.c", "serial.c", "main.c", "i2c.c", "gpio.c"])

platform = client.get_component(name="tagus_led_blinker_platform")
status = platform.build()

comp.build()

vitis.dispose()

