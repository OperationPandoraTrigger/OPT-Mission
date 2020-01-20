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
    ["OPT_B_Quadbike_01_F", DEF_PROD(0)],                    // Quadbike
    ["OPT_B_T_LSV_01_unarmed_F", DEF_PROD(0)],               // Prowler unarmed 
    ["OPT_B_T_LSV_01_armed_F", DEF_PROD(0)],                 // Prowler armed
    ["OPT_B_G_Offroad_01_F", DEF_PROD(0)],                   // Pickup
    ["OPT_B_G_Offroad_01_armed_F", DEF_PROD(0)],             // Pickup HMG
	["OPT_B_MRAP_01_F", DEF_PROD(0)],                        // Hunter
	["OPT4_B_MRAP_01_hmg_F", DEF_PROD(0)],                   // Hunter HMG
    ["OPT_B_Truck_01_covered_F", DEF_PROD(0)],               // HEMTT Transport
    ["OPT_B_Truck_01_Repair_F", DEF_PROD(0)],               // HEMTT Repair
    ["OPT_B_Truck_01_medical_F", DEF_PROD(0)],              // HEMTT Medical
    ["OPT_B_Truck_01_transport_F", DEF_PROD(0)],             // HEMTT  
	//Tropentarn
    ["OPT_B_Quadbike_01_ghex_F", DEF_PROD(1500)],               // Quadbike
    ["OPT_B_T_LSV_01_unarmed_ghex_F", DEF_PROD(5000)],          // Prowler unarmed 
    ["OPT_B_T_LSV_01_armed_ghex_F", DEF_PROD(8000)],            // Prowler armed
    ["OPT_B_G_Offroad_01_ghex_F", DEF_PROD(5000)],              // Pickup
    ["OPT_B_G_Offroad_01_armed_ghex_F", DEF_PROD(0)],           // Pickup HMG
	["OPT_B_MRAP_01_ghex_F", DEF_PROD(5500)],                    // Hunter
	["OPT4_B_MRAP_01_hmg_ghex_F", DEF_PROD(21000)],             // Hunter HMG
    ["OPT_B_Truck_01_covered_ghex_F", DEF_PROD(8000)],          // HEMTT Transport
    ["OPT_B_Truck_01_Repair_ghex_F", DEF_PROD(10000)],          // HEMTT Repair
    ["OPT_B_Truck_01_medical_ghex_F", DEF_PROD(10000)],         // HEMTT Medical
    ["OPT_B_Truck_01_transport_ghex_F", DEF_PROD(2000)]        // HEMTT  	
	
];

// Fahrzeuge dieser Liste können nicht verkauft werden!
GVAR(nato_vehicles_supply) = 
[
    ["OPT_B_Truck_01_ammo_F", DEF_PROD(0)],             			// HEMTT Ammo
    ["OPT_B_Truck_01_fuel_F", DEF_PROD(0)],              		// HEMTT Fuel
	//Tropentarn
    ["OPT_B_Truck_01_ammo_ghex_F", DEF_PROD(50000)],            // HEMTT Ammo
    ["OPT_B_Truck_01_fuel_ghex_F", DEF_PROD(10000)]             // HEMTT Fuel	
];	
  
