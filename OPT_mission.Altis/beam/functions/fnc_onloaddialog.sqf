/**
* Description:
* initialize beam dialog and fill listbox with available options
* if component is disabled, only options with level -1 are available
* after mission start, only options with level -1 are available
*
* Author:
* Lord
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
* no - should be called via onLoad from beam dialog
*
* Global:
* no
*
* Sideeffects:
* fill variable GVAR(box) with options to beam
* fill listbox of beam dialog with all options of GVAR(box)
*
* Example:
* [] call EFUNC(beam,onLoadDialog);
*/

#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */

disableSerialization;

private _display = findDisplay DIALOG_BEAM_IDD;
private _lb = _display displayCtrl DIALOG_BEAM_LB_IDC;

private _orte = [];

if (PLAYER_SIDE == east) then
{
    _orte = GVAR(locations_east);

}
else
{
    _orte = GVAR(locations_west);

};


if (GVAR(on)) then
{
    /* loads beampoints before and after mission start if component is in use */
    if (!GVARMAIN(missionStarted)) then
    {
        GVAR(box) = (_orte select {(_x select 2) != 0}); // only positions with beaming possibility
    }
    else 
    {
        GVAR(box) = (_orte select {(_x select 2) == 4}); // only positions with beaming option after mission start
    };
};

/* writing out box elements in level corresponding colors */
GVAR(box) apply
{
    private _loc = _x;
    private _lvl = _loc select 2;

    private _index = lbAdd [DIALOG_BEAM_LB_IDC, format["%1", (_loc select 1)]]; // readable name
    _lb lbSetColor [_index, DIALOG_BEAM_LB_COLOR_DEFAULT];

    if (_lvl == 1) then
    {
        _lb lbSetColor [_index, DIALOG_BEAM_LB_COLOR_LVL_ONE];
    };

    if (_lvl == 2) then
    {
        _lb lbSetColor [_index, DIALOG_BEAM_LB_COLOR_LVL_TWO];
    };

};
