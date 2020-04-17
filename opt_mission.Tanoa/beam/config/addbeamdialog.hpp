
/* GRID MACROS */
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class GVAR(dlg_addbeam)
{

    idd = 21013;
	movingenable = true;
	onLoad = QUOTE([_this select 0] call FUNC(initAddBeamDialog));

    class controlsBackground
	{ 

        class IGUIBack_2213: IGUIBack
        {
            idc = 2213;
            x = 4.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 31.5 * GUI_GRID_W;
            h = 15 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.6};
        };
        class RscFrame_1813: RscFrame
        {
            idc = 1813;
            x = 4.5 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 31.5 * GUI_GRID_W;
            h = 15 * GUI_GRID_H;
            sizeEx = 1 * GUI_GRID_H;
        };
    };
    
    class controls
	{
        class FLAG_RscText_1013: RscStructuredText
        {
            idc = 1013;
            style = ST_MULTI;
            colorShadow[] = {0,0,0,0.5};
            font = DEFAULTFONT;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
            text = "Aktuelle Liste aller Beampunkte: (editierbar)<br/>(Einfügen mit STRG+V. Neue Zeile mit SHIFT+ENTER.)<br/>Format: [[Pos_X, 0, Pos_Y], Name, Level]<br/>Level 1: Inf, 2: Inf+KFZ, 3: Alles, 4: Nach Missionsstart";
            x = 6 * GUI_GRID_W + GUI_GRID_X;
            y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 30 * GUI_GRID_W;
            h = 5 * GUI_GRID_H;
        };
        class FLAG_RscEdit_1413: RscEdit
        {
            idc = 1413;
            style = ST_MULTI;
            x = 6 * GUI_GRID_W + GUI_GRID_X;
            y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 28.5 * GUI_GRID_W;
            h = 8.5 * GUI_GRID_H;
        };       
        class RscButton_1613: RscButton
        {
            idc = 1613;
            style = ST_CENTER + ST_VCENTER;
            text = "Übernehmen"; //--- ToDo: Localize;
            x = 5.5 * GUI_GRID_W + GUI_GRID_X;
            y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            sizeEx = (0.023 / (getResolution select 5));
            action = QUOTE([] call FUNC(addBeam););
        };
        class RscButton_1713: RscButton
        {
            idc = 1713;
            style = ST_CENTER + ST_VCENTER;
            text = "Schließen"; //--- ToDo: Localize;
            x = 27.5 * GUI_GRID_W + GUI_GRID_X;
            y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            sizeEx = (0.023 / (getResolution select 5));
            action = "closeDialog 0";
        };
    };
};
