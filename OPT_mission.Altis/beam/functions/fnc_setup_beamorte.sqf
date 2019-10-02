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
    [[25680,0,20031], "Beampunkt 1", 4],
    [[13643,0,18620], "Beampunkt 2", 4],
    [[0,0,0], "Beampunkt 3", 0],
    [[0,0,0], "Marine Basis",0],
    [[0,0,0], "FOB", 0],

       [[4925.6323,341.19653,21895.656], "1 - Thronos Burg",0], // 1 - Thronos_castle
	   [[4582.2017,299.6069,21385.365], "2 - Oreokastro",0], // 2 - Oreokastro
	   [[4910.3472,197.1022,19458.254], "3 - Waffenlager Nord West",0], // 3 - Waffenlager_Nord_West
	   [[3360.3782,67.56945,18310.93], "4 - Villa Constans",0], // 4 - Villa_Constans

	   [[5410.8721,76.737549,17909.359], "5 - Mine Gore",0], // 5 - Mine_Gore
	   [[6181.8838,43.000999,16256.253], "6 - Pennerhotel",0], // 6 - Pennerhotel
	   [[4267.708,28.040495,13902.733], "7 - Checkpoint Charlie",0], // 7 - Checkpoint_charlie
	   [[3723.6956,18.555311,12999.2], "8 - Die Dächer von Kavala",0], // 8 - Die Dächer von Kavala

	   [[5940.9346,101.7437,12461.137], "9 - Lager Panagiotis",0], // 9 - Lager_Panagiotis
	   [[7233.4165,4.3041649,11030.594], "10 - Edessa",0], // 10 - Edessa
	   [[9684.7617,3.5207906,22269.395], "11 - Krya Nera",0], // 11 - Krya_Nera
	   [[8532.0986,68.093964,20879.943], "12 - Abdera Farm",0], // 12 - Abdera_Farm
	   
	   [[9410.1563,118.25887,20300.502], "13 - Abdera Rathaus",0], // 13 - Abdera_Rathaus
	   [[10405.196,120.67762,19023.145], "14 - Galati Alte Post",0], // 14 - Galati_alte_Post
	   [[7533.3193,134.73981,18346.297], "15 - Enklave Syrta",0], // 15 - Enclave_Syrta

	   [[7111.4897,111.96675,16438.803], "16 - Kore Zentrum",0], // 16 - Kore_Zentrum
	   [[9196.6797,120.77501,15821.593], "17 - Checkpoint Agios Dionysios",0], // 17 - Checkpoint Agios Dionisos
	   [[9301.5342,30.298265,13664.528], "18 - Xirolimni Damm",0], // 18 - Xirolimni_Damm",1
	   
	   [[9468.4805,26.262537,8236.5488], "19 - Hühnerfarm Sfaka",0], // 19 - Hühnerfarm_Sfaka

	   [[12318.005,20.195953,22856.318], "20 - Tonos Bucht",0], // 20 - Tonos_Bucht
	   [[13013.089,32.230129,19448.695], "21 - Checkpoint Ifestonia",0], // Checkpoint_Ifestonia
	   [[12672.666,34.210361,16390.48], "22 - Lacca Fabrik",0], // 22 - Lacca_Fabrik

	   [[13248.13,13.200888,14947.823], "23 - Stavros Radar",0], // 23 - Stavros_Radar
	   [[12151.891,9.668313,14330.698], "24 - Neochori Wollmarkt",0], // 24 - Neochori_Wollmarkt
	   [[11105.64,19.684849,13325.393], "25 - Poliakko alte Brennerei",0], // 25 - Poliakko_alte_Brennerei
	   
	   [[10675.173,16.757935,12266.578], "26 - Therisa Markt",0], // 26 - Therisa_Markt
	   [[10819.854,6.4413772,10859.053], "27 - Drimea Fährstation",0], // 27 - Drimea_Fährstation
	   [[11562.51,77.303802,7045.9185], "28 - Egino Farmhaus",0], // 28 - Egino_Farmhaus
  
	   [[14266.871,43.789253,22215.367], "29 - Hanf Plantage Frini",0], // 29 - Hanf_Plantage_Frini 
	   [[14716.515,46.701706,20735.465], "30 - Frini Polizeistation",0], // 30 - Frini_Polizeistation
	   [[14320.399,36.900391,18909.221], "31 - Athira Factory",0], // 31 - Athira_Factory
	   
	   [[14937.858,17.528454,17153.338], "32 - Airbase Altis",0], // 32 - Airbase_Altis
	   [[13589.743,16.363777,12166.921], "33 - Pool_party",1], // 33 - Pool_party
	   [[11908.478,15.18861,9707.3877], "34 - Alpaka Residenz",0], // 34 - Alpaka_Residenz
	   
	   [[16587.895,35.317459,19002.33], "35 - Kalithea Kontrolltower",0], // 35 - Kalithea_Kontrolltower
	   
	   [[16451.031,24.131969,17237.797], "36 - Thelos Zentrum",1], // 36 - Thelos_Zentrum
	   [[16681.539,18.231377,16143.08], "37 - Athira Kirchplatz",1], // 37 - Athira_Kirchplatz
	   [[16703.346,10.311413,13522.601], "38 - D_Day",1], // 38 _ D_Day

	   [[16611.455,13.550769,12640.338], "39 - Pyrgos Zentrum",0], // 39 - Pyrgos_Zentrum
	   [[17769.818,41.113083,10566.192], "40 - Ekali Stones",0], // 40 - Ekali Stones 
	   [[19406.996,50.685932,7955.5903], "41 - Lonely",0], // 42 - Lonely

	   [[18943.773,28.606129,16660.947], "42 - Rodopoli Graveyard",0], // 42 - Rodopoli Graveyard
	   [[18420.234,49.431179,15511.571], "43 - Charkia Storage",0], // 43 - Charkia Storage
	   [[18147.764,25.077732,15225.152], "44 - Charkia",0], // 44 - Charkia

	   [[19702.965,89.270676,12960.619], "45 - Dorida Woods",0], // 45 - Dorida Woods
	   [[20155.959,41.908695,11718.664], "46 - Chalikea",0], // 46 - Chalikea
	   [[20555.693,39.293385,9022.5293], "47 - Panagia",0], // 47 - Panagia
	   
	   [[20907.025,34.035168,6664.6289], "48 - Selakano",0], // 48 - Selakano
	   [[20092.324,17.621887,20026.533], "49 - Pefka Colloseum",0], // 49 - Pefka Colloseum
	   [[20958.469,15.521555,19261.99], "50 - Pefkas Lab",0], // 50 - Pefkas Lab
	   
	   [[20961.982,42.085556,16967.162], "51 - Paros",0], // 51 - Paros
	   [[21373.045,18.855602,16254.126], "52 - Kalochori",0], // 52 - Kalochori
	   [[21185.318,2.11974,14617.707], "53 - Limni Swamp",0], // 53 - Limni Swamp
	   
	   [[22010.072,29.125452,21064.441], "54 - Pefkas Palace",0], // 54 - Pefkas Palace
	   [[22283.615,14.165822,18499.398], "55 - Almyra West",0], // 55 - Almyra West
	   [[22541.662,13.056,16464.963], "56 - Almyra South",0], // 56 - Almyra South
	   
	   [[23371.816,3.9426758,24183.539], "57 - Sideras",0], // 57 - Sideras
	   [[23466.807,90.535362,21137.943], "58 - Delfinaki Military",0], // 58 - Delfinaki Military
	   [[24755.986,3.8023796,19153.188], "59 - Almyra North",0], // 59 - Almyra North
	   
	   [[26731.115,20.005753,24638.008], "60 - Molos Airbase",0], // 60 - Molos Airbase
	   [[26989.885,20.367672,23206.453], "61 - Molos Town",0], // 61 - Molos Town
	   [[25420.861,10.028322,20338.611], "62 - Refinery",0] // 62 - Refinery
];

