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

class Dialogshopkaufen
{
	idd = 20000;
	movingenable = false;
	onLoad = "";
	
    class controlsBackground
	{
        class IGUIBack_Main: IGUIBack
        {
            idc = 20100;
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 25.1 * GUI_GRID_H;
        };
        class RscFrame_Main: RscFrame
        {
            idc = 20101;
            text = "Bestellsystem"; 
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = -0.83 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 26 * GUI_GRID_H;
            colorText[] = {1,1,1,1};
            sizeEx = 1.5 * FONTSIZE;
        };
        class RscPictureFlag: RscPicture
        {
            idc = 20102;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 1 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
        class RscFrame_Vehicle: RscFrame
        {
            idc = 20103;
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 5 * GUI_GRID_H + GUI_GRID_Y;
            w = 38 * GUI_GRID_W;
            h = 18 * GUI_GRID_H;
        };
    };

    class controls 
	{
        class RscTextBudget: RscText
        {
            idc = 20001;
            text = "Budget: "; 
            x = 10 * GUI_GRID_W + GUI_GRID_X;
            y = 1 * GUI_GRID_H + GUI_GRID_Y;
            w = 29 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            colorBackground[] = COLOR_CONTROL_BG;
            sizeEx = FONTSIZE;
        };
 
        class RscListboxVehicleList: RscListBox_OPT
        {
            idc = 20002;
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 23 * GUI_GRID_W;
            h = 16.5 * GUI_GRID_H;
            onLBSelChanged =  "";
            sizeEx = FONTSIZE;
            colorBackground[] = COLOR_CONTROL_BG;
            rowHeight = 0.06;

        };
        class RscTextVehicleInfo: RscStructuredText
        {
            idc = 20003;
            text = "Infobereich..."; 
            x = 24 * GUI_GRID_W + GUI_GRID_X;
            y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 15 * GUI_GRID_W;
            h = 16.5 * GUI_GRID_H;
            sizeEx = FONTSIZE;
            colorBackground[] = COLOR_CONTROL_BG;
        };
        class RscButtonBuy: RscButton
        {
            idc = 20004;
            text = "Bestellen"; 
            x = 1.03 * GUI_GRID_W + GUI_GRID_X;
            y = 23.23 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            tooltip = "Ausgewähltes Fahrzeug bestellen";
			action = "";
            sizeEx = FONTSIZE;
        };
        class RscButtonSell: RscButton
        {
            idc = 20005;
            text = "Verkaufen"; 
            x = 1.03 * GUI_GRID_W + GUI_GRID_X;
            y = 23.23 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            tooltip = "Verkaufe Fahrzeug auf dem Bestell-Pad";
			action = "";
            sizeEx = FONTSIZE;
        };
         class RscButtonClear: RscButton
        {
            idc = 20006;
            text = "Räumen"; 
            x = 9 * GUI_GRID_W + GUI_GRID_X;
            y = 23.23 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            tooltip = "Löscht alle Fahrzeuge um das Bestell-Pad (kein Verkauf!)";
			action = "";
            sizeEx = FONTSIZE;
            colorBackground[] = Color_DarkRed;
        };
		class RscButtonconfig: RscButton
        {
            idc = 20007;
            text = "Konfigurieren"; 
            x = 17 * GUI_GRID_W + GUI_GRID_X;
            y = 23.23 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            tooltip = "Das Ausgewählte Fahrzeug Konfigurieren";
			action = "";
            sizeEx = FONTSIZE;
        };
        class RscButtonCancel: RscButton
        {
            idc = 20008;
            text = "Schließen"; 
            x = 32 * GUI_GRID_W + GUI_GRID_X;
            y = 23.2 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            tooltip = "Dialog schliessen";
			action = "closeDialog 0";
            sizeEx = FONTSIZE;
        };
    };
};

