class CfgCLibLoadouts {

    class BaseCollection {
        uniform[] = {};
        vest[] = {};
        headgear[] = {};
        goggle[] = {};
        backpack[] = {};
        primaryWeapon[] = {};
        primaryWeaponOptic[] = {};
        primaryWeaponMuzzle[] = {};
        primaryWeaponBarrel[] = {};
        primaryWeaponResting[] = {};
        primaryWeaponLoadedMagazine[] = {};
        secondaryWeapon[] = {};
        secondaryWeaponOptic[] = {};
        secondaryWeaponMuzzle[] = {};
        secondaryWeaponBarrel[] = {};
        secondaryWeaponResting[] = {};
        secondaryWeaponLoadedMagazine[] = {};
        handgun[] = {};
        handgunOptic[] = {};
        handgunMuzzle[] = {};
        handgunBarrel[] = {};
        handgunResting[] = {};
        handgunLoadedMagazine[] = {};
        binocular[] = {};
        magazines[] = {};
        items[] = {};
        itemsUniform[] = {};
        itemsVest[] = {};
        itemsBackpack[] = {};
        linkedItems[] = {};
        script[] = {};
        removeAllWeapons = 0;
        removeAllItems = 0;
        removeAllAssignedItems = 0;
    };
    class BaseRole : BaseCollection {
        binocular[] = {"Binocular"};
        itemsUniform[] = {{"SmokeShell",2}{"HandGrenade",2}}; 
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch", "ItemGPS", "ACE_MapTools"};
        removeAllWeapons = 1;
        removeAllItems = 1;
        removeAllAssignedItems = 1;
    }	
	class BaseRoleOpfor : BaseRole {
		uniform[] = {"U_O_T_Soldier_F"};
		vest[] = {"V_TacVest_camo"};
		itemsVest[] = {{"30Rnd_580x42_Mag_F",4}};
		radio[] = {"tf_fadak"};
		headgear[]="OPT_H_HelmetO_ghex_F";
		primaryWeapon[] = {"OPT_arifle_CTAR_blk_F"};
        primaryWeaponOptic[] = {"optic_Aco"};
        primaryWeaponMuzzle[] = {"ACE_muzzle_mzls_L"};
		primaryWeaponBarrel[] = {"acc_pointer_IR"};
        primaryWeaponLoadedMagazine[] = {"30Rnd_580x42_Mag_F"};
		
	}	
	class BaseRoleBlufor : BaseRole {
		uniform[] = {"U_B_CTRG_Soldier_F"};
		vest[] = {"OPT_V_PlateCarrier1_tna_F"};
		itemsVest[] = {{"30Rnd_556x45_Stanag",4}};
		radio[] = {"tf_anprc152"};
		headgear[]="OPT_H_HelmetB_tna_F";
		primaryWeapon[] = {"OPT_arifle_SPAR_01_blk_F"};
        primaryWeaponOptic[] = {"optic_Aco"};
        primaryWeaponMuzzle[] = {"ACE_muzzle_mzls_L"};
		primaryWeaponBarrel[] = {"acc_pointer_IR"};
        primaryWeaponLoadedMagazine[] = {"30Rnd_556x45_Stanag"};
		
	}
    class Opfor_Offizier : BaseRoleOpfor {
		backpack[] = {"TFAR_mr3000_bwmod"};
    }
    class Blufor_Offizier : BaseRoleBlufor {
        backpack[] = {"TFAR_rt1523g_big_bwmod"};
	}
    class Opfor_Gruppenfuehrer : BaseRoleOpfor {
		backpack[] = {"TFAR_mr3000_bwmod"};
	}
    class Blufor_Gruppenfuehrer : BaseRoleBlufor {
		backpack[] = {"TFAR_rt1523g_big_bwmod"};
	}
    
