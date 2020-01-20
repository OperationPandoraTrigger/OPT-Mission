#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;
GVAR(missionStarted) = false;

// CBA settings
[] call FUNC(initCBASettings);

[] call FUNC(preInit);