GVAR(nato_choppers) = 
[
    ["OPT_B_Heli_Light_01_F", DEF_PROD(60000)],                 // MH-9 Hummingbird
    ["OPT4_B_Heli_Light_01_armed_F", DEF_PROD(0)],              // AH-9 Pawnee 
    ["OPT4_B_Heli_light_03_green_F", DEF_PROD(80000)],          // WY-55 Hellcat
    ["OPT_B_Heli_Transport_01_F", DEF_PROD(90000)],             // UH-80 Ghosthawk
	["OPT_B_Heli_Transport_02_F", DEF_PROD(0)],           	// CH-49 Mohawk (Transport+Lift)
    ["OPT_B_Heli_Transport_03_unarmed_F", DEF_PROD(110000)],    // CH-67 Huron unarmed (Transport+Lift)
    ["OPT_B_Heli_Transport_03_F", DEF_PROD(150000)],            // CH-67 Huron armed (Transport+Lift)
    ["OPT_B_UAV_02_light_F", DEF_PROD(300000)],                 // Greyhawk unbewaffnet
    ["OPT_B_UAV_02_CAS_F", DEF_PROD(0)],                        // Greyhawk LGB
    ["OPT_B_UAV_02_F", DEF_PROD(0)],                            // Greyhawk Raketen    
	["OPT4_B_Heli_Attack_01_F", DEF_PROD(0)],                   // AH-99 Blackfoot 
	["OPT_B_T_VTOL_01_infantry_F", DEF_PROD(0)],                // VTOL Blackfish (Inf-Transport) 
    ["OPT_B_T_VTOL_01_vehicle_F", DEF_PROD(0)],         	    // VTOL Blackfish (Fahrzeug-Transport)
    ["OPT_B_T_VTOL_02_infantry_unarmed_F", DEF_PROD(0)],   		// VTOL Y-32 Xi'an (Inf-Transport)
    ["OPT_B_Plane_CAS_01_F", DEF_PROD(0)],                      // A-164 Wipeout
    ["OPT_B_Plane_Fighter_01_Stealth_F", DEF_PROD(0)]               // F/A-181 Black Wasp II   
];
     
GVAR(nato_armored) = 
[
	["OPT4_B_LSV_01_AT_F", DEF_PROD(0)],                     // Prowler AT 
	["OPT4_B_MRAP_01_gmg_F", DEF_PROD(0)],                		// Hunter GMG 
    ["OPT4_B_APC_Tracked_01_rcws_F", DEF_PROD(0)],          // IFV-6c Panther
    ["OPT4_B_APC_Wheeled_01_cannon_F", DEF_PROD(0)],        // AMV-7 Marshall    
    ["OPT4_B_APC_tracked_03_cannon_F", DEF_PROD(0)],        // FV-720 Mora   
    ["OPT4_B_APC_Tracked_01_AA_F", DEF_PROD(0)],           // IFV-6a Cheetah	
    ["OPT4_B_MBT_01_cannon_F", DEF_PROD(0)],                    // M2A4 Slammer
    ["OPT4_B_MBT_01_TUSK_F", DEF_PROD(0)],                 // M2A4 SlammerUp
    ["OPT4_B_MBT_03_cannon_F", DEF_PROD(0)],                     // MBT-52 Kuma
    ["OPT4_B_MBT_01_Arty_F", DEF_PROD(0)],                       // M4 Scorcher
    ["OPT_B_MBT_01_mlrs_F", DEF_PROD(0)],                      // M5 Sandstorm    
	//Tropentarn
	["OPT4_B_LSV_01_AT_ghex_F", DEF_PROD(80000)],                     // Prowler AT
	["OPT4_B_MRAP_01_gmg_ghex_F", DEF_PROD(0)],                		// Hunter GMG
    ["OPT4_B_APC_Tracked_01_rcws_ghex_F", DEF_PROD(25000)],          // IFV-6c Panther
    ["OPT4_B_APC_Wheeled_01_cannon_ghex_F", DEF_PROD(50000)],        // AMV-7 Marshall    
    ["OPT4_B_APC_tracked_03_cannon_ghex_F", DEF_PROD(60000)],        // FV-720 Mora   
    ["OPT4_B_APC_Tracked_01_AA_ghex_F", DEF_PROD(125000)],           // IFV-6a Cheetah	
    ["OPT4_B_MBT_01_cannon_ghex_F", DEF_PROD(0)],                    // M2A4 Slammer
    ["OPT4_B_MBT_01_TUSK_ghex_F", DEF_PROD(125000)],                 // M2A4 SlammerUp
    ["OPT4_B_MBT_03_cannon_ghex_F", DEF_PROD(0)],                     // MBT-52 Kuma
    ["OPT4_B_MBT_01_Arty_ghex_F", DEF_PROD(300000)],                       // M4 Scorcher
    ["OPT_B_MBT_01_mlrs_ghex_F", DEF_PROD(400000)]                      // M5 Sandstorm  	
];

