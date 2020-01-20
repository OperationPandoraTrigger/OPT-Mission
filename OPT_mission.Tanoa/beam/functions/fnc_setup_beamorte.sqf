/**
* Description:
* setup available beam locations with their respective level
* setup heavy vehicle classnames
* setup beam trigger variable names
*
* Author:
* Lord & James
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
* no - should be called only once by XEH_PreInit.sqf at mission start
*
* Global:
* no 
*
* Sideeffects:
* Define global variables
* GVAR(locations_west), GVAR(locations_east), GVAR(restricted_vehicles), GVAR(beam_vehicles), GVAR(beam_trigger) 
*
* Example:
* [parameter] call EFUNC(fnc_setup_beamOrte.sqf);
*
* Usage:
* Position=[0, 0, 0] 
* Name = "ABC"
* Level = {-1; 0; 1; 2; 3}
* [[Position], Name, Level]
* 
* Level:
* 0 = not available
* 1 = infantry only
* 2 = infantry + vehicles
* 3 = infantry + vehicles + restricted vehicles 
* 4 = available after mission start for certain beam vehicles
*/

#include "script_component.hpp"

//West
GVAR(locations_west) =
[
    [[6916,0,12438], "Beampunkt 1", 4],
    [[20429,0,9569], "Beampunkt 2", 0],
    [[0,0,0], "Beampunkt 3", 0],
    [[0,0,0], "Marine Basis",0],
    [[0,0,0], "FOB", 0],

      
	   [[9343,0,13455], "-T2 - OPT Panschbude",1], 
	   [[2953,0,9435], "098 - Sosovu Graben",0], 
	   [[4278,0,8433], "058 - Altes BDepot",0],
	   
	   [[26731,0,24638], "60 - Molos Airbase",0], 
	   [[26989,0,23206], "61 - Molos Town",0], 
	   [[25420,0,20338], "62 - Refinery",0] 
];

//East
GVAR(locations_east) =
[
    [[11778,0,11517], "Beampunkt 1", 4],
    [[23652,0,20038], "Beampunkt 2", 0],
    [[0,0,0], "Beampunkt 3", 0],
    [[0,0,0], "Marine Basis", 0],
    [[0,0,0], "FOB", 0],
	
       
	   [[9880,0,13377], "T2 - Tackobar",1],
	   [[2191,0,11213], "116 - Oppas Kassino",0],
	   [[4060,0,11760], "118 - neue Nato Brücke",0],
	   
	   [[26731,0,24638], "60 - Molos Airbase",0],
	   [[26989,0,23206], "61 - Molos Town",0],
	   [[25420,0,20338], "62 - Refinery",0]
];

/* vehicles requiring special clearance for beaming (eg. tanks) */
GVAR(restricted_vehicles) = 
[
	//West
	"OPT4_B_APC_Tracked_01_rcws_F",					// Panther
	"OPT4_B_APC_Wheeled_01_cannon_F",				// Marshall
	"OPT4_B_APC_Tracked_01_AA_F",					// Cheetah
	"OPT4_B_APC_tracked_03_cannon_F",				// Mora
	"OPT4_B_MBT_01_TUSK_F",							// Slammer UP
	"OPT4_B_MBT_01_arty_F",							// Scorcher
	"OPT_B_MBT_01_mlrs_F",							// Sandstorm
	"OPT4_B_LSV_01_AT_F",							// Prowler AT
	//East
	"OPT4_O_APC_Wheeled_02_rcws_F",					// Marid
	"OPT4_O_APC_Wheeled_03_cannon_F",				// Gorgon
	"OPT4_O_APC_Tracked_02_AA_F",					// Tigris
	"OPT4_O_APC_Tracked_02_cannon_F",				// Kamysh 
	"OPT4_O_MBT_02_cannon_F",						// Varsuk
	"OPT4_O_MBT_02_arty_F",							// Sochor
	"OPT_O_Truck_02_MRL_F",							// Zamak MRL
	"OPT4_O_LSV_02_AT_F"							// Qilin AT
];

/* vehicles usable for beaming after mission start */
GVAR(beam_vehicles) =
[
	//BLUFOR
	"OPT_B_Truck_01_covered_F",						//HEMTT Abgedeckt
	"OPT_B_Truck_01_Repair_F",						//HEMTT Reparatur
	"OPT_B_Truck_01_medical_F", 					//HEMTT Medic
	"OPT_B_Quadbike_01_F",							//Quadbike NATO
	"OPT_B_G_Offroad_01_F",							//Pickup

	//Bluefor Tropentarn
	"OPT_B_G_Offroad_01_ghex_F",					//Pickup Tropentarn
	"OPT_B_Quadbike_01_ghex_F",
	"OPT_B_Truck_01_medical_ghex_F",
	"OPT_B_Truck_01_covered_ghex_F",				//HEMTT Abgedeckt

	//OPFOR hextarn
	"OPT_O_Truck_03_covered_F",						//Tempest Abgedeckt
	"OPT_O_Truck_03_repair_F",						//Tempest Reparatur
	"OPT_O_Truck_03_medical_F",						//Tempest Medic
	"OPT_O_Quadbike_01_F",							//Quadbike CSAT
	"OPT_O_G_Offroad_01_F",							//Pickup

	//OPFOR tropentarn
	"OPT_O_T_Truck_03_covered_ghex_F",				//Tempest Abgedeckt
	"OPT_O_T_Truck_03_repair_ghex_F",				//Tempest Reparatur
	"OPT_O_T_Truck_03_medical_ghex_F",				//Tempest Medic
	"OPT_O_T_Quadbike_01_ghex_F"					//Quadbike CSAT
];	

/* List of triggers in Editor for beam functionality */
GVAR(beam_trigger) = 
[
    nato_trigger_beam,
    nato_trigger_beam_1,
    csat_trigger_beam_4,
    csat_trigger_beam_3,
	csat_trigger_beam_5,
	csat_trigger_beam_6
];

