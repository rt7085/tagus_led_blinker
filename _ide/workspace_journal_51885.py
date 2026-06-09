# 2026-06-07T18:06:23.325116385
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

vitis.dispose()

