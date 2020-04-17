enableSaving [false, false];

// These two lines initialize the CLib-framework (and thus all Mods depending on it)
// on the current machine
waitUntil {!isNil "CLib_fnc_loadModules"};
call CLib_fnc_loadModules;
