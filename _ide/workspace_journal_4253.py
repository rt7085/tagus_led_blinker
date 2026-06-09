# 2026-06-08T20:40:34.054645367
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

vitis.dispose()

