// ACE Allgemein
force ace_common_allowFadeMusic = true;
force ace_common_checkPBOsAction = 2;
force ace_common_checkPBOsCheckAll = true;
force ace_common_checkPBOsWhitelist = "[""CLib"",""Streamator"",""PerformanceMonitor"", ""opt""]";
force ace_noradio_enabled = true;

// ACE BenutzeroberflÃ¤che
force ace_ui_allowSelectiveUI = true;

// ACE DurchzÃ¼ndung
force ace_cookoff_ammoCookoffDuration = 0.2;
force ace_cookoff_enable = false;
force ace_cookoff_enableAmmobox = true;
force ace_cookoff_enableAmmoCookoff = true;
force ace_cookoff_probabilityCoef = 0.2;

// ACE Erweitertes Wurfsystem
force ace_advanced_throwing_enabled = true;
force ace_advanced_throwing_enablePickUp = true;
force ace_advanced_throwing_enablePickUpAttached = true;

// ACE Fingerzeig
force ace_finger_enabled = true;
force ace_finger_maxRange = 4;

// ACE Interaktion
force ace_interaction_disableNegativeRating = true;
force ace_interaction_enableTeamManagement = false;

// ACE Karte
force ace_map_BFT_Enabled = false;
force ace_map_BFT_HideAiGroups = false;
force ace_map_BFT_Interval = 1;
force ace_map_BFT_ShowPlayerNames = false;
force ace_map_DefaultChannel = 1;
force ace_map_mapGlow = false;
force ace_map_mapIllumination = false;
force ace_map_mapLimitZoom = false;
force ace_map_mapShake = false;
force ace_map_mapShowCursorCoordinates = true;
force ace_markers_moveRestriction = -1;

// ACE Kartenzeichen
force ace_map_gestures_enabled = true;
force ace_map_gestures_interval = 0.03;
force ace_map_gestures_maxRange = 7;

// ACE Logistik
force ace_cargo_enable = true;
force ace_cargo_loadTimeCoefficient = 1;
force ace_cargo_paradropTimeCoefficent = 0.4;
force ace_refuel_hoseLength = 25;
force ace_refuel_rate = 1;
force ace_repair_addSpareParts = false;
force ace_repair_autoShutOffEngineWhenStartingRepair = false;
force ace_repair_consumeItem_toolKit = 0;
force ace_repair_displayTextOnRepair = false;
force ace_repair_engineerSetting_fullRepair = 2;
force ace_repair_engineerSetting_repair = 2;
force ace_repair_engineerSetting_wheel = 2;
force ace_repair_fullRepairLocation = 4;
force ace_repair_repairDamageThreshold = 0.6;
force ace_repair_repairDamageThreshold_engineer = 0.4;
force ace_repair_wheelRepairRequiredItems = 1;

// ACE Magazine Repack
force ace_magazinerepack_timePerAmmo = 1.5;
force ace_magazinerepack_timePerBeltLink = 8;
force ace_magazinerepack_timePerMagazine = 2;

// ACE Mk6 MÃ¶rser
force ace_mk6mortar_airResistanceEnabled = false;
force ace_mk6mortar_allowCompass = false;
force ace_mk6mortar_allowComputerRangefinder = true;
force ace_mk6mortar_useAmmoHandling = false;

// ACE Respawn
force ace_respawn_removeDeadBodiesDisconnected = false;
force ace_respawn_savePreDeathGear = true;

// ACE Sichtweitenbegrenzung
force ace_viewdistance_enabled = true;
force ace_viewdistance_limitViewDistance = 4000;
force ace_viewdistance_objectViewDistanceCoeff = 0;

// ACE Sprengstoffe
force ace_explosives_explodeOnDefuse = false;
force ace_explosives_punishNonSpecialists = false;
force ace_explosives_requireSpecialist = false;

// ACE Uncategorized
force ace_fastroping_requireRopeItems = false;
force ace_microdagr_mapDataAvailable = 0;
force ace_microdagr_waypointPrecision = 3;

