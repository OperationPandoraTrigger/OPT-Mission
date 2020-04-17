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
    "OPT_PARAM_ONLY_PILOTS", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Nur Piloten können fliegen", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Kaufsystem", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "OPT_PARAM_ONLY_CREW", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Nur Besatzungsmitglieder können schwere Kampffahrzeuge fahren", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Kaufsystem", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(blockedVehiclePositions), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    "Blockierte Fahrzeugpositionen für Nicht-Crew-Einheiten", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Kaufsystem", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [[["driver"], ["gunner"], ["commander"], ["driver, gunner, commander"]], ["Fahrer", "Schütze", "Kommandant", "alle"], 0], // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


[
    QGVAR(orderSpawnRadius), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Platzierungsradius für neue Fahrzeuge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Kaufsystem", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [5, 40, 15, 0], // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(saleRadius), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Umkreis um das Verkaufspad, in dem Fahrzeuge erkannt werden", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Kaufsystem", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [5, 40, 15, 0], // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(allowSale), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Verkaufsoption verfügbar", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Kaufsystem", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(saleReturnValueForOwn), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Verkaufspreis für Eigenfahrzeuge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Kaufsystem", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, 0.75, 2], // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVAR(saleReturnValueForEnemy), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Verkaufspreis für Feindfahrzeuge", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Kaufsystem", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 2, 1.50, 2], // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

