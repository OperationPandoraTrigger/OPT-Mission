/**
* Author: James
* spawn a vehicle 
*
* Arguments:
* 0: <OBJECT> unit which send the order
* 1: <string> classname to spawn
* 2: <OBJECT> nearest spawn pos
* 3: <NUMBER> unit cost
*
* Return Value:
* None
*
* Example:
* [parameter] call fnc_spawnVehicle.sqf;
*
*/
#include "script_component.hpp"

params ["_unit", "_vecType", "_spawnObj", "_unitCost"];

// semaphore -> wait for other spawn processes to finish
waitUntil { !GVAR(spawnInProgress); };
GVAR(spawnInProgress) = true;

private _heightOffset = 0.1;
private _placed = 0; 

// Komplette Liste aller möglichen Kaufgegenstände erstellen
private _items = [];
{ _items append (_x select [0,1]); } forEach OPT_warehouse_all;

// Fahrzeug schonmal spawnen (notwendig für Größenermittlung)
_vec = createVehicle [_vecType, [(random 100) - 50, (random 100) - 50, 1000 + random 100], [], 0, "NONE"];
if (typeName _spawnObj == "OBJECT") then { _vec setDir (getDir _spawnObj); };
private _scanRadius = sizeOf _vecType;

// debug...
// hintSilent str _scanRadius;

// Kleine Gegenstände nicht zu nah beisammen spawnen
if (_scanRadius < 2) then { _scanRadius = 2; };

// Große Gegenstände (wie z.B. der Huron) sollen ihren Platzbedarf mal nicht so übertreiben
if (_scanRadius > 20) then { _scanRadius = 20; };

private _spiralMaxPoints = 100; 
private _spiralDistance = 0.005;

// Spiralförmig vom Mittelpunkt aus nach Freifläche suchen
for "_i" from 0 to _spiralMaxPoints step 1 do 
{ 
	scopeName "scan"; 
	private _angle = 23 * _i; 
	private _x = _spiralDistance * _angle * cos _angle; 
	private _y = _spiralDistance * _angle * sin _angle; 
	private _posi = getPosASL _spawnObj vectorAdd [_x, _y, _heightOffset];

	// Ist etwas gefährliches im Weg?
	// Liste aller Basis-Klassen: https://forums.bohemia.net/forums/topic/202400-list-of-vehicle-base-classes/?do=findComment&comment=3157238
	private _objList = nearestObjects [_posi, _items, _scanRadius];
	if (isNil {_objList select 0}) then 
	{ 
		// Nichts im Weg? Dann ans Ziel teleportieren!
		_vec setPosASL _posi;
		_vec setDamage 0;
		_placed = 1;

		//datalink-test-eintrag, kallek
		// _vec setVehicleReportOwnPosition true;
		// _vec setVehicleReportRemoteTargets true;
		// _vec setVehicleReceiveRemoteTargets true;

		// Create Vehicle Crew
		// James: Nutze stattdessen UAV classname aus setup
		_uavs = [
			"OPT_B_UGV_01_F",
			"OPT_B_UGV_01_rcws_F",
			"OPT_O_UGV_01_F",
			"OPT_O_UGV_01_rcws_F",
			"B_UCSV_01",
			"O_UCSV_01",
			"OPT_B_UAV_01_F",
			"OPT_O_UAV_01_F",
			"OPT_B_Static_Designator_01_F",
			"OPT_O_Static_Designator_02_F",
			"OPT_O_T_UGV_01_ghex_F"
		];

		if (_vecType in (_uavs + GVARMAIN(big_uavs))) then {
			createVehicleCrew (_vec);
			_vec setSkill 0.8;
			
			systemChat format ["shop CilbEV B:%1",(isNil "CLib_fnc_globalEvent")];
			
			//Drohnen marker erstellung für Clib
			//["OPTAddMarkerDrohneGPS",_vec] call CLib_fnc_globalEvent;

		};

		private _displayName = getText (configFile >> "CfgVehicles" >> _vecType >> "displayName");
		private _txt = format["%1 geliefert.",_displayName];
		["Bestellung", _txt, "green"] remoteExecCall [QEFUNC(gui,message), _unit, false];

		// update budget initialized by server!
		[UNIT_NAME(_unit), UNIT_SIDE(_unit), _vecType, _unitCost, "-"] call EFUNC(common,updateBudget);
		[] remoteExecCall [QFUNC(updateBudget), _unit, false];
		
		breakOut "scan";
	};
};

if (_placed < 1) then
{
	deleteVehicle _vec;
	hintSilent "Nicht genug Platz vorhanden!";
};

GVAR(spawnInProgress) = false;
