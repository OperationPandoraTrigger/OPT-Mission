/**
* Author: James
* start intro
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] spawn fnc_intro.sqf;
*
* Server only:
* no
*
* Public:
* yes
*
*/
#include "script_component.hpp"

/* VALIDATION */
if (!canSuspend) exitWith{};

// wait until player is initializied
waitUntil {!isNull player && !((findDisplay 46) isEqualTo displayNull)};

enableRadio false;
EnableEnvironment false;
{_x disableConversation true} forEach allUnits;
{_x setVariable ["BIS_noCoreConversations", true]} forEach allUnits;

[0,0,false] spawn BIS_fnc_cinemaBorder;

playMusic "LeadTrack05_F_EPC";

sleep 2; 
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [0];   
"dynamicBlur" ppEffectCommit 0;  
"dynamicBlur" ppEffectAdjust [8];   
"dynamicBlur" ppEffectCommit 8;     
waitUntil{ppEffectCommitted "dynamicBlur"};

sleep 2;

[
    parseText format
    [
        "<t align='right' size='1.2'><t font='PuristaBold' size='1.6'>""%1""</t><br/>%2</t>",
        "OPT Schlacht",
        "von: " + "James" + "/" + "Lord-MDB"
    ],
    true,
    nil,
    7,
    0.7,
    0.1
] spawn BIS_fnc_textTiles;

schrift0 = ["<t size='1.2'>" + "Habt alle viel Spaß! Spielt hart, aber fair!"+"</t>",0,0.8,3,4,0,3010] spawn bis_fnc_dynamicText;

sleep 8;

titlecut["","BLACK OUT",3];
sleep 3;

// Zufallsauswahl eines von 40 Quotes
private _quotes = [];
for "_i" from 0 to 23 do {
	_quotes pushBack format["STR_A3_Campaign_Quote_%1", _i];
};
for "_i" from 30 to 44 do {
	_quotes pushBack format["STR_A3_Campaign_Quote_%1", _i];
};
_quote = localize (_quotes select (floor random (count _quotes)));
_quote = _quote splitString "-";

private _txt = format["<t size='1.3' align='center'>%1</t><br/><t size='1.2' align='right' color='#cccccc'>%2</t>", _quote select 0, _quote select 1];
[_txt,0,0,8,3,0,3010] spawn bis_fnc_dynamicText;
sleep 13;

// Liste alle Spieler beider Seiten
private _playerNATO = [];
private _playerCSAT = [];
{
    _name = UNIT_NAME(_x);
    
    if (UNIT_SIDE(_x) == west) then {
		_playerNATO pushBack (_name);
	};
    
    if (UNIT_SIDE(_x) == east) then {
		_playerCSAT pushBack (_name);
	};
} foreach (playableUnits -  (entities "HeadlessClient_F"));

_txt = format["<t size='1' align='center'> <br/> 
Zu dieser Schlacht haben sich zusammengefunden: <br/> 
<t size='1.5' color='#0000ff'>NATO %1</t> vs <t size='1.5' color='#ff0000'>CSAT %2</t></t><br/><t size='0.7'>", playersNumber west, playersNumber east];

private _playerNames = [];
private _natoIsMore = [false, true] select (count _playerNATO > count _playerCSAT);
private _min = ((count _playerCSAT) min (count _playerNATO));
private _max = ((count _playerCSAT) max (count _playerNATO));
for "_i" from 0 to _min - 1 do {
	_playerNames pushBack [_playerNATO select _i, _playerCSAT select _i];
};

for "_i" from _min to _max - 1 do {
	if (_natoIsMore) then {
		_playerNames pushBack [_playerNATO select _i, ""];
	} else {
		_playerNames pushBack ["", _playerCSAT select _i];
	};
};

{
	_txt = format["%1 <t color='#0000ff'>%2</t> -- <t color='#ff0000'>%3</t><br/>", _txt, _x select 0, _x select 1];
} foreach _playerNames;
_txt = format["%1</t>", _txt];

[_txt,0,0,14,2,-0.5,3010] spawn bis_fnc_dynamicText;
sleep 25;

titlecut ["","BLACK IN",1];
sleep 0.1;
"dynamicBlur" ppEffectEnable false;   

[1,nil,false] spawn BIS_fnc_cinemaBorder;
enableRadio true;
EnableEnvironment true;
{_x disableConversation false} forEach allUnits;
{_x setVariable ["BIS_noCoreConversations", false]} forEach allUnits;

playMusic "";
GVAR(introDone) = true;