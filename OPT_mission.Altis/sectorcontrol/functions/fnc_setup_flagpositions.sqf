/*
Diese Datei enthält alle Flaggenpositionen aufgeteilt in NATO und CSAT.
Jede Flagge besitzt Koordinaten (x,y) sowie die owner Seite, die im Besitz der Flagge ist.
Demnach muss nach jeder Schlacht nur der owner angepasst werden.
west -> Angriffsziel für CSAT
east -> Angriffsziel für NATO
*/
#include "script_component.hpp"

GVARMAIN(nato_flags_pos) = [

// Basis 
	   [4913, 21907, west,"1 - Throns castel",true], // 1 - Throns_castel
	   [4618, 21363, west,"2 - Oreokastro",true], // 2 - Oreokastro
	   [4872, 19455, west,"3 - Waffenlager Nord West",true], // 3 - Waffenlager_Nord_West
	   [3354, 18329, west,"4 - Villa Constans",true], // 4 - Villa_Constans

	   [5398, 17888, west,"5 - Mine Gore",true], // 5 - Mine_Gore
	   [6210, 16240, west,"6 - Kore Fabrik",true], // 6 - Kore_Fabrik
	   [4264, 13929, west,"7 - Checkpoint charlie",true], // 7 - Checkpoint_charlie
	   [3739, 12997, west,"8 - Kavala Hospital",true], // 8 - Kavala_Hospital

	   [5924, 12469, west,"9 - Lager Panagiotis",true], // 9 - Lager_Panagiotis
	   [12608, 14284, west,"10 - Edessa",true], // 10 - Edessa
	   [9710, 22282, west,"11 - Krya Nera",true], // 11 - Krya_Nera
	   [8560, 20883, west,"12 - Abdera Farm",true], // 12 - Abdera_Farm
	   
	   [9423, 20273, west,"13 - Abdera Rathaus",true], // 13 - Abdera_Rathaus
	   [10351, 19030, west,"14 - Galati alte Post",true], // 14 - Galati_alte_Post
	   [7515, 18333, west,"15 - Enclave Syrta",true], // 15 - Enclave_Syrta

	   [7174, 16468, west,"16 - Kore Zentrum",true], // 16 - Kore_Zentrum
	   [9239, 15829, west,"17 - Checkpoint Agios Dionisos",true], // 17 - Checkpoint Agios Dionisos
	   [9321, 13699, west,"18 - Xirolimni Damm",true], // 18 - Xirolimni_Damm",true
	   
	   [9489, 8236, west,"19 - Hühnerfarm Sfaka",true], // 19 - Hühnerfarm_Sfaka

	   [12346, 22844, west,"20 - Tonos Bucht",true], // 20 - Tonos_Bucht
	   [13054, 19448, west,"21 - Checkpoint Ifestonia",true], // Checkpoint_Ifestonia
	   [12634, 16399, west,"22 - Lacca Fabrik",true], // 22 - Lacca_Fabrik

	   [13273, 14969, west,"23 - Stavros Radar",true], // 23 - Stavros_Radar
	   [12178, 14352, west,"24 - Neochori Wollmarkt",true], // 24 - Neochori_Wollmarkt
	   [11083, 13363, west,"25 - Poliakko alte Brennerei",true], // 25 - Poliakko_alte_Brennerei
	   
	   [10676, 12234, west,"26 - Therisa Markt",true], // 26 - Therisa_Markt
	   [10795, 10868, west,"27 - Drimea Fährstation",true], // 27 - Drimea_Fährstation
	   [11536, 7047, west,"28 - Egino Farmhaus",true], // 28 - Egino_Farmhaus
  
	   [14283, 22224, west,"29 - Hanf Plantage Frini",true], // 29 - Hanf_Plantage_Frini 
	   [14752, 20733, west,"30 - Frini Polizeistation",true], // 30 - Frini_Polizeistation
	   [14325, 18928, west,"31 - Athira Factory",true], // 31 - Athira_Factory
	   
	   [14920, 17172, west,"32 - Airbase Altis",true], // 32 - Airbase_Altis
	   [13591, 15188, west,"33 - xxxxxxxxxxxxx",true], // 33 - xxxxxxxxxxxxx
	   [11922, 9722, west,"34 - Alpaka Residenz",true], // 34 - Alpaka_Residenz
	   
	   [16603, 19042, west,"35 - Kalithea Kontrolltower",true], // 35 - Kalithea_Kontrolltower
	   
	   [16459, 17202, west,"36 - Thelos Zentrum",true], // 36 - Thelos_Zentrum
	   [16654, 16122, west,"37 - Athira Kirchplatz",true], // 37 - Athira_Kirchplatz
	   [16720, 13548, west,"38 - xxxxxxxxxxx",true], // 38 _ xxxxxxxxxxxxxx

	   [16589, 12635, west,"39 - Pyrgos Zentrum",true], // 39 - Pyrgos_Zentrum
	   [17806, 10596, west,"40 - Ekali Stones",true], // 40 - Ekali Stones 
	   [19422, 7972, west,"41 - Lonely",true], // 42 - Lonely

	   [18897, 16660, west,"42 - Rodopoli Graveyard",true], // 42 - Rodopoli Graveyard
	   [18374, 15529, west,"43 - Charkia Storage",true], // 43 - Charkia Storage
	   [18116, 15218, west,"44 - Charkia",true], // 44 - Charkia

	   [19677, 12998, west,"45 - Dorida Woods",true], // 45 - Dorida Woods
	   [20166, 11710, west,"46 - Chalikea",true], // 46 - Chalikea
	   [20546, 9003, west,"47 - Panagia",true], // 47 - Panagia
	   
	   [20897, 6643, west,"48 - Selakano",true], // 48 - Selakano
	   [20077, 20064, west,"49 - Pefka Colloseum",true], // 49 - Pefka Colloseum
	   [20923, 19242, west,"50 - Pefkas Lab",true], // 50 - Pefkas Lab
	   
	   [20940, 17008, west,"51 - Paros",true], // 51 - Paros
	   [21365, 16285, west,"52 - Kalochori",true], // 52 - Kalochori
	   [21154, 14594, west,"53 - Limni Swamp",true], // 53 - Limni Swamp
	   
	   [21980, 21035, west,"54 - Pefkas Palace",true], // 54 - Pefkas Palace
	   [22303, 18491, west,"55 - Almyra West",true], // 55 - Almyra West
	   [22627, 16807, west,"56 - Almyra South",true], // 56 - Almyra South
	   
	   [23346, 24195, west,"57 - Sideras",true], // 57 - Sideras
	   [23467, 21158, west,"58 - Delfinaki Military",true], // 58 - Delfinaki Military
	   [24770, 19122, west,"59 - Almyra North",true], // 59 - Almyra North
	   
	   [26746, 24660, west,"60 - Molos Airbase",true], // 60 - Molos Airbase
	   [26958, 23200, west,"61 - Molos Town",true], // 61 - Molos Town
	   [25440, 20346, west,"62 - Refinery",true] // 62 - Refinery
];

