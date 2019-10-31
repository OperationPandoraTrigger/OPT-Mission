/**
 * Author: Dorbedo
 * displays a message local on a client
 *
 * Arguments:
 * 0: <STRING> title
 * 1: <STRING> content
 * 2: <STRING/ARRAY> Color
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [LSTRING(my_title), LSTING(my_content)] call dmc_gui_fnc_message
 * ["my_title", "my_content"] call dmc_gui_fnc_message
 *
 */

#include "script_component.hpp"

If !(hasInterface) exitWith {};

params [
    ["_title", "", [""]],
    ["_content", "", [""]],
    ["_color", "", ["", []], [3, 4]]
];

If (islocalized _title) then {
    _title = localize _title;
};

If (islocalized _content) then {
    _content = localize _content;
};

If (IS_STRING(_color)) then {
    _color = switch (_color)  do {
        case "red" : {[0.972549,0,0, 1]};
        case "green" : {[0.3411764,0.6509803,0.2235294, 1]};
        case "blue" : {[0.1333333,0.4431372,0.7019607, 1]};
        case "yellow" : {[1,1,0, 1]};
        default {[0.917647,0.9019607,0.7921568, 1]};
    };
}else{
    _color params [
        ["_r", 0, [0]],
        ["_g", 0, [0]],
        ["_b", 0, [0]],
        ["_a", 1, [0]]
    ];
    _r = (_r min 1) max 0;
    _g = (_g min 1) max 0;
    _b = (_b min 1) max 0;
    _a = (_a min 1) max 0;
    _color = [_r, _g, _b, _a];
};

If ((_title isEqualTo "")&&(_content isEqualTo "")) exitWith {};

disableSerialization;

GVAR(msg_cur) = GVAR(msg_cur) - [displayNull];

