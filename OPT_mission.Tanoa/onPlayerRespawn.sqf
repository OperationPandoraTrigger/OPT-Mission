if ((time>10)) then 
{
	switch (playerSide) do 
	{
		case west: 
		{
			player setPosASL [(markerPos "respawn_west" select 0) + (random 5) - 2.5, (markerPos "respawn_west" select 1) + (random 5) - 2.5, (getPosASL homeflag_west select 2) + 0.2];
		};

		case east: 
		{
			player setPosASL [(markerPos "respawn_east" select 0) + (random 5) - 2.5, (markerPos "respawn_east" select 1) + (random 5) - 2.5, (getPosASL homeflag_east select 2) + 0.2];
		};
	};
};