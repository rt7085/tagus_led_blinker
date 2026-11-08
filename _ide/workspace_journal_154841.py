# 2026-11-08T14:51:54.616804143
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

vitis.dispose()

