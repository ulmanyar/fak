let { tap, hold, combo, td, .. } = import "fak/keycode.ncl" in

# We alias commonly used stuff, so we don't end up repeating them over and over.
let kc = tap.reg.kc in
let mod = tap.reg.mod in

# Define tap-dance function for lower-case (single tap) and upper-case (double tap) keycode
let td_lower_upper = fun keycode =>
  td.make 200 [
    keycode & hold.reg.layer 1 & hold.reg.behavior {},
    keycode & mod.lsft & hold.reg.layer 1 & hold.reg.behavior {},
  ]
in

# Keymap definition
{
  # Combos are virtual keys
  virtual_keys = [
    combo.make 50 [0, 1],
  ],
  layers = [
    [ # Layer 0
      td_lower_upper kc.I,    td_lower_upper kc.A,
      # Combos
      kc.ESC,
    ],
    [ # Layer 1
      td_lower_upper kc.B,    td_lower_upper kc.E,
      # Combos
      tap.trans,
    ],
  ]
}
