/**
* Description:
* Teleport player
* 
*
* Author:
* James
*
* Edit by:
* Manu
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* no
*
* Global:
* no
*
* Sideeffects:
* black out and black in effect for player
* local gui messages for player
*
* Example:
* [0] spawn EFUNC(beam,beam_zer);
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */

private _schiff = "";

if (PLAYER_SIDE == east) then
{
    _schiff = Schiff_CSAT;

}
else
{
    _schiff = Schiff_NATO;

};

(QGVAR(rsc_layer) call BIS_fnc_rscLayer) cutText ["Teleport...", "BLACK OUT", 3]; // fade out in black

// beam player
vehicle player setPosASL [(random 100) - 50, (random 100) - 50, 1000 + random 100];
vehicle player setVectorUp [0,0,1];
vehicle player setPosASL (getPosASL _schiff vectorAdd [(random 2) + 2, (random 2) + 2, 0.2]);

 
(QGVAR(rsc_layer) call BIS_fnc_rscLayer) cutText ["", "BLACK IN", 3]; // return to game

 