GVAR(nato_supplies) = 
[
    ["OPT_Box_NATO_Ammo_F", 40000, 10000, 20000],               // Munitionskiste
    ["OPT_Box_NATO_WpsSpecial_F", 60000, 10000, 20000],         // Munition spezial
    ["OPT_Box_NATO_Grenades_F", 75000, 10000, 20000],           // granatenkiste
    ["OPT_NATO_Sprengstoffkiste", 150000, 10000, 20000],        // sprengstoffkiste
    ["OPT_Box_NATO_WpsSpecial_AT_L1", 200000, 10000, 20000],     // AT Raketenkiste (MRAWS)
	["OPT_Box_NATO_WpsSpecial_AT_L2", 150000, 10000, 20000],     // AT Raketenkiste (PCML)
	["OPT_Box_NATO_WpsSpecial_AT_H1", 350000, 10000, 20000],     // AT Raketenkiste (Titan)
    ["OPT_Box_NATO_WpsSpecial_AA_F", 140000, 10000, 20000],      // AA Raketenkiste
    ["OPT_B_supplyCrate_F", DEF_PROD(0)],                     // Transportkiste (leer)
    ["OPT_B_CargoNet_01_ammo_F", DEF_PROD(5000)],               // Ausrstungskiste
    ["OPT_Box_NATO_WpsSpecial_Diver_F", DEF_PROD(5000)],        // Taucherkiste    
    ["OPT_B_UGV_01_F", DEF_PROD(0)],                         // UGV Stomper
	//Tropentarn
	["OPT_B_UGV_01_ghex_F", DEF_PROD(2000)],                         // UGV Stomper
    ["OPT_B_UAV_01_F", DEF_PROD(0)],                            // Darter AR-2
    ["OPT_FlexibleTank_01_forest_F", DEF_PROD(1000)],           // Treibstoff-Fass
	["OPT_B_Slingload_01_Ammo_F", 90000, 10000, 20000],        			 // Munitionscontainer
    ["OPT_B_Slingload_01_Fuel_F", DEF_PROD(8000)],              // Fuelcontainer
    ["OPT_B_Slingload_01_Repair_F", DEF_PROD(8000)],            // Reparaturcontainer
    ["OPT_B_Slingload_01_Medevac_F", DEF_PROD(0)],              // Lazarettcontainer, 5000       
    ["Land_Cargo20_white_F", DEF_PROD(0)]                      // weier Container (Lazarett)
];

GVAR(nato_static) = 
[
    ["OPT_B_HMG_01_high_F", DEF_PROD(10000)],                   // Stand-MG hoch
    ["OPT_B_HMG_01_F", DEF_PROD(10000)],                        // Stand-MG niedrig
    ["OPT_B_GMG_01_high_F", DEF_PROD(75000)],                   // Stand-GMG hoch
    ["OPT_B_GMG_01_F", DEF_PROD(75000)],                        // Stand-GMG niedrig
    ["OPT_B_static_AA_F", DEF_PROD(50000)],                     // Stand-AA
    ["OPT_B_static_AT_F", DEF_PROD(150000)],                    // Stand-AT
    ["OPT_B_Mortar_01_F", DEF_PROD(50000)],                    // MK6 - Mörser
    ["OPT_B_Static_Designator_01_F", DEF_PROD(10000)]           // Remote Designator
];

GVAR(nato_sea) = 
[
    ["OPT_B_Boat_Armed_01_minigun_F", DEF_PROD(10000)],         // Speedboat Minigun
    ["OPT_B_Boat_Transport_01_F", DEF_PROD(500)],               // Assault Boat
    ["OPT_B_SDV_01_F", DEF_PROD(2000)],                         // Submarine
    ["OPT_B_C_Boat_Transport_02_F", DEF_PROD(7000)]             // Rhib unbewaffnet
];

