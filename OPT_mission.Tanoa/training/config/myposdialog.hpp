
/* GRID MACROS */
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class GVAR(dlg_mypos)
{

    idd = 21012;
	movingenable = true;
	onLoad = QUOTE([_this select 0] call FUNC(initMyPosDialog));

    class controlsBackground
	{ 

        class IGUIBack_2212: IGUIBack
        {
            idc = 2212;
            x = 4.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 31.5 * GUI_GRID_W;
            h = 11 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.6};
        };
        class RscFrame_1812: RscFrame
        {
            idc = 1812;
            x = 4.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 31.5 * GUI_GRID_W;
            h = 11 * GUI_GRID_H;
            sizeEx = 1 * GUI_GRID_H;
        };
    };
    
    class controls
	{
        class FLAG_RscText_1012: RscStructuredText
        {
            idc = 1012;
            style = ST_MULTI;
            colorShadow[] = {0,0,0,0.5};
            font = DEFAULTFONT;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
            text = "Koordinaten der eigenen Position:<br/>Zur Vorlage bei HL oder PL als Vorschlag für einen Beampunkt.<br/><t underline='1'>Immer auf ausreichend viel Platz im Umfeld achten!</t><br/>(Ortsname kann geändert werden. Herauskopierbar mit STRG+C.)";
            x = 6 * GUI_GRID_W + GUI_GRID_X;
            y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 30 * GUI_GRID_W;
            h = 5 * GUI_GRID_H;
        };
        class FLAG_RscEdit_1412: RscEdit
        {
            idc = 1412;
            style = ST_MULTI;
            x = 6 * GUI_GRID_W + GUI_GRID_X;
            y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 28.5 * GUI_GRID_W;
            h = 4.5 * GUI_GRID_H;
        };       
        class RscButton_1612: RscButton
        {
            idc = 1612;
            style = ST_CENTER + ST_VCENTER;
            text = "Schließen"; //--- ToDo: Localize;
            x = 16.5 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            sizeEx = (0.023 / (getResolution select 5));
            action = "closeDialog 0";
        };
    };
};
