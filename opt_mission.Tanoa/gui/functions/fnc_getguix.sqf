/**
 * Author: form
 * returns X-coordinate based on messagetype and left/right CBA-setting
 *
 * Arguments:
 * 0: <NUMBER> GUI-IDC
 *
 * Return Value:
 * X-Coordinate of left border for the messagebox elements
 *
 * Example:
 * _msgboxPos set [0, IDC_MSG_background call FUNC(getguix)];
 *
 */

#include "script_component.hpp"

params ["_idc"];

private _return = -1;
switch (_idc) do
{
    case IDC_MSG_background;
    case IDC_MSG_stripe:        { _return = GUI_MSG_X + GUI_MSG_X_DIFF; };
    case IDC_MSG_header;
    case IDC_MSG_content:       { _return = GUI_MSG_X + GUI_MSG_COL + GUI_MSG_X_DIFF; };
    default                     { _return = -1 };
};
_return;