GVAR(csat_vehicles) = 
[
//Vanilla
    ["OPT_O_Quadbike_01_F", DEF_PROD(0)],                    // Quadbike-
    ["OPT_O_T_LSV_02_unarmed_F", DEF_PROD(0)],               // Quilin unarmed 
    ["OPT_O_T_LSV_02_armed_F", DEF_PROD(0)],                 // Quilin armed 
	["OPT_O_G_Offroad_01_F", DEF_PROD(0)],                   // Pickup
    ["OPT_O_G_Offroad_01_armed_F", DEF_PROD(0)],                // Pickup HMG
	["OPT_O_MRAP_02_F", DEF_PROD(0)],                        // Ifrit-
	["OPT4_O_MRAP_02_hmg_F", DEF_PROD(0)],                  // Ifrit HMG
    ["OPT_O_Truck_03_covered_F", DEF_PROD(0)],               // Tempest Transport
	["OPT_O_T_Truck_03_transport_F", DEF_PROD(0)],         // Tempest 
    ["OPT_O_Truck_03_repair_F", DEF_PROD(0)],               // Tempest Repair
    ["OPT_O_Truck_03_medical_F", DEF_PROD(0)],              // Tempest Medicalasa
    //Tropentarn
    ["OPT_O_T_Quadbike_01_ghex_F", DEF_PROD(1500)],                // Quadbike 
    ["OPT_O_T_LSV_02_unarmed_ghex_F", DEF_PROD(5000)],                  // Quilin unarmed 
    ["OPT_O_T_LSV_02_armed_ghex_F", DEF_PROD(8000)],                    // Quilin armed 
	["OPT_O_G_Offroad_01_F", DEF_PROD(5000)],                      // Pickup
    ["OPT_O_G_Offroad_01_armed_F", DEF_PROD(0)],                // Pickup HMG
	["OPT_O_T_MRAP_02_ghex_F", DEF_PROD(5500)],                    // Ifrit 
    ["OPT_O_T_MRAP_02_hmg_ghex_F", DEF_PROD(21000)],                // Ifrit HMG 
    ["OPT_O_T_Truck_03_covered_ghex_F", DEF_PROD(8000)],           // Tempest Transport 
	["OPT_O_T_Truck_03_transport_ghex_F", DEF_PROD(2000)],         // Tempest 
    ["OPT_O_T_Truck_03_repair_ghex_F", DEF_PROD(10000)],            // Tempest Repair
    ["OPT_O_T_Truck_03_medical_ghex_F", DEF_PROD(0)]          // Tempest Medical

];

// Fahrzeuge dieser Liste knnen nicht verkauft werden!
GVAR(csat_vehicles_supply) = 
[
    ["OPT_O_T_Truck_03_ammo_F", DEF_PROD(0)],              // Tempest Ammo
    ["OPT_O_T_Truck_03_fuel_F", DEF_PROD(0)],              // Tempest Fuel
	//Tropentarn
    ["OPT_O_T_Truck_03_ammo_ghex_F", DEF_PROD(50000)],                 // Tempest Ammo
    ["OPT_O_T_Truck_03_fuel_ghex_F", DEF_PROD(10000)]                  // Tempest Fuel
];