// ACE Waffen
force ace_laserpointer_enabled = true;

// ACE Wetter
force ace_weather_enabled = false;
force ace_weather_updateInterval = 60;
force ace_weather_windSimulation = false;

// ACE Zeige Spielernamen
force ace_nametags_playerNamesMaxAlpha = 0.8;
force ace_nametags_playerNamesViewDistance = 5;
force ace_nametags_showCursorTagForVehicles = false;
force ace_nametags_showPlayerNames = 2;

// ACE Zuschauer
force ace_spectator_enableAI = false;
force ace_spectator_restrictModes = 0;
force ace_spectator_restrictVisions = 0;

// CBA Waffen
force cba_disposable_replaceDisposableLauncher = true;

// DUI - Squad Radar - Radar
diwako_dui_radar_sqlFirst = true; // Recommended/Default , but not enforced

// OPT Feldreparatur
force DEFAULT_FIELDREPAIR_EACH_HARDPART_TIME = 30;
force DEFAULT_FIELDREPAIR_EACH_PART_TIME = 15;
force DEFAULT_FIELDREPAIR_MAX_REP_TIME = 240;
force DEFAULT_FREE_REFUELS = 1;
force DEFAULT_FREE_REFUELS_DURATION = 60;
force DEFAULT_FREE_REPAIRS = 1;
force DEFAULT_FULLREPAIR_LENGTH = 60;
force DEFAULT_REPAIR_TRUCK_USES = 10;

// OPT Kaufsystem
force OPT_PARAM_ONLY_CREW = true;
force OPT_PARAM_ONLY_PILOTS = true;
force OPT_warehouse_allowSale = true;
force OPT_warehouse_blockedVehiclePositions = ["driver"];
force OPT_warehouse_orderSpawnRadius = 15;
force OPT_warehouse_saleRadius = 15;
force OPT_warehouse_saleReturnValueForEnemy = 1.5;
force OPT_warehouse_saleReturnValueForOwn = 0.75;

// OPT Komponenten
force OPT_beam_on = true;
force OPT_cargo_on = true;
force OPT_fieldrepair_on = true;
force OPT_hud_on = true;
force OPT_marker_on = true;
force OPT_mhq_on = false;
force OPT_persistence_on = false;
force OPT_radar_on = false;
force OPT_revive_on = true;
force OPT_tfar_on = true;
force OPT_training_on = false;
force OPT_uav_on = true;
force OPT_Waffenruhemarker_on = true;
force OPT_waffenwechsel_on = true;

// OPT Log-System
force OPT_log_distanceFromBase = 1000;
force OPT_log_fpsUpdateTime = 60;

// OPT Markersystem
force OPT_marker_customMarkerTxt = "#z";
force OPT_marker_useRealTime = false;

// OPT Mission
force OPT_csat_budget = "5000000";
force OPT_dispo = "3000000";
force OPT_nato_budget = "5000000";
force OPT_PARAM_FREEZE_TIME = 30;
force OPT_PARAM_PLAYTIME = 9000;
force OPT_PARAM_SHOW_INTRO = true;
force OPT_PARAM_TEAMBALANCE = 5.10248;
force OPT_PARAM_TRUCETIME = 420;
force OPT_repairSystem_refuelCost = "1000";
force OPT_repairSystem_repairCost = "1000";
force OPT_respawn_cost_max = "3000";
force OPT_respawn_cost_min = "1000";

// OPT San-System
force FAR_REVIVE_3D_ICONS = true;
force FAR_REVIVE_BLEEDOUT = 600;
force FAR_REVIVE_CALL_NEARBY_MEDICS = true;
force FAR_REVIVE_DEATH_MESSAGE = true;
force FAR_REVIVE_DOWN_MARKER = true;
force FAR_REVIVE_FIRST_AID_MIN_DAMAGE = 0.3;
force FAR_REVIVE_FIRST_AID_MULTIPLIER = 0.05;
force FAR_REVIVE_FIRST_AID_TIME = 25;
force FAR_REVIVE_MAX_DAMAGE = 0.95;
force FAR_REVIVE_MODE = 3;
force FAR_REVIVE_NEARBY_MEDIC_DISTANCE = 300;

