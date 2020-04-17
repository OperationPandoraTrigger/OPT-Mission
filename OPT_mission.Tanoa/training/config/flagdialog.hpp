

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by [3.JgKp]James, v1.063, #Qageca)
////////////////////////////////////////////////////////
/* GRID MACROS */
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class GVAR(dlg_flag)
{

    idd = 21000;
	movingenable = true;
	onLoad = QUOTE([_this select 0] call FUNC(initFlagDialog));

    class controlsBackground
	{ 

        class IGUIBack_2200: IGUIBack
        {
            idc = 2200;
            x = 11 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 18.5 * GUI_GRID_W;
            h = 9 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.6};
        };
        class RscFrame_1800: RscFrame
        {
            idc = 1800;
            x = 11 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 18.5 * GUI_GRID_W;
            h = 9 * GUI_GRID_H;
            sizeEx = 1 * GUI_GRID_H;
        };
    };
    
    class controls
	{
        class FLAG_RscText_1000: RscText
        {
            idc = 1000;
            text = "Koordinaten von Flaggen in der Nähe:"; //--- ToDo: Localize;
            x = 11.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 17 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };
        class FLAG_RscEdit_1400: RscEdit
        {
            idc = 1400;
            style = ST_MULTI;
            x = 12 * GUI_GRID_W + GUI_GRID_X;
            y = 2 * GUI_GRID_H + GUI_GRID_Y;
            w = 16 * GUI_GRID_W;
            h = 6 * GUI_GRID_H;
        };       
        class RscButton_1600: RscButton
        {
            idc = 1600;
            style = ST_CENTER + ST_VCENTER;
            text = "Übernehmen"; //--- ToDo: Localize;
            x = 16.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            sizeEx = (0.023 / (getResolution select 5));
            action = QUOTE([] call FUNC(setFlag););
        };
    };
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
