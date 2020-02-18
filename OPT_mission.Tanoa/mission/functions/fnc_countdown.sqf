/**
* Author: James
* main script for handling HandleRating time and ending mission
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [parameter] call fnc_countdown.sqf;
*
*/
#include "script_component.hpp"

// Waffenruhe abgelaufen?
if !GVARMAIN(missionStarted) exitWith {LOG_1("OPT LOG: ERROR: opt_countdown.sqf started before missionStarted=true!");};

// Logge und übertrage Punktestand mindestens alle 60 Sekunden, solange Spiel noch läuft
while {_timeElapsed = (serverTime - GVAR(startTime)); (GVARMAIN(csat_win) == 0 && GVARMAIN(nato_win) == 0 && GVARMAIN(draw) == 0 && (OPT_PARAM_PLAYTIME - _timeElapsed) > 59)} do
{
	switch (GVARMAIN(dominator)) do
	{
		case (east) :
		{
			GVARMAIN(csat_points_f) = GVARMAIN(csat_points_f) + (1 / 60);	// 1 Punkt pro Minute
			publicVariable QGVARMAIN(csat_points_f);
			if (round csat_points_f > csat_points) then
			{
				GVARMAIN(csat_points) = round GVARMAIN(csat_points_f);	// übernahme in bisherige integer-zählweise
				publicVariable QGVARMAIN(csat_points);
				GVARMAIN(points_logtime) = serverTime;
				publicVariable QGVARMAIN(points_logtime);
				systemChat "NATO: +1 Punkt";
				_message = format ["NATO +1 (NATO %1 | CSAT %2)", GVARMAIN(nato_points), GVARMAIN(csat_points)];
				["Punkte", _message] remoteExecCall [QEFUNC(log,write), 2, false];
			};
		};
		case (west) :
		{
			GVARMAIN(nato_points_f) = GVARMAIN(nato_points_f) + (1 / 60);	// 1 Punkt pro Minute
			publicVariable QGVARMAIN(nato_points_f);
			if (round nato_points_f > nato_points) then
			{
				GVARMAIN(nato_points) = round GVARMAIN(nato_points_f);	// übernahme in bisherige integer-zählweise
				publicVariable QGVARMAIN(nato_points);
				GVARMAIN(points_logtime) = serverTime;
				publicVariable QGVARMAIN(points_logtime);
				systemChat "NATO: +1 Punkt";
				_message = format ["NATO +1 (NATO %1 | CSAT %2)", GVARMAIN(nato_points), GVARMAIN(csat_points)];
				["Punkte", _message] remoteExecCall [QEFUNC(log,write), 2, false];
			};
		};
		default
		{
			if ((serverTime - GVARMAIN(points_logtime)) >= 60) then // letzter logeintrag 1 Minute alt?
			{
				GVARMAIN(points_logtime) = serverTime;
				publicVariable QGVARMAIN(points_logtime);
				_message = format ["Kein Dominator (NATO %1 | CSAT %2)", GVARMAIN(nato_points), GVARMAIN(csat_points)];
				["Punkte", _message] call EFUNC(log,write);
			};
		};
	uiSleep 1;
}; 


// wait last seconds exactly until mission ends
waitUntil { _timeElapsed = (serverTime - GVAR(startTime)); (OPT_PARAM_PLAYTIME - _timeElapsed) < 0; };

[] call EFUNC(log,writeEndState);

[] remoteExec [QFUNC(endMission), -2, true]; // call end script on all clients

// serverside mission-ending - only when in training mode
// (if used in war mode, it would confuse the log-parser)
if (EGVAR(training,on)) then {
	"SideScore" call BIS_fnc_endMissionServer;
};
