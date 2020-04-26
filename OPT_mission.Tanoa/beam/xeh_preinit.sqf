<<<<<<< HEAD
#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

/* INITIALIZE GLOBAL VARS */
// list all global variables used within the component
// define variable with default value!
// GVAR(...)
GVAR(box) = []; // contains all available beam positions defined in setup_beamOrte.sqf
GVAR(locations_west) = []; // contains all beam locations for west
GVAR(locations_east) = []; // contains all beam locations for east
GVAR(restricted_vehicles) = []; // contains all restricted vehicle classnames that are only allowed at lvl 3
GVAR(beam_vehicles) = []; // contains all vehicles usable for beaming after mission start
GVAR(beam_trigger) = []; // contains all trigger variable names that allow player to open beam dialog

// initialize CBA settings
[] call FUNC(initCBASettings);
=======
#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

/* INITIALIZE GLOBAL VARS */
// list all global variables used within the component
// define variable with default value!
// GVAR(...)
GVAR(box) = []; // contains all available beam positions defined in setup_beamOrte.sqf
GVAR(locations_west) = []; // contains flag-beam locations for west
GVAR(locations_east) = []; // contains flag-beam locations for east
if (isNil QGVAR(custom_beam_west)) then { GVAR(custom_beam_west) = []; }; // contains custom beam locations for west, only create when not synced by JiP
if (isNil QGVAR(custom_beam_east)) then { GVAR(custom_beam_east) = []; }; // contains custom beam locations for east, only create when not synced by JiP
GVAR(restricted_vehicles) = []; // contains all restricted vehicle classnames that are only allowed at lvl 3
GVAR(beam_vehicles) = []; // contains all vehicles usable for beaming after mission start
GVAR(beam_trigger) = []; // contains all trigger variable names that allow player to open beam dialog

// initialize CBA settings
[] call FUNC(initCBASettings);
>>>>>>> 2f1f4152f9aa91031c4c85ded81a34795abc6792