GVAR(csat_choppers) = 
[
    ["OPT_O_Heli_Light_01_F", DEF_PROD(60000)],                 // MH6
    ["OPT_O_Heli_Light_03_unarmed_F", DEF_PROD(0)],             // WY-55 Hellcat
    ["OPT4_O_Heli_light_03_F", DEF_PROD(0)],                    // WY-55 Hellcat
    ["OPT_O_Heli_Light_02_unarmed_F", DEF_PROD(0)],             // PO-30 Orca
    ["OPT4_O_Heli_Light_02_F", DEF_PROD(70000)],       			// PO-30 Orca
    ["OPT_O_Heli_Transport_04_covered_F", DEF_PROD(110000)],    // Mi-290 Taru (Transport)
	["OPT_O_Heli_Transport_02_F", DEF_PROD(100000)],            // CH-49 Mohawk (Transport+Lift)
    ["OPT_O_UAV_02_light_F", DEF_PROD(300000)],                 // Ababil unbewaffnet
    ["OPT_O_UAV_02_CAS_F", DEF_PROD(0)],                        // Ababil GBU-12
    ["OPT_O_UAV_02_F", DEF_PROD(0)],                            // Ababil Scalpel 
    ["OPT4_O_Heli_Attack_02_F", DEF_PROD(0)],                   // Mi-48 Kajman    
    ["OPT_O_T_VTOL_02_infantry_unarmed_F", DEF_PROD(0)],   		// VTOL Y-32 Xi'an (Inf-Transport)
    ["OPT_O_T_VTOL_02_vehicle_unarmed_F", DEF_PROD(0)],         // VTOL Y-32 Xi'an (Fahrzeug-Transport) 
    ["OPT_O_T_VTOL_01_vehicle_F", DEF_PROD(0)],            		// VTOL Blackfish (Fahrzeug-Transport)
    ["OPT_O_Plane_CAS_02_F", DEF_PROD(0)],                      // To-199 Neophron
	["OPT_O_Plane_Fighter_AA_02_F", DEF_PROD(0)],              	// To-201 Shikra 
    ["OPT_O_Plane_CAS_01_F_1" , DEF_PROD(0)],                  // Wipeout CAS 400000
	["OPT_O_Plane_Fighter_01_Stealth_F", DEF_PROD(0)]          // F/A-181 Black Wasp II  

];
    
GVAR(csat_armored) = 
[
//Vanilla
	["OPT4_O_MRAP_02_gmg_F", DEF_PROD(0)],                  // Ifrit GMG
	["OPT4_O_LSV_02_AT_F", DEF_PROD(0)],                    // Quilin AT 
    ["OPT4_O_APC_Wheeled_02_rcws_F", DEF_PROD(0)],          // MSE-3 Marid 
    ["OPT4_O_APC_Wheeled_03_cannon_F", DEF_PROD(0)],       // AFV-4 Gorgon
	["OPT4_O_APC_Tracked_02_cannon_F", DEF_PROD(0)],       // BTR-K Kamysh
	["OPT4_O_APC_Tracked_02_AA_F", DEF_PROD(0)],           // ZSU-39 Tigris
    ["OPT4_O_MBT_02_cannon_F", DEF_PROD(0)],               // T-100 Varsuk
    ["OPT4_O_MBT_02_arty_F", DEF_PROD(0)],                 // 2S9 Sochor
    ["OPT_O_Truck_02_MRL_F", DEF_PROD(0)],                 // Zamark MRL    
	//Tropentarn
	["OPT4_O_MRAP_02_gmg_ghex_F", DEF_PROD(0)],                  // Ifrit GMG
	["OPT4_O_LSV_02_AT_ghex_F", DEF_PROD(80000)],                    // Quilin AT 
    ["OPT4_O_T_APC_Wheeled_02_rcws_ghex_F", DEF_PROD(25000)],       // MSE-3 Marid 
    ["OPT4_O_APC_Wheeled_03_cannon_ghex_F", DEF_PROD(50000)],       		// AFV-4 Gorgon
	["OPT4_O_T_APC_Tracked_02_cannon_ghex_F", DEF_PROD(60000)],     // BTR-K Kamysh 
    ["OPT4_O_T_APC_Tracked_02_AA_ghex_F", DEF_PROD(125000)],         // ZSU-39 Tigris 
    ["OPT4_O_T_MBT_02_cannon_ghex_F", DEF_PROD(125000)],             // T-100 Varsuk 
    ["OPT4_O_T_MBT_02_arty_ghex_F", DEF_PROD(300000)],               // 2S9 Sochor 
	["OPT_O_Truck_02_MRL_ghex_F", DEF_PROD(400000)]                 // Zamark MRL  
];

