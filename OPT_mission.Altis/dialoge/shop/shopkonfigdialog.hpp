#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

#define COLOR_CONTROL_BG {0,0,0,0.7}
#define COLOR_BUTTON_BACKGROUND {0,0,0,0.7}
#define COLOR_BUTTON_ACTIVE {0.2,0.8,0.2,0.7}
#define COLOR_LISTBOX_BACKGROUND {0,0,0,0.85}
#define COLOR_TEXT {1.0,1.0,1.0,1}
#define FONTSIZE GUI_GRID_H  

class Dialogshopkonfig
{
	idd = 22000;
	onload = "";
	movingEnable = true;
  
	class controlsBackground
	{
		class BACKGROUND3 : IGUIBack
		{
			 text = ;
			 x = 0.10;
			 y = 0.10;
			 w = 0.9;
			 h = 0.9;
		};

		class name : RscFrame
		{
			idc = 22001;
			style = ST_CENTER;
			sizeEx = 0.05;
			colorText[] = COLOR_TEXT;
			x = 0.05;
			y = 0.00;
			w = 0.5;
			h = 0.15;
			text = "Konfigurieren";
			default = true;
		};	
	};		

    class controls 
	{
		class Fahrzeugname : RSCText
		{
			idc = 22002;
			style = ST_CENTER;
			sizeEx = 0.1;
			colorText[] = COLOR_TEXT;
			colorBackground[] = COLOR_CONTROL_BG;
			x = 0.15;
			y = 0.1;
			w = 0.8;
			h = 0.1;
			text = "Fahrzeugname";
			default = true;
		};
		class Kosten : RSCText
		{
			idc = 22003;
			style = ST_CENTER;
			sizeEx = 0.04;
			colorText[] = COLOR_TEXT;
			colorBackground[] = COLOR_CONTROL_BG;
			x = 0.7;
			y = 0.92;
			w = 0.2;
			h = 0.05;
			text = "10000";
			default = true;
		};
		class Bild : RscPicture
		{
			idc = 22004;
			x = 0.33;
			y = 0.3;
			w = 0.45;
			h = 0.6;
			default = true;
		};
		class MuniBild1 : RscPicture
		{
			idc = 22005;
			x = 0.15;
			y = 0.3;
			w = 0.05;
			h = 0.05;
			default = true;
		};
		class MuniBild2 : RscPicture
		{
			idc = 22006;
			x = 0.15;
			y = 0.35;
			w = 0.05;
			h = 0.05;
			default = true;
		};
		class MuniBild3 : RscPicture
		{
			idc = 22007;
			x = 0.15;
			y = 0.4;
			w = 0.05;
			h = 0.05;
			default = true;
		};
		class MuniBild4 : RscPicture
		{
			idc = 22008;
			x = 0.7;
			y = 0.3;
			w = 0.05;
			h = 0.05;
			default = true;
		};
		class MuniBild5 : RscPicture
		{
			idc = 22009;
			x = 0.7;
			y = 0.35;
			w = 0.05;
			h = 0.05;
			default = true;
		};
		class MuniBild6 : RscPicture
		{
			idc = 22010;
			x = 0.7;
			y = 0.4;
			w = 0.05;
			h = 0.05;
			default = true;
		};  
		class boxslot1 : RscCombo
		{
			idc = 22011;
			sizeEx = 0.03;
			rowHeight = 0.023;
			colorText[] = COLOR_TEXT;
			colorBackground[] = COLOR_CONTROL_BG;
			x = 0.15;
			y = 0.6;
			w = 0.25;
			h = 0.05;
			default = true;
		};
		  
		class boxslot2 : RscCombo
		{
			idc = 22012;
			sizeEx = 0.03;
			rowHeight = 0.023;
			colorText[] = COLOR_TEXT;
			colorBackground[] = COLOR_CONTROL_BG;
			x = 0.15;
			y = 0.7;
			w = 0.25;
			h = 0.05;
			default = true;
		};
		  
		class boxslot3 : RscCombo
		{
			idc = 22013;
			sizeEx = 0.03;
			rowHeight = 0.023;
			colorText[] = COLOR_TEXT;
			colorBackground[] = COLOR_CONTROL_BG;
			x = 0.15;
			y = 0.8;
			w = 0.25;
			h = 0.05;
			default = true;
		};
		  
		class boxslot4 : RscCombo
		{
			idc = 22014;
			sizeEx = 0.03;
			rowHeight = 0.023;
			colorText[] = COLOR_TEXT;
			colorBackground[] = COLOR_CONTROL_BG;
			x = 0.7;
			y = 0.6;
			w = 0.25;
			h = 0.05;
			default = true;
		};
		  
