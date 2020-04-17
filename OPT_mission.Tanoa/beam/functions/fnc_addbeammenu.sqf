/**
* Author: form
* fügt allen Offizieren (HL und PL) einen addAction Eintrag fürs Hinzufügen von Beampositionen
* zu Missionsbeginn hinzu. Ruft das Skript addBeam auf. Wird ausgeblendet,
* sobald die Mission begonnen hat.     
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_addBeamMenu.sqf;
*
*/
#include "script_component.hpp"

if GVARMAIN(missionStarted) exitWith{};

// Mausradmenüeinträge für HL und PL
if (typeOf player in GVARMAIN(officer)) then {
    player addAction [
        format["<t size=""1.5"" color=""#ffffff"">%1</t>", BEAM_ACTION_ADD_BEAM], 
        {createDialog QGVAR(dlg_addbeam)}, 
        [], 
        6, 
        true, 
        true, 
        "", 
        format["!%1", QGVARMAIN(missionStarted)]
    ];
};