GVAR(csat_supplies) = 
[
    ["OPT_Box_East_Ammo_F", 40000, 10000, 20000],                           // Munitionskiste
    ["OPT_Box_East_WpsSpecial_F", 60000, 10000, 20000],                     // Munition spezial kiste
    ["OPT_Box_East_Grenades_F", 75000, 10000, 20000],                       // granatenkiste
    ["OPT_CSAT_Sprengstoffkiste", 150000, 10000, 20000],                    // sprengstoffkiste
    ["OPT_Box_East_WpsSpecial_AT_L1", 200000, 10000, 20000],                  // AT Raketenkiste (RPG-42)
	["OPT_Box_East_WpsSpecial_AT_L2", 150000, 10000, 20000],                  // AT Raketenkiste (RPG-7)
	["OPT_Box_East_WpsSpecial_AT_H1", 350000, 10000, 20000],                  // AT Raketenkiste (9M135 Vorona)
    ["OPT_Box_East_WpsSpecial_AA_F", 140000, 10000, 20000],                  // AA Raketenkiste
    ["OPT_O_supplyCrate_F", DEF_PROD(0)],                                 // Transportkiste
    ["OPT_O_CargoNet_01_ammo_F", DEF_PROD(5000)],                           // Ausrstungskiste
    ["OPT_Box_East_WpsSpecial_Diver_F", DEF_PROD(5000)],                    // Taucherkiste
	["OPT_O_UGV_01_F", DEF_PROD(0)],                                     // UGV Saif
	//Tropentarn
    ["OPT_O_T_UGV_01_ghex_F", DEF_PROD(2000)],                                 // UGV Saif    
    ["OPT_O_UAV_01_F", DEF_PROD(0)],                                        // Tayran AR-2
    ["OPT_FlexibleTank_01_sand_F", DEF_PROD(1000)],                         // Treibstoff-Fass
    ["OPT_Land_Pod_Heli_Transport_04_fuel_F", DEF_PROD(8000)],              // Fuelcontainer
    ["OPT_Land_Pod_Heli_Transport_04_ammo_F", 90000, 10000, 20000],        // Munitionscontainer
    ["OPT_Land_Pod_Heli_Transport_04_repair_F", DEF_PROD(8000)],            // Reparaturcontainer - 8000 aktuell raus wegen nix funktional!
	["OPT_Land_Pod_Heli_Transport_04_medevac_F", DEF_PROD(0)]             // Lazarettcontainer
];

GVAR(csat_static) = 
[
    ["OPT_O_HMG_01_high_F", DEF_PROD(10000)],                       // Stand-MG hoch
    ["OPT_O_HMG_01_F", DEF_PROD(10000)],                            // Stand-MG niedrig
    ["OPT_O_GMG_01_high_F", DEF_PROD(75000)],                       // Stand-GMG hoch
    ["OPT_O_GMG_01_F", DEF_PROD(75000)],                            // Stand-GMG niedrig
    ["OPT_O_static_AA_F", DEF_PROD(50000)],                         // Stand-AA
    ["OPT_O_static_AT_F", DEF_PROD(150000)],                        // Stand-AT
    ["OPT_O_Mortar_01_F", DEF_PROD(50000)],                         // MK6 Mrser
    ["OPT_O_Static_Designator_02_F", DEF_PROD(10000)]               // Remote Designator
];

GVAR(csat_sea) = 
[
    ["OPT_O_Boat_Transport_01_F", DEF_PROD(500)],                   // Assault Boat
    ["OPT_O_Boat_Armed_01_hmg_F", DEF_PROD(14000)],                 // Speedboat HMG
    ["OPT_O_C_Boat_Transport_02_F", DEF_PROD(7000)],                // rhib unbewaffnet
    ["OPT_O_SDV_01_F", DEF_PROD(2000)]                              // Submarine
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
