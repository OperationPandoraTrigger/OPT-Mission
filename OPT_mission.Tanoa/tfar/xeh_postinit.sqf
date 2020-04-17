#include "script_component.hpp"

// addon check
if (count ("(configName _x) find 'TFAR' >= 0" configClasses (configFile >> "CfgPatches")) == 0) exitWith{};

// executed after briefing right to mission start
GVAR(EH_PreloadFinished) = addMissionEventHandler ["PreloadFinished",  {
    /*  	
        Executes assigned code after the mission preload screen. Stackable version of onPreloadFinished. 
    */
    [] call FUNC(initPlayerEH);

}];