		class boxslot5 : RscCombo
		{
			idc = 22015;
			sizeEx = 0.03;
			rowHeight = 0.023;
			colorText[] = COLOR_TEXT;
			colorBackground[] = COLOR_CONTROL_BG;
			x = 0.7;
			y = 0.7;
			w = 0.25;
			h = 0.05;
			default = true;
		};	  
		class boxslot6 : RscCombo
		{
			idc = 22016;
			sizeEx = 0.03;
			rowHeight = 0.023;
			colorText[] = COLOR_TEXT;
			colorBackground[] = COLOR_CONTROL_BG;
			x = 0.7;
			y = 0.8;
			w = 0.25;
			h = 0.05;
			default = true;
		};
		class boxslot7 : RscCombo
		{
			idc = 22017;
			sizeEx = 0.03;
			rowHeight = 0.023;
			colorText[] = COLOR_TEXT;
			colorBackground[] = COLOR_CONTROL_BG;
			x = 0.42;
			y = 0.8;
			w = 0.25;
			h = 0.05;
			default = true;
		};
		class buttonok : RSCButton
		{
			idc = 22020;
			style = ST_CENTER;
			sizeEx = 0.03;
			x = 0.15;
			y = 0.92;
			w = 0.1;
			h = 0.05;
			text = "OK";
			action = "";
			default = true;
		};
		class buttonAB : RSCButton
		{
			idc = 22021;
			style = ST_CENTER;
			sizeEx = 0.03;
			x = 0.28;
			y = 0.92;
			w = 0.1;
			h = 0.05;
			text = "Abbrechen";
			action = "closeDialog 0";
			default = true;
		};
		class Munitext1 : RSCText
		{
			idc = 22031;
			style = ST_LEFT;
			sizeEx = 0.025;
			colorText[] = COLOR_TEXT;
			x = 0.21;
			y = 0.3;
			w = 0.24;
			h = 0.05;
			text = "Munition";
			default = true;
		};
		class Munitext2 : RSCText
		{
			idc = 22032;
			style = ST_LEFT;
			sizeEx = 0.025;
			colorText[] = COLOR_TEXT;
			x = 0.21;
			y = 0.35;
			w = 0.24;
			h = 0.05;
			text = "Munition";
			default = true;
		};
		class Munitext3 : RSCText
		{
			idc = 22033;
			style = ST_LEFT;
			sizeEx = 0.025;
			colorText[] = {1,1,0,1};
			x = 0.21;
			y = 0.4;
			w = 0.24;
			h = 0.05;
			text = "Munition";
			default = true;
		};
		class Munitext4 : RSCText
		{
			idc = 22034;
			style = ST_LEFT;
			sizeEx = 0.025;
			colorText[] = COLOR_TEXT;
			x = 0.76;
			y = 0.3;
			w = 0.24;
			h = 0.05;
			text = "Munition";
			default = true;
		};
		class Munitext5 : RSCText
		{
			idc = 22035;
			style = ST_LEFT;
			sizeEx = 0.025;
			colorText[] = COLOR_TEXT;
			x = 0.76;
			y = 0.35;
			w = 0.24;
			h = 0.05;
			text = "Munition";
			default = true;
		};
		class Munitext6 : RSCText
		{
			idc = 22036;
			style = ST_LEFT;
			sizeEx = 0.025;
			colorText[] = COLOR_TEXT;
			x = 0.76;
			y = 0.4;
			w = 0.24;
			h = 0.05;
			text = "Munition";
			default = true;
		};
		class boxtext1 : RSCText
		{
			idc = 22037;
			style = ST_LEFT;
			sizeEx = 0.025;
			colorText[] = COLOR_TEXT;
			x = 0.15;
			y = 0.58;
			w = 0.24;
			h = 0.02;
			text = "";
			default = true;
		};
		class boxtext2 : RSCText
		{
			idc = 22038;
			style = ST_LEFT;
			sizeEx = 0.025;
			colorText[] = COLOR_TEXT;
			x = 0.15;
			y = 0.68;
			w = 0.24;
			h = 0.02;
			text = "";
			default = true;
		};
		class boxtext3 : RSCText
		{
			idc = 22039;
			style = ST_LEFT;
			sizeEx = 0.025;
			colorText[] = COLOR_TEXT;
			x = 0.15;
			y = 0.78;
			w = 0.24;
			h = 0.02;
			text = "";
			default = true;
		};
		class boxtext4 : RSCText
		{
			idc = 22040;
			style = ST_LEFT;
			sizeEx = 0.025;
			colorText[] = COLOR_TEXT;
			x = 0.7;
			y = 0.58;
			w = 0.24;
			h = 0.02;
			text = "";
			default = true;
		};
		class boxtext5 : RSCText
		{
			idc = 22041;
			style = ST_LEFT;
			sizeEx = 0.025;
			colorText[] = COLOR_TEXT;
			x = 0.7;
			y = 0.68;
			w = 0.24;
			h = 0.02;
			text = "";
			default = true;
		};
		class boxtext6 : RSCText
		{
			idc = 22042;
			style = ST_LEFT;
			sizeEx = 0.025;
			colorText[] = COLOR_TEXT;
			x = 0.7;
			y = 0.78;
			w = 0.24;
			h = 0.02;
			text = "";
			default = true;
		};
		class boxtext7 : RSCText
		{
			idc = 22043;
			style = ST_LEFT;
			sizeEx = 0.025;
			colorText[] = COLOR_TEXT;
			x = 0.42;
			y = 0.78;
			w = 0.24;
			h = 0.02;
			text = "";
			default = true;
		};
	};
};