If (GVAR(msg_cur) isEqualTo []) then {
    GVAR(msg_cur_ID) = 1;
    QAPP(message_1) cutRsc [QAPP(message_1), "PLAIN"];
    private _display = GVAR(msg_cur) select (count (GVAR(msg_cur)) - 1);
    (_display displayCtrl IDC_MSG_stripe) ctrlSetBackGroundColor _color;
    (_display displayCtrl IDC_MSG_header) ctrlSetText _title;
    (_display displayCtrl IDC_MSG_content) ctrlSetStructuredText (parseText _content);

    { // update coordinates of every GUI-IDD because it could have changed (left/right CBA-setting)
        private _pos = ctrlPosition (_display displayCtrl _x);
        _pos set [0, _x call FUNC(getguix)];
        (_display displayCtrl _x) ctrlSetPosition _pos;
        (_display displayCtrl _x) ctrlCommit 0;
    } forEach [IDC_MSG_background, IDC_MSG_stripe, IDC_MSG_header, IDC_MSG_content];

    If (_title isEqualTo "") then {
        /// content & background
        private _curPos = ctrlPosition(_display displayCtrl IDC_MSG_background);
        _curPos set [3,(ctrlPosition(_display displayCtrl IDC_MSG_content))select 2];
        (_display displayCtrl IDC_MSG_background) ctrlSetPosition _curPos;
        (_display displayCtrl IDC_MSG_background) ctrlCommit 0;
        (_display displayCtrl IDC_MSG_content) ctrlSetPosition _curPos;
        (_display displayCtrl IDC_MSG_content) ctrlCommit 0;
        /// color
        private _curPos = ctrlPosition(_display displayCtrl IDC_MSG_stripe);
        _curPos set [3, (ctrlPosition(_display displayCtrl IDC_MSG_content))select 3];
        (_display displayCtrl IDC_MSG_stripe) ctrlSetPosition _curPos;
        (_display displayCtrl IDC_MSG_stripe) ctrlCommit 0;
    };

    If (_content isEqualTo "") then {
        /// background
        private _curPos = ctrlPosition(_display displayCtrl IDC_MSG_background);
        _curPos set [3, (ctrlPosition(_display displayCtrl IDC_MSG_header)) select 3];
        (_display displayCtrl IDC_MSG_background) ctrlSetPosition _curPos;
        (_display displayCtrl IDC_MSG_background) ctrlCommit 0;
        /// color
        private _curPos = ctrlPosition(_display displayCtrl IDC_MSG_stripe);
        _curPos set [3, (ctrlPosition(_display displayCtrl IDC_MSG_header))select 3];
        (_display displayCtrl IDC_MSG_stripe) ctrlSetPosition _curPos;
        (_display displayCtrl IDC_MSG_stripe) ctrlCommit 0;
    };

    [] spawn {
        disableSerialization;
        while {!(GVAR(msg_cur) isEqualTo [])} do {
            GVAR(msg_cur) = GVAR(msg_cur) - [displayNull];
            If !(GVAR(msg_waiting) isEqualTo []) then {
                (GVAR(msg_waiting) deleteAt 0) params ["_title", "_content", "_color"];
                /// change the moving distance
                private _move = 0.5 * GUI_MSG_HEAD + GUI_MSG_H;
                If ((_content isEqualTo "")||(_title isEqualTo "")) then {
                    If (_content isEqualTo "") then {
                        _move = 1.5 * GUI_MSG_HEAD;
                    }else{
                        _move = 0.5 * GUI_MSG_HEAD + GUI_MSG_TEXT;
                    };
                };
                /// pushdown the old ones;
                {
                    private _display = _x;
                    {
                        private _pos = ctrlPosition (_display displayCtrl _x);
                        (_display displayCtrl _x) ctrlSetPosition [_x call FUNC(getguix), ((_pos select 1) + _move)];
                        (_display displayCtrl _x) ctrlCommit MOVINGTIME;
                    }forEach [IDC_MSG_background, IDC_MSG_stripe, IDC_MSG_header, IDC_MSG_content];
                } forEach GVAR(msg_cur);
                uisleep MOVINGTIME;
                /// new display
                If (GVAR(msg_cur_ID) >= 9) then {
                    GVAR(msg_cur_ID) = 1;
                } else {
                    INC(GVAR(msg_cur_ID));
                };
                format[QAPP(message_%1), GVAR(msg_cur_ID)] cutRsc [format[QAPP(message_%1), GVAR(msg_cur_ID)], "PLAIN"];
                private _display = GVAR(msg_cur) select (count (GVAR(msg_cur)) - 1);

                { // update coordinates of every GUI-IDD because it could have changed (left/right CBA-setting)
                    private _pos = ctrlPosition (_display displayCtrl _x);
                    _pos set [0, _x call FUNC(getguix)];
                    (_display displayCtrl _x) ctrlSetPosition _pos;
                    (_display displayCtrl _x) ctrlCommit 0;
                } forEach [IDC_MSG_background, IDC_MSG_stripe, IDC_MSG_header, IDC_MSG_content];

                (_display displayCtrl IDC_MSG_stripe) ctrlSetBackGroundColor _color;
                (_display displayCtrl IDC_MSG_header) ctrlSetText _title;
                (_display displayCtrl IDC_MSG_content) ctrlSetStructuredText (parseText _content);
                If (_title isEqualTo "") then {
                    /// content & background
                    private _curPos = ctrlPosition(_display displayCtrl IDC_MSG_background);
                    _curPos set [3, (ctrlPosition(_display displayCtrl IDC_MSG_content)) select 3];
                    _curPos set [0, IDC_MSG_background call FUNC(getguix)];
                    (_display displayCtrl IDC_MSG_background) ctrlSetPosition _curPos;
                    (_display displayCtrl IDC_MSG_background) ctrlCommit 0;
                    _curPos set [0, IDC_MSG_content call FUNC(getguix)];
                    (_display displayCtrl IDC_MSG_content) ctrlSetPosition _curPos;
                    (_display displayCtrl IDC_MSG_content) ctrlCommit 0;
                    /// color
                    private _curPos = ctrlPosition(_display displayCtrl IDC_MSG_stripe);
                    _curPos set [3, (ctrlPosition(_display displayCtrl IDC_MSG_content)) select 3];
                    _curPos set [0, IDC_MSG_stripe call FUNC(getguix)];
                    (_display displayCtrl IDC_MSG_stripe) ctrlSetPosition _curPos;
                    (_display displayCtrl IDC_MSG_stripe) ctrlCommit 0;
                };
                If (_content isEqualTo "") then {
                    /// background
                    private _curPos = ctrlPosition(_display displayCtrl IDC_MSG_background);
                    _curPos set [3, (ctrlPosition(_display displayCtrl IDC_MSG_header)) select 3];
                    _curPos set [0, IDC_MSG_background call FUNC(getguix)];
                    (_display displayCtrl IDC_MSG_background) ctrlSetPosition _curPos;
                    (_display displayCtrl IDC_MSG_background) ctrlCommit 0;
                    /// color
                    private _curPos = ctrlPosition(_display displayCtrl IDC_MSG_stripe);
                    _curPos set [3, (ctrlPosition(_display displayCtrl IDC_MSG_header)) select 3];
                    _curPos set [0, IDC_MSG_stripe call FUNC(getguix)];
                    (_display displayCtrl IDC_MSG_stripe) ctrlSetPosition _curPos;
                    (_display displayCtrl IDC_MSG_stripe) ctrlCommit 0;
                };
            };
            uisleep 1;
        };
    };
} else {
    GVAR(msg_waiting) pushBack [_title, _content, _color];
};
