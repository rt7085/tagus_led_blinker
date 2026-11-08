# 2026-11-08T15:12:26.622812153
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

vitis.dispose()