// OPT Sektorkontrolle
force OPT_sectorcontrol_flagDistanceToPlayer = 5;
force OPT_sectorcontrol_flagFreeMineZoneMarkerOn = true;
force OPT_sectorcontrol_flagFreeMineZoneOn = true;
force OPT_sectorcontrol_flagFreeMineZoneRadius = 20;
force OPT_sectorcontrol_flagMarkerOn = true;

// OPT TFAR
force OPT_PARAM_TFAR_INTERCEPTION = false;

// OPT Trainingsmodus
force OPT_training_budget = "100000000";
force OPT_training_teleport = true;
force OPT_training_zeus = true;

// OPT Waffenwechselsystem
force OPT_waffenwechsel_WWloadout = true;

// TFAR - Allgemeine Einstellungen
force TFAR_AICanHearPlayer = false;
force TFAR_AICanHearSpeaker = false;
force TFAR_defaultIntercomSlot = 0;
force TFAR_enableIntercom = true;
force TFAR_experimentalVehicleIsolation = true;
force TFAR_fullDuplex = true;
force TFAR_giveLongRangeRadioToGroupLeaders = false;
force TFAR_giveMicroDagrToSoldier = true;
force TFAR_givePersonalRadioToRegularSoldier = false;
force TFAR_globalRadioRangeCoef = 1.5;
force TFAR_instantiate_instantiateAtBriefing = false;
force TFAR_objectInterceptionEnabled = true;
force TFAR_objectInterceptionStrength = 400;
force tfar_radiocode_east = "_opfor";
force tfar_radiocode_independent = "_independent";
force tfar_radiocode_west = "_bluefor";
force tfar_radioCodesDisabled = false;
force TFAR_SameLRFrequenciesForSide = true;
force TFAR_SameSRFrequenciesForSide = true;
force TFAR_setting_defaultFrequencies_lr_east = "41,42,43,44,45,46,47,48,49";
force TFAR_setting_defaultFrequencies_lr_independent = "";
force TFAR_setting_defaultFrequencies_lr_west = "40,50,60,41,42,43,51,61,62";
force TFAR_setting_defaultFrequencies_sr_east = "71,72,73,74,75,76,77,78";
force TFAR_setting_defaultFrequencies_sr_independent = "";
force TFAR_setting_defaultFrequencies_sr_west = "41,42,43,60,61,62,50,51";
force TFAR_setting_DefaultRadio_Airborne_east = "TFAR_mr6000l";
force TFAR_setting_DefaultRadio_Airborne_Independent = "TFAR_anarc164";
force TFAR_setting_DefaultRadio_Airborne_West = "TFAR_anarc210";
force TFAR_setting_DefaultRadio_Backpack_east = "TFAR_mr3000";
force TFAR_setting_DefaultRadio_Backpack_Independent = "TFAR_anprc155";
force TFAR_setting_DefaultRadio_Backpack_west = "TFAR_rt1523g";
force TFAR_setting_DefaultRadio_Personal_east = "TFAR_fadak";
force TFAR_setting_DefaultRadio_Personal_Independent = "TFAR_anprc148jem";
force TFAR_setting_DefaultRadio_Personal_West = "TFAR_anprc152";
force TFAR_setting_DefaultRadio_Rifleman_East = "TFAR_pnr1000a";
force TFAR_setting_DefaultRadio_Rifleman_Independent = "TFAR_anprc154";
force TFAR_setting_DefaultRadio_Rifleman_West = "TFAR_rf7800str";
force TFAR_spectatorCanHearEnemyUnits = true;
force TFAR_spectatorCanHearFriendlies = true;
force TFAR_takingRadio = 2;
force TFAR_Teamspeak_Channel_Name = "2302";
force TFAR_Teamspeak_Channel_Password = "war";
force tfar_terrain_interception_coefficient = 1;
force TFAR_voiceCone = true;
