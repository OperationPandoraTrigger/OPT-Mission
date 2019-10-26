#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

GVAR(msg_waiting) = [];
GVAR(msg_cur) = [];

// CBA settings
[] call FUNC(initCBASettings);
