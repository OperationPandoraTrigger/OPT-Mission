/**
* Author: James
* initialize CBA settings
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBASettings.sqf;
*
*/
#include "script_component.hpp"

[
    QGVAR(flagCountNATO), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Anzahl der NATO-Flaggen",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Die Anzahl der NATO-Flaggen, die für die CSAT zum Angriff stehen."   // Mouse-Over description of the above
    ],
    "OPT Sektorkontrolle", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 5, 1, 0], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(flagCountCSAT), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    [
        "Anzahl der CSAT-Flaggen",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Die Anzahl der CSAT-Flaggen, die für die NATO zum Angriff stehen."   // Mouse-Over description of the above
    ],
    "OPT Sektorkontrolle", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 5, 1, 0], // [_min, _max, _default, _trailingDecimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(flagStartNeutral), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [
        "Start mit neutralen Flaggen",  // Pretty name shown inside the ingame settings menu. Can be stringtable entry.  
        "Die zu Missionsstart gewählten Flaggen tragen noch keine Fahne und müssen erst erobert werden."   // Mouse-Over description of the above
    ],
    "OPT Sektorkontrolle", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(flagMarkerOn), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Markiere Angriffsflaggen mit Mapmarker", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Sektorkontrolle", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(flagFreeMineZoneOn), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Minensperrzone um Flagge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Sektorkontrolle", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(flagFreeMineZoneMarkerOn), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Markiere Minensperrzone um Flagge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Sektorkontrolle", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(flagFreeMineZoneRadius), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Radius in Metern der Minen-Sperrzone um die Flagge.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Sektorkontrolle", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [5, 50, 20, 0], // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(flagDistanceToPlayer), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Entfernung zur Flagge für Menü-Eintrag.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Sektorkontrolle", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 20, 5, 0], // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