GVARMAIN(csat_flags_pos) = [

//Basis 

	   [4913, 21907, east,"1 - Throns castel",true], // 1 - Throns_castel
	   [4618, 21363, east,"2 - Oreokastro",true], // 2 - Oreokastro
	   [4872, 19455, east,"3 - Waffenlager Nord West",true], // 3 - Waffenlager_Nord_West
	   [3354, 18329, east,"4 - Villa Constans",true], // 4 - Villa_Constans

	   [5398, 17888, east,"5 - Mine Gore",true], // 5 - Mine_Gore
	   [6210, 16240, east,"6 - Kore Fabrik",true], // 6 - Kore_Fabrik
	   [4264, 13929, east,"7 - Checkpoint charlie",true], // 7 - Checkpoint_charlie
	   [3739, 12997, east,"8 - Kavala Hospital",true], // 8 - Kavala_Hospital

	   [5924, 12469, east,"9 - Lager Panagiotis",true], // 9 - Lager_Panagiotis
	   [12608, 14284, east,"10 - Edessa",true], // 10 - Edessa
	   [9710, 22282, east,"11 - Krya Nera",true], // 11 - Krya_Nera
	   [8560, 20883, east,"12 - Abdera Farm",true], // 12 - Abdera_Farm
	   
	   [9423, 20273, east,"13 - Abdera Rathaus",true], // 13 - Abdera_Rathaus
	   [10351, 19030, east,"14 - Galati alte Post",true], // 14 - Galati_alte_Post
	   [7515, 18333, east,"15 - Enclave Syrta",true], // 15 - Enclave_Syrta

	   [7174, 16468, east,"16 - Kore Zentrum",true], // 16 - Kore_Zentrum
	   [9239, 15829, east,"17 - Checkpoint Agios Dionisos",true], // 17 - Checkpoint Agios Dionisos
	   [9321, 13699, east,"18 - Xirolimni Damm",true], // 18 - Xirolimni_Damm",true
	   
	   [9489, 8236, east,"19 - Hühnerfarm Sfaka",true], // 19 - Hühnerfarm_Sfaka

	   [12346, 22844, east,"20 - Tonos Bucht",true], // 20 - Tonos_Bucht
	   [13054, 19448, east,"21 - Checkpoint Ifestonia",true], // Checkpoint_Ifestonia
	   [12634, 16399, east,"22 - Lacca Fabrik",true], // 22 - Lacca_Fabrik

	   [13273, 14969, east,"23 - Stavros Radar",true], // 23 - Stavros_Radar
	   [12178, 14352, east,"24 - Neochori Wollmarkt",true], // 24 - Neochori_Wollmarkt
	   [11083, 13363, east,"25 - Poliakko alte Brennerei",true], // 25 - Poliakko_alte_Brennerei
	   
	   [10676, 12234, east,"26 - Therisa Markt",true], // 26 - Therisa_Markt
	   [10795, 10868, east,"27 - Drimea Fährstation",true], // 27 - Drimea_Fährstation
	   [11536, 7047, east,"28 - Egino Farmhaus",true], // 28 - Egino_Farmhaus
  
	   [14283, 22224, east,"29 - Hanf Plantage Frini",true], // 29 - Hanf_Plantage_Frini 
	   [14752, 20733, east,"30 - Frini Polizeistation",true], // 30 - Frini_Polizeistation
	   [14325, 18928, east,"31 - Athira Factory",true], // 31 - Athira_Factory
	   
	   [14920, 17172, east,"32 - Airbase_Altis",true], // 32 - Airbase_Altis
	   [13591, 15188, east,"33 - xxxxxxxxxxxxx",true], // 33 - xxxxxxxxxxxxx
	   [11922, 9722, east,"34 - Alpaka_Residenz",true], // 34 - Alpaka_Residenz
	   
	   [16603, 19042, east,"35 - Kalithea Kontrolltower",true], // 35 - Kalithea_Kontrolltower

	   [16459, 17202, east,"36 - Thelos Zentrum",true], // 36 - Thelos_Zentrum
	   [16654, 16122, east,"37 - Athira Kirchplatz",true], // 37 - Athira_Kirchplatz
	   [16720, 13548, east,"38 - xxxxxxxxxxx",true], // 38 _ xxxxxxxxxxxxxx

	   [16589, 12635, east,"39 - Pyrgos Zentrum",true], // 39 - Pyrgos_Zentrum
	   [17806, 10596, east,"40 - Ekali Stones",true], // 40 - Ekali Stones 
	   [19422, 7972, east,"41 - Lonely",true], // 42 - Lonely

	   [18897, 16660, east,"42 - Rodopoli Graveyard",true], // 42 - Rodopoli Graveyard
	   [18374, 15529, east,"43 - Charkia Storage",true], // 43 - Charkia Storage
	   [18116, 15218, east,"44 - Charkia",true], // 44 - Charkia

	   [19677, 12998, east,"45 - Dorida Woods",true], // 45 - Dorida Woods
	   [20166, 11710, east,"46 - Chalikea",true], // 46 - Chalikea
	   [20546, 9003, east,"47 - Panagia",true], // 47 - Panagia
	   
	   [20897, 6643, east,"48 - Selakano",true], // 48 - Selakano
	   [20077, 20064, east,"49 - Pefka Colloseum",true], // 49 - Pefka Colloseum
	   [20923, 19242, east,"50 - Pefkas Lab",true], // 50 - Pefkas Lab
	   
	   [20940, 17008, east,"51 - Paros",true], // 51 - Paros
	   [21365, 16285, east,"52 - Kalochori",true], // 52 - Kalochori
	   [21154, 14594, east,"53 - Limni Swamp",true], // 53 - Limni Swamp
	   
	   [21980, 21035, east,"54 - Pefkas Palace",true], // 54 - Pefkas Palace
	   [22303, 18491, east,"55 - Almyra West",true], // 55 - Almyra West
	   [22627, 16807, east,"56 - Almyra South",true], // 56 - Almyra South
	   
	   [23346, 24195, east,"57 - Sideras",true], // 57 - Sideras
	   [23467, 21158, east,"58 - Delfinaki Military",true], // 58 - Delfinaki Military
	   [24770, 19122, east,"59 - Almyra North",true], // 59 - Almyra North
	   
	   [26746, 24660, east,"60 - Molos Airbase",true], // 60 - Molos Airbase
	   [26958, 23200, east,"61 - Molos Town",true], // 61 - Molos Town
	   [25440, 20346, east,"62 - Refinery",true] // 62 - Refinery
];


// erzeuge für alle oben gelisteten Positionen einen Flaggenmast mit korrekter Flagge vom Server aus.

if (isServer) then 
{
	{
		_x params ["_x", "_y", "_owner", "_name", "_aktiv"];
		
		if (_aktiv) then
		{
			// Objekt erzeugen
			private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
			_flag setFlagTexture "\A3\Data_F\Flags\Flag_NATO_CO.paa";

			// notwendige Variablen fuer OPT
			_flag setVariable ["owner", _owner, true];        
			_flag setVariable ["opt_flag", true, true];
		};	
		
	} forEach GVARMAIN(nato_flags_pos);

	{
		_x params ["_x", "_y", "_owner", "_name", "_aktiv"];
		
		if (_aktiv) then
		{
			// Objekt erzeugen
			private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
			_flag setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";

			// notwendige Variablen fuer OPT
			_flag setVariable ["owner", _owner, true];
			_flag setVariable ["opt_flag", true, true];
		};
	} forEach GVARMAIN(csat_flags_pos);
};