//East
GVAR(locations_east) =
[
    [[12763,0,14473], "Beampunkt 1", 4],
    [[20652,0,9023], "Beampunkt 2", 4],
    [[0,0,0], "Beampunkt 3", 0],
    [[0,0,0], "Marine Basis", 0],
    [[0,0,0], "FOB", 0],
	
        [[4925.6323,341.19653,21895.656], "1 - Throns castel",0], // 1 - Throns_castel
	   [[4582.2017,299.6069,21385.365], "2 - Oreokastro",0], // 2 - Oreokastro
	   [[4910.3472,197.1022,19458.254], "3 - Waffenlager Nord West",0], // 3 - Waffenlager_Nord_West
	   [[3360.3782,67.56945,18310.93], "4 - Villa Constans",0], // 4 - Villa_Constans

	   [[5410.8721,76.737549,17909.359], "5 - Mine Gore",0], // 5 - Mine_Gore
	   [[6181.8838,43.000999,16256.253], "6 - Pennerhotel",0], // 6 - Pennerhotelm
	   [[4267.708,28.040495,13902.733], "7 - Checkpoint charlie",0], // 7 - Checkpoint_charlie
	   [[3723.6956,18.555311,12999.2], "8 - Die Dächer von Kavala",0], // 8 - Die Dächer von Kavala

	   [[5940.9346,101.7437,12461.137], "9 - Lager Panagiotis",0], // 9 - Lager_Panagiotis
	   [[7233.4165,4.3041649,11030.594], "10 - Edessa",0], // 10 - Edessa
	   [[9684.7617,3.5207906,22269.395], "11 - Krya Nera",0], // 11 - Krya_Nera
	   [[8532.0986,68.093964,20879.943], "12 - Abdera Farm",0], // 12 - Abdera_Farm
	   
	   [[9410.1563,118.25887,20300.502], "13 - Abdera Rathaus",0], // 13 - Abdera_Rathaus
	   [[10405.196,120.67762,19023.145], "14 - Galati Alte Post",0], // 14 - Galati_alte_Post
	   [[7533.3193,134.73981,18346.297], "15 - Enclave Syrta",0], // 15 - Enclave_Syrta

	   [[7111.4897,111.96675,16438.803], "16 - Kore Zentrum",0], // 16 - Kore_Zentrum
	   [[9196.6797,120.77501,15821.593], "17 - Checkpoint Agios Dionisos",0], // 17 - Checkpoint Agios Dionisos
	   [[9301.5342,30.298265,13664.528], "18 - Xirolimni Damm",0], // 18 - Xirolimni_Damm",1
	   
	   [[9468.4805,26.262537,8236.5488], "19 - Hühnerfarm Sfaka",0], // 19 - Hühnerfarm_Sfaka

	   [[12318.005,20.195953,22856.318], "20 - Tonos Bucht",0], // 20 - Tonos_Bucht
	   [[13013.089,32.230129,19448.695], "21 - Checkpoint Ifestonia",1], // Checkpoint_Ifestonia
	   [[12672.666,34.210361,16390.48], "22 - Lacca Fabrik",0], // 22 - Lacca_Fabrik

	   [[13248.13,13.200888,14947.823], "23 - Stavros Radar",0], // 23 - Stavros_Radar
	   [[12151.891,9.668313,14330.698], "24 - Neochori Wollmarkt",1], // 24 - Neochori_Wollmarkt
	   [[11105.64,19.684849,13325.393], "25 - Poliakko alte Brennerei",1], // 25 - Poliakko_alte_Brennerei
	   
	   [[10675.173,16.757935,12266.578], "26 - Therisa Markt",0], // 26 - Therisa_Markt
	   [[10819.854,6.4413772,10859.053], "27 - Drimea Fährstation",0], // 27 - Drimea_Fährstation
	   [[11562.51,77.303802,7045.9185], "28 - Egino Farmhaus",0], // 28 - Egino_Farmhaus
  
	   [[14266.871,43.789253,22215.367], "29 - Hanfplantage Frini",0], // 29 - Hanf_Plantage_Frini 
	   [[14716.515,46.701706,20735.465], "30 - Frini Polizeistation",0], // 30 - Frini_Polizeistation
	   [[14320.399,36.900391,18909.221], "31 - Athira Factory",1], // 31 - Athira_Factory
	   
	   [[14937.858,17.528454,17153.338], "32 - Airbase Altis",1], // 32 - Airbase_Altis
	   [[13589.743,16.363777,12166.921], "33 - Pool Party",0], // 33 - Pool_party
	   [[11908.478,15.18861,9707.3877], "34 - Alpaka Residenz",0], // 34 - Alpaka_Residenz
	   
	   [[16587.895,35.317459,19002.33], "35 - Kalithea Kontrolltower",0], // 35 - Kalithea_Kontrolltower
	   
	   [[16451.031,24.131969,17237.797], "36 - Thelos Zentrum",0], // 36 - Thelos_Zentrum
	   [[16681.539,18.231377,16143.08], "37 - Athira Kirchplatz",0], // 37 - Athira_Kirchplatz
	   [[16703.346,10.311413,13522.601], "38 - D-Day",0], // 38 _ D_Day

	   [[16611.455,13.550769,12640.338], "39 - Pyrgos Zentrum",0], // 39 - Pyrgos_Zentrum
	   [[17769.818,41.113083,10566.192], "40 - Ekali Stones",0], // 40 - Ekali Stones 
	   [[19406.996,50.685932,7955.5903], "41 - Lonely",0], // 42 - Lonely

	   [[18943.773,28.606129,16660.947], "42 - Rodopoli Graveyard",0], // 42 - Rodopoli Graveyard
	   [[18420.234,49.431179,15511.571], "43 - Charkia Storage",0], // 43 - Charkia Storage
	   [[18147.764,25.077732,15225.152], "44 - Charkia",0], // 44 - Charkia

	   [[19702.965,89.270676,12960.619], "45 - Dorida Woods",0], // 45 - Dorida Woods
	   [[20155.959,41.908695,11718.664], "46 - Chalikea",0], // 46 - Chalikea
	   [[20555.693,39.293385,9022.5293], "47 - Panagia",0], // 47 - Panagia
	   
	   [[20907.025,34.035168,6664.6289], "48 - Selakano",0], // 48 - Selakano
	   [[20092.324,17.621887,20026.533], "49 - Pefka Colloseum",0], // 49 - Pefka Colloseum
	   [[20958.469,15.521555,19261.99], "50 - Pefkas Forschungszentrum",0], // 50 - Pefkas Lab
	   
	   [[20961.982,42.085556,16967.162], "51 - Paros",0], // 51 - Paros
	   [[21373.045,18.855602,16254.126], "52 - Kalochori",0], // 52 - Kalochori
	   [[21185.318,2.11974,14617.707], "53 - Limni Swamp",0], // 53 - Limni Swamp
	   
	   [[22010.072,29.125452,21064.441], "54 - Pefkas Palace",0], // 54 - Pefkas Palace
	   [[22283.615,14.165822,18499.398], "55 - Almyra West",0], // 55 - Almyra West
	   [[22541.662,13.056,16464.963], "56 - Almyra South",0], // 56 - Almyra South
	   
	   [[23371.816,3.9426758,24183.539], "57 - Sideras",0], // 57 - Sideras
	   [[23466.807,90.535362,21137.943], "58 - Delfinaki Military",0], // 58 - Delfinaki Military
	   [[24755.986,3.8023796,19153.188], "59 - Almyra North",0], // 59 - Almyra North
	   
	   [[26731.115,20.005753,24638.008], "60 - Molos Airbase",0], // 60 - Molos Airbase
	   [[26989.885,20.367672,23206.453], "61 - Molos Town",0], // 61 - Molos Town
	   [[25420.861,10.028322,20338.611], "62 - Refinery",0] // 62 - Refinery

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
