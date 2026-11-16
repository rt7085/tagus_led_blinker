# 2026-11-14T16:53:53.065322467
import vitis

client = vitis.create_client()
client.set_workspace(path="tagus_led_blinker")

vitis.dispose()

