class OPTBeam
{
	idd = IDD_BEAM;
	name="OPTBeam";
	movingEnable = false;
	
	class ControlsBackground
	{
		class BeamBackground : RscText
		{
			type = CT_STATIC;
			idc = -1;
			style = ST_BACKGROUND;
			x = safeZoneX + safeZoneW * 0.04;
			y = safeZoneY + safeZoneH * 0.04;
			w = safeZoneW * 0.92;
			h = safeZoneH * 0.92;
			text = "";
			colorBackground[] = COLOR_BACK;
		};
		class BeamMap : RscMapControl
		{
			idc = IDC_BEAM_MAP;
			style = ST_FRAME;
			x = safeZoneX + safeZoneW * 0.05;
			y = safeZoneY + safeZoneH * 0.05;
			w = safeZoneW * 0.69;
			h = safeZoneH * 0.9 ;
			colorBackground[] = COLOR_MAP_BACK;
		};
	};
	class Controls
	{
		class BeamList : RscListBox
		{
			idc = IDC_BEAM_LIST;
			style = ST_BACKGROUND;
			x = safeZoneX + safeZoneW * 0.75;
			y = safeZoneY + safeZoneH * 0.05;
			w = safeZoneW * 0.2;
			h = safeZoneH * 0.82;
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
		};
		class BeamOK : RscButtonMenuOK
		{
			x = safeZoneX + safeZoneW * 0.85;
			y = safeZoneY + safeZoneH * 0.9;
			w = safeZoneW * 0.09;
			h = safeZoneH * 0.03;
			style = ST_VCENTER;
		};
		class BeamCancel : RscButtonMenuCancel
		{
			x = safeZoneX + safeZoneW * 0.75;
			y = safeZoneY + safeZoneH * 0.9;
			w = safeZoneW * 0.09;
			h = safeZoneH * 0.03;
			style = ST_VCENTER;
		};
		class BeamTitle : RscStructuredText
		{
			x = safeZoneX + safeZoneW * 0.4;
			y = safeZoneY + safeZoneH * 0.05;
			w = 0.2;
			h = 0.1;
			style = ST_CENTER;
			text = "<t shadow='2' align='center'>Verlegung</t>";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,0,0,0};
		};		
	};
	
};
