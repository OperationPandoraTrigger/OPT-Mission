#include "script_component.hpp"

/*
    this line is commented, otherwise it would disturb the linter.
["LandVehicle", "init", FUNC(onInit), nil, nil, true] call CBA_fnc_addClassEventHandler;
*/
if (!GVAR(on)) exitWith{};

[] call FUNC(initCBAClassEvents);

if (hasInterface) then {
    [] call FUNC(postInit);
};
