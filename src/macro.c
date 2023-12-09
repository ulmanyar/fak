#include "macro.h"
#include "keyboard.h"
#include "time.h"
#include "usb.h"

void macro_handle_key(uint16_t step_idx, uint8_t down) {
    if (!down) return;

    fak_macro_step_t step;
    uint32_t arg;

    while (1) {
        step = macro_steps[step_idx++];
        if (step.inst == MACRO_INST_HALT) return;

        arg = macro_step_args[step.arg_idx];

        switch (step.inst) {
        case MACRO_INST_PRESS:
            handle_non_future(arg, 1);
            USB_EP1I_send_now();
            break;
        case MACRO_INST_RELEASE:
            handle_non_future(arg, 0);
            USB_EP1I_send_now();
            break;
        case MACRO_INST_TAP:
            tap_non_future(arg);
            break;
        case MACRO_INST_WAIT:
            delay(arg);
            break;
        }
    }
}
