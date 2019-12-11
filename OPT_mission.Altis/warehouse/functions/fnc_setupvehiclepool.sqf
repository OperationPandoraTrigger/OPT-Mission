/**
* Author: James
* defines all objects that can be bought and sold with prices. A price of 0 means not able to buy or sell.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call vehiclePool_war.sqf;
*
*/
#include "script_component.hpp"

#define DEF_PROD(var1) var1, GVAR(saleReturnValueForOwn) * var1,  GVAR(saleReturnValueForEnemy) * var1 // default product with 0.75 sold value for own and 1.50 for enemy

/* ANLEITUNG: 
* Jedes Fahrzeug besitzt einen Eintrag der Form [classname, Kaufpreis, Verkaufpreis für eigene Seite, Verkaufpreis für Feindseite]
* Klassname kann dem Editor mit Rechtsklick -> Log -> Classnames entnommen werden
* Kaufpreis größer 0 heißt, dass Fahrzeug steht zum Kaufen bereit, sonst taucht es nicht auf
* Verkaufspreis größer 0 heißt, das Fahrzeug kann verkauft werden, sonst taucht es nicht auf (für beide)
* DEF_PROD(PREIS) sorgt dafür, dass Kauf und Verkaufspreis automatisch bestimmt werden mit der Variable
* GVAR(saleReturnValueForOwn), die in der fnc_initCBASettings.sqf ist (aktuell 75%)
* GVAR(saleReturnValueForEnemy), die in der fnc_initCBASettings.sqf definiert ist (aktuell 150%)
* Es kann aber jedes Fahrzeug individuell angepasst werden, indem einfach manuell drei Preise eingetragen werden, z.B.
* ["OPT_B_Quadbike_01_F", 1500, 0, 0] -> nur kaufen
* ["OPT_B_Quadbike_01_F", 0, 500, 1000] -> nur verkaufen, wobei 500 für eigenes Quad, 1000 für Feind-Quad
*/

GVAR(nato_vehicles) = 
[
    ["B_T_LSV_01_armed_F", DEF_PROD(10)],  
	["I_C_Offroad_02_LMG_F", DEF_PROD(10)],
    ["B_G_Offroad_01_armed_F", DEF_PROD(10)]   
];

// Fahrzeuge dieser Liste können nicht verkauft werden!
GVAR(nato_vehicles_supply) = 
[
    ["B_Truck_01_ammo_F", DEF_PROD(0)],                 // HEMTT Ammo, 50000 ersetzt durch Container
    ["B_Truck_01_fuel_F", DEF_PROD(0)]                  // HEMTT Fuel, 10000 ersetzt durch Container
];
    
GVAR(nato_choppers) = 
[
    ["B_T_VTOL_01_armed_blue_F", DEF_PROD(10)],          
    ["B_Heli_Transport_01_F", DEF_PROD(10)],  
    ["B_Heli_Light_01_F", DEF_PROD(10)],   
    ["B_Heli_Transport_03_black_F", DEF_PROD(10)],          
    ["B_Heli_Light_01_dynamicLoadout_F", DEF_PROD(10)]   
];
    
GVAR(nato_armored) = 
[
    ["B_T_LSV_01_armed_F", DEF_PROD(0)],   
    ["B_G_Offroad_01_armed_F", DEF_PROD(0)]  
];

GVAR(nato_supplies) = 
[
    ["B_T_VTOL_01_armed_F", DEF_PROD(0)],          
    ["B_Heli_Transport_01_F", DEF_PROD(0)],               
    ["B_Heli_Light_01_dynamicLoadout_F", DEF_PROD(0)]   
];

GVAR(nato_static) = 
[
    ["B_T_VTOL_01_armed_F", DEF_PROD(0)],          
    ["B_Heli_Transport_01_F", DEF_PROD(0)],               
    ["B_Heli_Light_01_dynamicLoadout_F", DEF_PROD(0)]   
];

GVAR(nato_sea) = 
[
    ["B_Boat_Armed_01_minigun_F", DEF_PROD(0)],         // Speedboat Minigun
    ["B_Boat_Transport_01_F", DEF_PROD(0)],               // Assault Boat
    ["B_SDV_01_F", DEF_PROD(0)],                         // Submarine
    ["B_C_Boat_Transport_02_F", DEF_PROD(0)]             // Rhib unbewaffnet
];

GVAR(csat_vehicles) = 
[
    ["O_T_LSV_02_armed_F", DEF_PROD(10)],   
	["I_C_Offroad_02_LMG_F", DEF_PROD(10)],
    ["O_G_Offroad_01_armed_F", DEF_PROD(10)]   
];

// Fahrzeuge dieser Liste knnen nicht verkauft werden!
GVAR(csat_vehicles_supply) = 
[
    ["O_T_Truck_03_ammo_ghex_F", DEF_PROD(0)],              // Tempest Ammo, ersetzt durch container 50000
    ["O_T_Truck_03_fuel_ghex_F", DEF_PROD(0)],              // Tempest Fuel, ersetzt durch container 10000
    ["O_Truck_03_ammo_F", DEF_PROD(0)],                 // Tempest Ammo, ersetzt durch container
    ["O_Truck_03_fuel_F", DEF_PROD(0)]                  // Tempest Fuel, ersetzt durch container
];

GVAR(csat_choppers) = 
[
    ["B_T_VTOL_01_armed_F", DEF_PROD(10)],          
    ["B_CTRG_Heli_Transport_01_sand_F", DEF_PROD(10)],  
    ["B_Heli_Light_01_F", DEF_PROD(10)],   
    ["B_Heli_Transport_03_F", DEF_PROD(10)],          
    ["B_Heli_Light_01_dynamicLoadout_F", DEF_PROD(10)]  
];
    
GVAR(csat_armored) = 
[
    ["B_T_LSV_01_armed_F", DEF_PROD(0)],   
    ["B_G_Offroad_01_armed_F", DEF_PROD(0)]   
];

GVAR(csat_supplies) = 
[
    ["B_T_VTOL_01_armed_F", DEF_PROD(0)],          
    ["B_Heli_Transport_01_F", DEF_PROD(0)],               
    ["B_Heli_Light_01_dynamicLoadout_F", DEF_PROD(0)]   
];

GVAR(csat_static) = 
[
    ["B_T_VTOL_01_armed_F", DEF_PROD(0)],          
    ["B_Heli_Transport_01_F", DEF_PROD(0)],               
    ["B_Heli_Light_01_dynamicLoadout_F", DEF_PROD(0)]   
];

GVAR(csat_sea) = 
[
    ["O_Boat_Transport_01_F", DEF_PROD(0)],                   // Assault Boat
    ["O_Boat_Armed_01_hmg_F", DEF_PROD(0)],                 // Speedboat HMG
    ["O_C_Boat_Transport_02_F", DEF_PROD(0)],                // rhib unbewaffnet
    ["O_SDV_01_F", DEF_PROD(0)]                              // Submarine
];

GVAR(allNato) = GVAR(nato_vehicles) +
GVAR(nato_vehicles_supply) +
GVAR(nato_choppers) +
GVAR(nato_armored) +
GVAR(nato_supplies) +
GVAR(nato_static) +
GVAR(nato_sea);

GVAR(allCsat) = GVAR(csat_vehicles) +
GVAR(csat_vehicles_supply) +
GVAR(csat_choppers) +
GVAR(csat_armored) +
GVAR(csat_supplies) +
GVAR(csat_static) + 
GVAR(csat_sea);

GVAR(all) = GVAR(allNato) + GVAR(allCsat);
