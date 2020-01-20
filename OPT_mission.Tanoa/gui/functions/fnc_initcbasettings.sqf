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
    QGVAR(right), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
        [
            "Meldungen am rechten Bildschirmrand",
            "GUI-Meldungen am rechten anstatt linken Bildschirmrand anzeigen"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry. 
    ["OPT", "GUI"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    0, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        if (GVAR(right)) then
        {
            GUI_MSG_X_DIFF = (safeZoneW + safeZoneX - GUI_MSG_W - GUI_DLG_W) - (safezoneX + GUI_DLG_W);
        }
        else
        {
            GUI_MSG_X_DIFF = 0;
        };
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