    class Opfor_Operator : BaseRoleOpfor {
		backpack[] = {"TFAR_mr3000_bwmod"};
		linkedItems[] = {"O_UavTerminal"};
	}
    class Blufor_Operator : BaseRoleBlufor {
		backpack[] = {"TFAR_rt1523g_big_bwmod"};
		linkedItems[] = {"B_UavTerminal"};
	}
    class Opfor_Pilot  : BaseRole {
		uniform[] = {"U_O_T_Officer_F"};
		vest[] = {"OPT_V_TacVest_khk"};
		itemsVest[] = {{"30Rnd_9x21_Mag",4}};
		radio[] = {"tf_fadak"};
		headgear[]="H_PilotHelmetHeli_I";
		backpack[] = {"TFAR_mr3000_bwmod"};
		primaryWeapon[] = {"OPT_SMG_02_F"};
        primaryWeaponOptic[] = {"optic_Aco_smg"};
        primaryWeaponLoadedMagazine[] = {"30Rnd_9x21_Mag"};
	}
    class Blufor_Pilot  : BaseRole {
		uniform[] = {"U_B_HeliPilotCoveralls"};
		vest[] = {"OPT_V_PlateCarrier1_tna_F"};
		itemsVest[] = {{"30Rnd_45ACP_Mag_SMG_01",4}};
		radio[] = {"tf_anprc152"};
		headgear[]="H_PilotHelmetHeli_I";
		backpack[] = {"TFAR_rt1523g_big_bwmod"};
		primaryWeapon[] = {"OPT_SMG_01_F"};
        primaryWeaponOptic[] = {"optic_Aco_smg"};
        primaryWeaponLoadedMagazine[] = {"30Rnd_45ACP_Mag_SMG_01"};
	}
    class Opfor_Ingenieur  : BaseRoleOpfor {
		backpack[] = {"OPT_B_Carryall_ghex_Eng"};
		itemsBackpack[] = {"MineDetector", "ToolKit"};
	}
    class Blufor_Ingenieur  : BaseRoleBlufor {
		backpack[] = {"OPT_B_Kitbag_rgr_Eng"};
		itemsBackpack[] = {"MineDetector", "ToolKit"};
	}
    class Opfor_Crew  : BaseRole {
		uniform[] = {"U_O_T_Officer_F"};
		vest[] = {"V_TacVest_camo"};
		itemsVest[] = {{"30Rnd_9x21_Mag",4}};
		radio[] = {"tf_fadak"};
		headgear[]="H_HelmetCrew_O_ghex_F";
		backpack[] = {"TFAR_mr3000_bwmod"};
		primaryWeapon[] = {"OPT_SMG_02_F"};
        primaryWeaponOptic[] = {"optic_Aco_smg"};
        primaryWeaponLoadedMagazine[] = {"30Rnd_9x21_Mag"};
	}
    class Blufor_Crew  : BaseRole {
		uniform[] = {"U_B_CTRG_Soldier_3_F"};
		vest[] = {"OPT_V_PlateCarrier1_tna_F"};
		itemsVest[] = {{"30Rnd_45ACP_Mag_SMG_01",4}};
		radio[] = {"tf_anprc152"};
		headgear[]="H_HelmetCrew_B";
		backpack[] = {"TFAR_rt1523g_big_bwmod"};
		primaryWeapon[] = {"OPT_SMG_01_F"};
        primaryWeaponOptic[] = {"optic_Aco_smg"};
        primaryWeaponLoadedMagazine[] = {"30Rnd_45ACP_Mag_SMG_01"};
	}
    class Opfor_Sanitaeter  : BaseRoleOpfor {0
		backpack[] = {"OPT_B_FieldPack_ghex_ReconMedic"};
		itemsBackpack[] = {"Medikit"};		
	}
    class Blufor_Sanitaeter  : BaseRoleBlufor {
		backpack[] = {"OPT_B_AssaultPack_tna_Medic"};
		itemsBackpack[] = {"Medikit"};
	}
    class Opfor_Grenadier  : BaseRoleOpfor {
		primaryWeapon[] = {"OPT_arifle_CTAR_GL_blk_F"};
        primaryWeaponOptic[] = {"optic_ERCO_blk_F"};
		primaryWeaponMuzzle[] = {"ACE_muzzle_mzls_L"};
		primaryWeaponBarrel[] = {"acc_pointer_IR"};
        primaryWeaponLoadedMagazine[] = {"30Rnd_580x42_Mag_F"};
	}
    class Blufor_Grenadier  : BaseRoleBlufor {
		primaryWeapon[] = {"OPT_arifle_SPAR_01_GL_blk_F"};
        primaryWeaponOptic[] = {"optic_ERCO_blk_F"};
		primaryWeaponMuzzle[] = {"ACE_muzzle_mzls_L"};
		primaryWeaponBarrel[] = {"acc_pointer_IR"};
        primaryWeaponLoadedMagazine[] = {"30Rnd_556x45_Stanag"};
	}
    class Opfor_Sprengmeister  : BaseRoleOpfor {
		backpack[] = {"OPT_B_Carryall_ghex_Eng"};
		itemsBackpack[] = {"MineDetector", "ToolKit"};
	}
    class Blufor_Sprengmeister  : BaseRoleBlufor {
		backpack[] = {"OPT_B_Kitbag_rgr_Eng"};
		itemsBackpack[] = {"MineDetector", "ToolKit"};		
	}
    class Opfor_Leichte PA  : BaseRoleOpfor {
		binocular[] = {"Rangefinder"};
		backpack[] = {"B_ViperLightHarness_ghex_F"};
	}
    class Blufor_Leichte PA  : BaseRoleBlufor {
		binocular[] = {"Rangefinder"};
		backpack[] = {"B_ViperHarness_oli_F"};
	}
    class Opfor_Schwere PA  : BaseRoleOpfor {
		binocular[] = {"Rangefinder"};
		backpack[] = {"B_ViperLightHarness_ghex_F"};
	}
    class Blufor_Schwere PA  : BaseRoleBlufor {
		binocular[] = {"Rangefinder"};
		backpack[] = {"B_ViperHarness_oli_F"};
	}
    class Opfor_Flugabwehr  : BaseRoleOpfor {
		backpack[] = {"B_ViperLightHarness_ghex_F"};
	}
    class Blufor_Flugabwehr  : BaseRoleBlufor {
		backpack[] = {"B_ViperHarness_oli_F"};
	}
    class Opfor_Schweres_MG  : BaseRole {
		uniform[] = {"U_O_T_Soldier_F"};
		vest[] = {"V_TacVest_camo"};
		itemsVest[] = {{"150Rnd_762x54_Box",3}};
		radio[] = {"tf_fadak"};
		headgear[]="OPT_H_HelmetO_ghex_F";
		primaryWeapon[] = {"OPT_LMG_Zafir_F"};
        primaryWeaponOptic[] = {"optic_ACO_grn"};
		primaryWeaponBarrel[] = {"acc_pointer_IR"};
        primaryWeaponLoadedMagazine[] = {"150Rnd_762x54_Box"};
	}
    class Blufor_Schweres_MG  : BaseRole {
		uniform[] = {"U_B_CTRG_Soldier_F"};
		vest[] = {"OPT_V_PlateCarrier1_tna_F"};
		itemsVest[] = {{"200Rnd_65x39_cased_Box",2}};
		radio[] = {"tf_anprc152"};
		headgear[]="OPT_H_HelmetB_tna_F";
		primaryWeapon[] = {"OPT_LMG_Mk200_F"};
        primaryWeaponOptic[] = {"optic_Aco"};
		primaryWeaponBarrel[] = {"acc_pointer_IR"};
		primaryWeaponResting[] = {"bipod_01_F_blk"};
        primaryWeaponLoadedMagazine[] = {"200Rnd_65x39_cased_Box"};
	}
    class Opfor_Leichtes_MG  : BaseRole {
		uniform[] = {"U_O_T_Soldier_F"};
		vest[] = {"V_TacVest_camo"};
		itemsVest[] = {{"OPT_100Rnd_580x42_Mag_Tracer_F",4}};
		radio[] = {"tf_fadak"};
		headgear[]="OPT_H_HelmetO_ghex_F";
		primaryWeapon[] = {"OPT_arifle_CTARS_blk_F"};
        primaryWeaponOptic[] = {"optic_ACO_grn"};
		primaryWeaponMuzzle[] = {"ACE_muzzle_mzls_L"};
		primaryWeaponBarrel[] = {"acc_pointer_IR"};
		primaryWeaponResting[] = {"bipod_01_F_blk"};
        primaryWeaponLoadedMagazine[] = {"OPT_100Rnd_580x42_Mag_Tracer_F"};
	}
    class Blufor_Leichtes_MG  : BaseRole {
		uniform[] = {"U_B_CTRG_Soldier_F"};
		vest[] = {"OPT_V_PlateCarrier1_tna_F"};
		itemsVest[] = {{"OPT_150Rnd_556x45_Drum_Mag_Tracer_F",3}};
		radio[] = {"tf_anprc152"};
		headgear[]="OPT_H_HelmetB_tna_F";
		primaryWeapon[] = {"OPT_arifle_SPAR_02_blk_F"};
        primaryWeaponOptic[] = {"optic_Aco"};
		primaryWeaponMuzzle[] = {"ACE_muzzle_mzls_L"};
		primaryWeaponBarrel[] = {"acc_pointer_IR"};
		primaryWeaponResting[] = {"bipod_01_F_blk"};
        primaryWeaponLoadedMagazine[] = {"OPT_150Rnd_556x45_Drum_Mag_Tracer_F"};
	}
    class Opfor_DMR  : BaseRole {
		uniform[] = {"U_O_T_Sniper_F"};
		vest[] = {"OPT_V_Chestrig_khk"};
		itemsVest[] = {{"20Rnd_762x51_Mag",5},{"16Rnd_9x21_Mag",2}};
		radio[] = {"tf_fadak"};
		binocular[] = {"Rangefinder"};
		primaryWeapon[] = {"OPT_srifle_DMR_03_F"};
        primaryWeaponOptic[] = {"optic_Hamr"};
		primaryWeaponResting[] = {"bipod_02_F_blk"};
        primaryWeaponLoadedMagazine[] = {"20Rnd_762x51_Mag"};
		handgun[] = {"OPT_hgun_Rook40_F"};
		handgunLoadedMagazine[] = {"16Rnd_9x21_Mag"};
	}
	class Blufor_DMR  : BaseRole {
		uniform[] = {"U_B_T_Sniper_F"};
		vest[] = {"OPT_V_Chestrig_rgr"};
		itemsVest[] = {{"20Rnd_762x51_Mag",5},{"16Rnd_9x21_Mag",2}};
		radio[] = {"tf_anprc152"};
		binocular[] = {"Rangefinder"};
		primaryWeapon[] = {"OPT_srifle_DMR_03_F"};
        primaryWeaponOptic[] = {"optic_Hamr"};
		primaryWeaponResting[] = {"bipod_02_F_blk"};
        primaryWeaponLoadedMagazine[] = {"20Rnd_762x51_Mag"};
		handgun[] = {"OPT_hgun_P07_F"};
		handgunLoadedMagazine[] = {"16Rnd_9x21_Mag"};
	}
    class Opfor_Scharfschuetze  : BaseRole {
		uniform[] = {"U_O_FullGhillie_lsh"};
		vest[] = {"OPT_V_Chestrig_khk"};
		itemsVest[] = {"ACE_Tripod","ACE_SpottingScope"};
		radio[] = {"tf_fadak"};
		binocular[] = {"Rangefinder"};
		handgun[] = {"OPT_hgun_Rook40_F"};
		handgunLoadedMagazine[] = {"16Rnd_9x21_Mag"};
	}
    class Blufor_Scharfschuetze  : BaseRole {
		uniform[] = {"U_B_FullGhillie_lsh"};
		vest[] = {"OPT_V_Chestrig_rgr"};
		itemsVest[] = {"ACE_Tripod","ACE_SpottingScope"};
		radio[] = {"tf_anprc152"};
		binocular[] = {"Rangefinder"};
		handgun[] = {"OPT_hgun_P07_F"};
		handgunLoadedMagazine[] = {"16Rnd_9x21_Mag"};
	}
    class Opfor_Spotter  : BaseRole {
		uniform[] = {"U_O_T_Sniper_F"};
		vest[] = {"OPT_V_TacVest_khk"};
		itemsVest[] = {{"30Rnd_580x42_Mag_F",4},"ACE_HuntIR_monitor"};
		backpack[] = {"TFAR_mr3000"};
		radio[] = {"tf_fadak"};
		binocular[] = {"OPT_Laserdesignator"};
		primaryWeapon[] = {"OPT_arifle_CTAR_blk_F"};
        primaryWeaponOptic[] = {"optic_Hamr"};
        primaryWeaponMuzzle[] = {"ACE_muzzle_mzls_L"};
		primaryWeaponBarrel[] = {"acc_pointer_IR"};
        primaryWeaponLoadedMagazine[] = {"30Rnd_580x42_Mag_F"};
	}
    class Blufor_Spotter  : BaseRole {
		uniform[] = {"U_B_T_Sniper_F"};
		vest[] = {"OPT_V_Chestrig_rgr"};
		itemsVest[] = {{"30Rnd_556x45_Stanag",4},"ACE_HuntIR_monitor"};
		backpack[] = {"TFAR_rt1523g_big_bwmod"};
		radio[] = {"tf_anprc152"};
		binocular[] = {"OPT_Laserdesignator"};
		primaryWeapon[] = {"OPT_arifle_SPAR_01_blk_F"};
        primaryWeaponOptic[] = {"optic_Hamr"};
        primaryWeaponMuzzle[] = {"ACE_muzzle_mzls_L"};
		primaryWeaponBarrel[] = {"acc_pointer_IR"};
        primaryWeaponLoadedMagazine[] = {"30Rnd_556x45_Stanag"};
	}
    class Opfor_Schuetze  : BaseRoleOpfor {}
    class Blufor_Schuetze  : BaseRoleBlufor {}


}
