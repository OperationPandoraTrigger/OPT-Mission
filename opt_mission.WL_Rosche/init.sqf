enableSaving [false, false];

// These two lines initialize the CLib-framework (and thus all Mods depending on it)
// on the current machine
waitUntil {!isNil "CLib_fnc_loadModules"};
call CLib_fnc_loadModules;

if (isServer) then 
{

    //Function that adds dynamic groups to the mission as seen in End Game
    ["Initialize"] call BIS_fnc_dynamicGroups;
};

if (hasInterface) then 
{
    //Function that adds dynamic groups to the mission as seen in End Game
    ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
};