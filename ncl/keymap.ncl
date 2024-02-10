let { tap, .. } = import "fak/keycode.ncl" in

# We alias commonly used stuff, so we don't end up repeating them over and over.
let kc = tap.reg.kc in

# Keymap definition
{
  layers = [
    [ # Layer 0
      kc.A,    kc.B,
    ],
  ]
}
