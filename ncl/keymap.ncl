let { tap, macro, .. } = import "fak/keycode.ncl" in

# We alias commonly used stuff, so we don't end up repeating them over and over.
let kc = tap.reg.kc in

# Define tap-dance function for lower-case (single tap) and upper-case (double tap) keycode
let macro_mode = fun keycode =>
  macro.make [
    macro.tap kc.ESC,
    macro.tap kc.ESC,
    macro.tap keycode,
    macro.pause_for_release,
    macro.tap kc.ESC,
  ]
in

# Keymap definition
{
  # Combos are virtual keys
  layers = [
    [ # Layer 0
      macro_mode kc.I,    macro_mode kc.A,
    ],
  ]
}
