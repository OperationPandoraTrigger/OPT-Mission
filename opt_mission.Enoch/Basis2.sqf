
private _Basis = "";

if (PLAYERSIDE == east) then
{
    _Basis = Teleport_CSAT_Basis2;

};
if (PLAYERSIDE == west) then
{
    _Basis = Teleport_NATO_Basis2;

};
if (PLAYERSIDE == independent) then
{
    _Basis = Teleport_AAF_Basis2;

};

(["Basis"] call BIS_fnc_rscLayer) cutText ["Teleport...", "BLACK OUT", 3]; // fade out in black

// beam player
vehicle player setPosASL [(random 100) - 50, (random 100) - 50, 1000 + random 100];
vehicle player setVectorUp [0,0,1];
vehicle player setPosASL (getPosASL _Basis vectorAdd [(random 2) + 2, (random 2) + 2, 0.2]);

 
(["Basis"] call BIS_fnc_rscLayer) cutText ["", "BLACK IN", 3]; // return to game

 







