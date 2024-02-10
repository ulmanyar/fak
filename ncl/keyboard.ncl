let { DirectPinKey, .. } = import "fak/keyboard.ncl" in
let { CH552T, .. } = import "fak/mcus.ncl" in

{
  mcu = CH552T,
  usb_dev = {
    # USB\VID_4348&PID_55E0&REV_0250
    vendor_id = 17224,  # 0x4348
    product_id = 21984, # 0x55E0
    product_ver = 592,  # 0x0250
  },
  keys =
    let D = DirectPinKey in
    [
        D 12, D 13,
    ]
}

