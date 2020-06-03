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

private _quotes =
[
    ["Man kann einen Krieg beginnen, aber niemals beenden, wenn man will.", "Niccoló Machiavelli", "Mercurat"],
    ["Je stärker wir sind, desto unwahrscheinlicher ist der Krieg.", "Otto v. Bismarck", "Scott"],
    ["Wenn die Österreicher von uns Reparationen verlangen sollten, dann werde ich Ihnen die Gebeine A. Hitlers schicken.", "Konrad Adenauer", "Scott"],
    ["Lieber fünf Minuten lang feig als ein ganzes Leben lang tot.", "Scott", "Scott"],
    ["Aber wenn es etwas gibt, was ich verachte, ist das ein fairer Kampf.", "Lord Helmchen, Spaceballs", "oldeurope"],
    ["Freude liegt im Kampf, im Wagnis, in der Leidensbereitschaft, nicht im Siegen.", "Mahatma Gandhi", "oldeurope"],
    ["Flieht, ihr Narren!", "Gandalf, Der Herr der Ringe", "oldeurope"],
    ["Ran an die Waffen, laden und schießen!", "Lieutenant Commander Data, Star Trek", "[GNC]-Lord-MDB"],
    ["Auf geht´s, Ihr Luschen! Flip-Flops aus, Springerstiefel an!", "Ausbilder Schmidt", "Zocker"],
    ["Ich bin Mandalorianer. Waffen sind Teil meiner Religion.", "Din Djarin, Star Wars", "Zocker"],
    ["Das ist der Weg.", "Din Djarin, Star Wars", "Zocker"],
    ["Wenn du einem Mann alles nimmst, bist du derjenige der tot ist.", "Rainer Winkler", "Joernrich"],
    ["Es hat nur Vorteile wenn man fett ist. Man benötigt weniger Wasser..... beim Baden.", "Vitaly Kaminsky", "Zitateliste Chernaruskampagne (Mercurat)"],
    ["Sterben? Das ist das Letzte, was ich tun werde.", "Groucho Marx ", "Mercurat"],
    ["Menschlich seid Ihr alle ok!", "Mercurat", "Frozen_byte"],
    ["The only winning move is not to play!", "W.O.P.R. (Wargames)", "form"]
];

_quote = _quotes select (floor random (count _quotes));
private _txt = format["<t size='1.0' align='left' color='#aaaaaa'>Eingereicht von: %1</t><br/><t size='1.3' align='center'>%2</t><br/><t size='1.2' align='right' color='#cccccc'>- %3</t>", _quote select 2, _quote select 0, _quote select 1];
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