/**
 *  Progress Bar 1.3.1.0
 *  Copyright 2007-2010 Infernus' Group,
 *  Flávio Toribio (flavio_toribio@hotmail.com)
 */

#if defined _progress_included
	#endinput
#endif

#if !defined _samp_included
	#tryinclude <a_samp>
	#if !defined _samp_included
		#error could not locate a_samp.inc file, please check your server includes
	#endif
#endif

#tryinclude <foreach>

#define _progress_included
#define _progress_version	0x1310

#define MAX_BARS				(MAX_TEXT_DRAWS / 3)
#define INVALID_BAR_VALUE		(Float:0xFFFFFFFF)
#define INVALID_BAR_ID			(Bar:-1)
#define pb_percent(%1,%2,%3,%4)	((%1 - 6.0) + ((((%1 + 6.0 + %2 - 2.0) - %1) / %3) * %4))
//pb_percent(x, width, max, value)

/* Pawno/Infernus Pawn Editor function list*/
native Bar:CreateProgressBar(Float:x, Float:y, Float:width=55.5, Float:height=3.2, color, Float:max=100.0);
native DestroyProgressBar(Bar:barid);
native ShowProgressBarForPlayer(playerid, Bar:barid);
native HideProgressBarForPlayer(playerid, Bar:barid);
native ShowProgressBarForAll(Bar:barid);
native HideProgressBarForAll(Bar:barid);
native SetProgressBarValue(Bar:barid, Float:value);
native Float:GetProgressBarValue(Bar:barid);
native SetProgressBarMaxValue(Bar:barid, Float:max);
native SetProgressBarColor(Bar:barid, color);
native UpdateProgressBar(Bar:barid, playerid=INVALID_PLAYER_ID);


forward Bar:CreateProgressBar(Float:x, Float:y, Float:width=55.5, Float:height=3.2, color, Float:max=100.0);
forward Float:GetProgressBarValue(Bar:barid);

enum e_bar
{
	Float:pb_x,
	Float:pb_y,
	Float:pb_w,
	Float:pb_h,
	Float:pb_m,
	Float:pb_v,
	Text:pb_t1,
	Text:pb_t2,
	Text:pb_t3,
	pb_color,
	pbar_colour,
	bool:pb_created
}

static Bars[MAX_BARS][e_bar];

stock Bar:CreateProgressBar(Float:x, Float:y, Float:width=55.5, Float:height=3.2, color, Float:max=100.0)
{
	new
		barid;

	for(barid = 0; barid < sizeof Bars; ++barid)
		if(!Bars[barid][pb_created]) break;

	colour = 0xFF1C1CFF, Float:max=100.0, direction=BAR_DIRECTION_RIGHT);

	if(Bars[barid][pb_created] || barid == sizeof Bars)
		return INVALID_BAR_ID;

	new Text:in_t = Bars[barid][pb_t1] = TextDrawCreate(x, y, "_");
	TextDrawUseBox		(in_t, 1);
	TextDrawTextSize	(in_t, x + width, 0.0);
	TextDrawLetterSize	(in_t, 1.0, height / 10);
	TextDrawBoxColor	(in_t, 0x00000000 | (color & 0x000000FF));

	in_t = Bars[barid][pb_t2] = TextDrawCreate(x + 1.2, y + 2.15, "_");
	TextDrawUseBox		(in_t, 1);
	TextDrawTextSize	(in_t, x + width - 2.0, 0.0);
	TextDrawLetterSize	(in_t, 1.0, height / 10 - 0.35);
	TextDrawBoxColor	(in_t, (color & 0xFFFFFF00) | (0x66 & ((color & 0x000000FF) / 2)));

	in_t = Bars[barid][pb_t3] = TextDrawCreate(x + 1.2, y + 2.15, "_");
	TextDrawTextSize	(in_t, pb_percent(x, width, max, 1.0), 0.0);
	TextDrawLetterSize	(in_t, 1.0, height / 10 - 0.35);
	TextDrawBoxColor	(in_t, color);

	Bars[barid][pb_x] = x;
	Bars[barid][pb_y] = y;
	Bars[barid][pb_w] = width;
	Bars[barid][pb_h] = height;
	Bars[barid][pb_m] = max;
	pbar_Data[playerid][barid][pbar_colour] = colour;
	Bars[barid][pb_color] = color;
	Bars[barid][pb_created] = true;
	return Bar:barid;
}

stock DestroyProgressBar(Bar:barid)
{
	if(barid != INVALID_BAR_ID && Bar:-1 < barid < Bar:MAX_BARS)
	{
		if(!Bars[_:barid][pb_created])
			return 0;

		TextDrawDestroy(Bars[_:barid][pb_t1]);
		TextDrawDestroy(Bars[_:barid][pb_t2]);
		TextDrawDestroy(Bars[_:barid][pb_t3]);

		Bars[_:barid][pb_t1] = Text:0;       
		Bars[_:barid][pb_t2] = Text:0;       
		Bars[_:barid][pb_t3] = Text:0;
		Bars[_:barid][pb_x] = 0.0;
		Bars[_:barid][pb_y] = 0.0;
		Bars[_:barid][pb_w] = 0.0;
		Bars[_:barid][pb_h] = 0.0;
		Bars[_:barid][pb_m] = 0.0;
		Bars[_:barid][pb_v] = 0.0;
		Bars[_:barid][pb_color] = 0;
		Bars[_:barid][pb_created] = false;
		return 1;
	}
	return 0;
}

stock ShowProgressBarForPlayer(playerid, Bar:barid)
{
	if(IsPlayerConnected(playerid) && barid != INVALID_BAR_ID && Bar:-1 < barid < Bar:MAX_BARS)
	{
		if(!Bars[_:barid][pb_created])
			return 0;

		TextDrawShowForPlayer(playerid, Bars[_:barid][pb_t1]);
		TextDrawShowForPlayer(playerid, Bars[_:barid][pb_t2]);
		TextDrawShowForPlayer(playerid, Bars[_:barid][pb_t3]);
		return 1;
	}
	return 0;
}

stock HideProgressBarForPlayer(playerid, Bar:barid)
{
	if(IsPlayerConnected(playerid) && barid != INVALID_BAR_ID && Bar:-1 < barid < Bar:MAX_BARS)
	{
		if(!Bars[_:barid][pb_created])
			return 0;

		TextDrawHideForPlayer(playerid, Bars[_:barid][pb_t1]);
		TextDrawHideForPlayer(playerid, Bars[_:barid][pb_t2]);
		TextDrawHideForPlayer(playerid, Bars[_:barid][pb_t3]);
		return 1;
	}
	return 0;
}

stock SetProgressBarValue(Bar:barid, Float:value)
{
	if(barid == INVALID_BAR_ID || Bar:MAX_BARS < barid < Bar:-1)
		return 0;

	if(Bars[_:barid][pb_created])
	{
		value =
			(value < 0.0) ? (0.0) : (value > Bars[_:barid][pb_m]) ? (Bars[_:barid][pb_m]) : (value);

		TextDrawUseBox(Bars[_:barid][pb_t3], value > 0.0);

        Bars[_:barid][pb_v] = value;

		TextDrawTextSize(Bars[_:barid][pb_t3],
			pb_percent(Bars[_:barid][pb_x], Bars[_:barid][pb_w], Bars[_:barid][pb_m], value), 0.0);

		return 1;
	}
	return 0;
}

stock Float:GetProgressBarValue(Bar:barid)
{
	if(barid == INVALID_BAR_ID || Bar:MAX_BARS < barid < Bar:-1)
		return INVALID_BAR_VALUE;

	if(Bars[_:barid][pb_created])
		return Bars[_:barid][pb_v];

	return INVALID_BAR_VALUE; 
}

stock SetProgressBarMaxValue(Bar:barid, Float:max)
{
	if(barid == INVALID_BAR_ID || Bar:MAX_BARS < barid < Bar:-1)
		return 0;

	if(Bars[_:barid][pb_created])
	{
		Bars[_:barid][pb_m] = max;
		SetProgressBarValue(barid, Bars[_:barid][pb_v]);
		return 1;
	}
	return 0;
}
stock SetPlayerProgressBarColour(playerid, PlayerBar:barid, colour) {
	if(!IsValidPlayerProgressBar(playerid, barid)) {
		return 0;
	}

	pbar_Data[playerid][_:barid][pbar_colour] = colour;

	PlayerTextDrawBoxColor(playerid, pbar_TextDraw[playerid][_:barid][pbar_back], 0x00000000 | (colour & 0x000000FF));
	PlayerTextDrawBoxColor(playerid, pbar_TextDraw[playerid][_:barid][pbar_fill], (colour & 0xFFFFFF00) | (0x66 & ((colour & 0x000000FF) / 2)));
	PlayerTextDrawBoxColor(playerid, pbar_TextDraw[playerid][_:barid][pbar_main], colour);

	return 1;
}
stock SetProgressBarColor(Bar:barid, color)
{
	if(barid == INVALID_BAR_ID || Bar:MAX_BARS < barid < Bar:-1)
		return 0;

	if(Bars[_:barid][pb_created])
	{	
		Bars[_:barid][pb_color] = color;
		TextDrawBoxColor(Bars[_:barid][pb_t1], 0x00000000 | (color & 0x000000FF));

		TextDrawBoxColor(Bars[_:barid][pb_t2],
			(color & 0xFFFFFF00) | (0x66 & ((color & 0x000000FF) / 2)));

		TextDrawBoxColor(Bars[_:barid][pb_t3], color);
		return 1;
	}
	return 0;
}

stock ShowProgressBarForAll(Bar:barid)
{
	#if defined _foreach_included
	foreach(Player, i)
	#else
	for(new i = 0; i < MAX_PLAYERS; ++i)
		if(IsPlayerConnected(i))
	#endif
	#if defined IsPlayerNPC
		if(!IsPlayerNPC(i))
	#endif
	{
		ShowProgressBarForPlayer(i, barid);
	}
	return 1;
}

stock HideProgressBarForAll(Bar:barid)
{
	#if defined _foreach_included
	foreach(Player, i)
	#else
	for(new i = 0; i < MAX_PLAYERS; ++i)
		if(IsPlayerConnected(i))
	#endif
	#if defined IsPlayerNPC
		if(!IsPlayerNPC(i))
	#endif
	{
		HideProgressBarForPlayer(i, barid);
	}
	return 1;
}

stock UpdateProgressBar(Bar:barid, playerid=INVALID_PLAYER_ID)
{
	if(playerid == INVALID_PLAYER_ID)
	{
		return ShowProgressBarForAll(barid);
	} else {
		return ShowProgressBarForPlayer(playerid, barid);
	}
}

_progress2_renderBar(playerid, barid)
{
	if(!IsPlayerConnected(playerid)) {
		return false;
	}

	if(!IsValidPlayerProgressBar(playerid, PlayerBar:barid)) {
		return false;
	}

	PlayerTextDrawDestroy(playerid, pbar_TextDraw[playerid][barid][pbar_back]);
	PlayerTextDrawDestroy(playerid, pbar_TextDraw[playerid][barid][pbar_fill]);
	PlayerTextDrawDestroy(playerid, pbar_TextDraw[playerid][barid][pbar_main]);

	switch(pbar_Data[playerid][barid][pbar_direction]) {
		case BAR_DIRECTION_RIGHT: {
			pbar_TextDraw[playerid][barid][pbar_back] = CreatePlayerTextDraw(playerid, pbar_Data[playerid][barid][pbar_posX], pbar_Data[playerid][barid][pbar_posY], "_");
			PlayerTextDrawUseBox		(playerid, pbar_TextDraw[playerid][barid][pbar_back], 1);
			PlayerTextDrawTextSize		(playerid, pbar_TextDraw[playerid][barid][pbar_back], pbar_Data[playerid][barid][pbar_posX] + pbar_Data[playerid][barid][pbar_width] - 4.0, 0.0);
			PlayerTextDrawLetterSize	(playerid, pbar_TextDraw[playerid][barid][pbar_back], 1.0, pbar_Data[playerid][barid][pbar_height] / 10);
			PlayerTextDrawBoxColor		(playerid, pbar_TextDraw[playerid][barid][pbar_back], 0x00000000 | (pbar_Data[playerid][barid][pbar_colour] & 0x000000FF));

			pbar_TextDraw[playerid][barid][pbar_fill] = CreatePlayerTextDraw(playerid, pbar_Data[playerid][barid][pbar_posX] + 1.2, pbar_Data[playerid][barid][pbar_posY] + 2.15, "_");
			PlayerTextDrawUseBox		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], 1);
			PlayerTextDrawTextSize		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], pbar_Data[playerid][barid][pbar_posX] + pbar_Data[playerid][barid][pbar_width] - 5.5, 0.0);
			PlayerTextDrawLetterSize	(playerid, pbar_TextDraw[playerid][barid][pbar_fill], 1.0, pbar_Data[playerid][barid][pbar_height] / 10 - 0.35);
			PlayerTextDrawBoxColor		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], (pbar_Data[playerid][barid][pbar_colour] & 0xFFFFFF00) | (0x66 & ((pbar_Data[playerid][barid][pbar_colour] & 0x000000FF) / 2)));

			pbar_TextDraw[playerid][barid][pbar_main] = CreatePlayerTextDraw(playerid, pbar_Data[playerid][barid][pbar_posX] + 1.2, pbar_Data[playerid][barid][pbar_posY] + 2.15, "_");
			PlayerTextDrawUseBox		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], 1);
			PlayerTextDrawTextSize		(playerid, pbar_TextDraw[playerid][barid][pbar_main], _bar_percent(pbar_Data[playerid][barid][pbar_posX], pbar_Data[playerid][barid][pbar_width], pbar_Data[playerid][barid][pbar_maxValue], pbar_Data[playerid][barid][pbar_progressValue], pbar_Data[playerid][barid][pbar_direction]), 0.0);
			PlayerTextDrawLetterSize	(playerid, pbar_TextDraw[playerid][barid][pbar_main], 1.0, pbar_Data[playerid][barid][pbar_height] / 10 - 0.35);
			PlayerTextDrawBoxColor		(playerid, pbar_TextDraw[playerid][barid][pbar_main], pbar_Data[playerid][barid][pbar_colour]);
		}
		case BAR_DIRECTION_LEFT: {
			pbar_TextDraw[playerid][barid][pbar_back] = CreatePlayerTextDraw(playerid, pbar_Data[playerid][barid][pbar_posX], pbar_Data[playerid][barid][pbar_posY], "_");
			PlayerTextDrawUseBox		(playerid, pbar_TextDraw[playerid][barid][pbar_back], 1);
			PlayerTextDrawTextSize		(playerid, pbar_TextDraw[playerid][barid][pbar_back], pbar_Data[playerid][barid][pbar_posX] - pbar_Data[playerid][barid][pbar_width] - 4.0, 0.0);
			PlayerTextDrawLetterSize	(playerid, pbar_TextDraw[playerid][barid][pbar_back], 1.0, pbar_Data[playerid][barid][pbar_height] / 10);
			PlayerTextDrawBoxColor		(playerid, pbar_TextDraw[playerid][barid][pbar_back], 0x00000000 | (pbar_Data[playerid][barid][pbar_colour] & 0x000000FF));

			pbar_TextDraw[playerid][barid][pbar_fill] = CreatePlayerTextDraw(playerid, pbar_Data[playerid][barid][pbar_posX] - 1.2, pbar_Data[playerid][barid][pbar_posY] + 2.15, "_");
			PlayerTextDrawUseBox		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], 1);
			PlayerTextDrawTextSize		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], pbar_Data[playerid][barid][pbar_posX] - pbar_Data[playerid][barid][pbar_width] - 2.5, 0.0);
			PlayerTextDrawLetterSize	(playerid, pbar_TextDraw[playerid][barid][pbar_fill], 1.0, pbar_Data[playerid][barid][pbar_height] / 10 - 0.35);
			PlayerTextDrawBoxColor		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], (pbar_Data[playerid][barid][pbar_colour] & 0xFFFFFF00) | (0x66 & ((pbar_Data[playerid][barid][pbar_colour] & 0x000000FF) / 2)));

			pbar_TextDraw[playerid][barid][pbar_main] = CreatePlayerTextDraw(playerid, pbar_Data[playerid][barid][pbar_posX] - 1.2, pbar_Data[playerid][barid][pbar_posY] + 2.15, "_");
			PlayerTextDrawUseBox		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], 1);
			PlayerTextDrawTextSize		(playerid, pbar_TextDraw[playerid][barid][pbar_main], _bar_percent(pbar_Data[playerid][barid][pbar_posX], pbar_Data[playerid][barid][pbar_width], pbar_Data[playerid][barid][pbar_maxValue], pbar_Data[playerid][barid][pbar_progressValue], pbar_Data[playerid][barid][pbar_direction]), 0.0);
			PlayerTextDrawLetterSize	(playerid, pbar_TextDraw[playerid][barid][pbar_main], 1.0, pbar_Data[playerid][barid][pbar_height] / 10 - 0.35);
			PlayerTextDrawBoxColor		(playerid, pbar_TextDraw[playerid][barid][pbar_main], pbar_Data[playerid][barid][pbar_colour]);
		}
		case BAR_DIRECTION_UP: {
			pbar_TextDraw[playerid][barid][pbar_back] = CreatePlayerTextDraw(playerid, pbar_Data[playerid][barid][pbar_posX], pbar_Data[playerid][barid][pbar_posY], "_");
			PlayerTextDrawUseBox		(playerid, pbar_TextDraw[playerid][barid][pbar_back], 1);
			PlayerTextDrawTextSize		(playerid, pbar_TextDraw[playerid][barid][pbar_back], pbar_Data[playerid][barid][pbar_posX] - pbar_Data[playerid][barid][pbar_width] - 4.0, 0.0);
			PlayerTextDrawLetterSize	(playerid, pbar_TextDraw[playerid][barid][pbar_back], 1.0, -((pbar_Data[playerid][barid][pbar_height] / 10) * 1.02) -0.35);
			PlayerTextDrawBoxColor		(playerid, pbar_TextDraw[playerid][barid][pbar_back], 0x00000000 | (pbar_Data[playerid][barid][pbar_colour] & 0x000000FF));

			pbar_TextDraw[playerid][barid][pbar_fill] = CreatePlayerTextDraw(playerid, pbar_Data[playerid][barid][pbar_posX] - 1.2, pbar_Data[playerid][barid][pbar_posY] - 1.0, "_");
			PlayerTextDrawUseBox		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], 1);
			PlayerTextDrawTextSize		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], pbar_Data[playerid][barid][pbar_posX] - pbar_Data[playerid][barid][pbar_width] - 2.5, 0.0);
			PlayerTextDrawLetterSize	(playerid, pbar_TextDraw[playerid][barid][pbar_fill], 1.0, -(pbar_Data[playerid][barid][pbar_height] / 10.0) * 1.02);
			PlayerTextDrawBoxColor		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], (pbar_Data[playerid][barid][pbar_colour] & 0xFFFFFF00) | (0x66 & ((pbar_Data[playerid][barid][pbar_colour] & 0x000000FF) / 2)));

			pbar_TextDraw[playerid][barid][pbar_main] = CreatePlayerTextDraw(playerid, pbar_Data[playerid][barid][pbar_posX] - 1.2, pbar_Data[playerid][barid][pbar_posY] - 1.0, "_");
			PlayerTextDrawUseBox		(playerid, pbar_TextDraw[playerid][barid][pbar_main], 1);
			PlayerTextDrawTextSize		(playerid, pbar_TextDraw[playerid][barid][pbar_main], pbar_Data[playerid][barid][pbar_posX] - pbar_Data[playerid][barid][pbar_width] - 2.5, 0.0);
			PlayerTextDrawLetterSize	(playerid, pbar_TextDraw[playerid][barid][pbar_main], 1.0, _bar_percent(pbar_Data[playerid][_:barid][pbar_posX], pbar_Data[playerid][_:barid][pbar_height], pbar_Data[playerid][_:barid][pbar_maxValue], pbar_Data[playerid][barid][pbar_progressValue], pbar_Data[playerid][barid][pbar_direction]));
			PlayerTextDrawBoxColor		(playerid, pbar_TextDraw[playerid][barid][pbar_main], pbar_Data[playerid][barid][pbar_colour]);
		}
		case BAR_DIRECTION_DOWN: {
			pbar_TextDraw[playerid][barid][pbar_back] = CreatePlayerTextDraw(playerid, pbar_Data[playerid][barid][pbar_posX], pbar_Data[playerid][barid][pbar_posY], "_");
			PlayerTextDrawUseBox		(playerid, pbar_TextDraw[playerid][barid][pbar_back], 1);
			PlayerTextDrawTextSize		(playerid, pbar_TextDraw[playerid][barid][pbar_back], pbar_Data[playerid][barid][pbar_posX] - pbar_Data[playerid][barid][pbar_width] - 4.0, 0.0);
			PlayerTextDrawLetterSize	(playerid, pbar_TextDraw[playerid][barid][pbar_back], 1.0, ((pbar_Data[playerid][barid][pbar_height] / 10)) -0.35);
			PlayerTextDrawBoxColor		(playerid, pbar_TextDraw[playerid][barid][pbar_back], 0x00000000 | (pbar_Data[playerid][barid][pbar_colour] & 0x000000FF));

			pbar_TextDraw[playerid][barid][pbar_fill] = CreatePlayerTextDraw(playerid, pbar_Data[playerid][barid][pbar_posX] - 1.2, pbar_Data[playerid][barid][pbar_posY] + 1.0, "_");
			PlayerTextDrawUseBox		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], 1);
			PlayerTextDrawTextSize		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], pbar_Data[playerid][barid][pbar_posX] - pbar_Data[playerid][barid][pbar_width] - 2.5, 0.0);
			PlayerTextDrawLetterSize	(playerid, pbar_TextDraw[playerid][barid][pbar_fill], 1.0, (pbar_Data[playerid][barid][pbar_height] / 10.0) - 0.55);
			PlayerTextDrawBoxColor		(playerid, pbar_TextDraw[playerid][barid][pbar_fill], (pbar_Data[playerid][barid][pbar_colour] & 0xFFFFFF00) | (0x66 & ((pbar_Data[playerid][barid][pbar_colour] & 0x000000FF) / 2)));

			pbar_TextDraw[playerid][barid][pbar_main] = CreatePlayerTextDraw(playerid, pbar_Data[playerid][barid][pbar_posX] - 1.2, pbar_Data[playerid][barid][pbar_posY] + 1.0, "_");
			PlayerTextDrawUseBox		(playerid, pbar_TextDraw[playerid][barid][pbar_main], 1);
			PlayerTextDrawTextSize		(playerid, pbar_TextDraw[playerid][barid][pbar_main], pbar_Data[playerid][barid][pbar_posX] - pbar_Data[playerid][barid][pbar_width] - 2.5, 0.0);
			PlayerTextDrawLetterSize	(playerid, pbar_TextDraw[playerid][barid][pbar_main], 1.0, _bar_percent(pbar_Data[playerid][_:barid][pbar_posX], pbar_Data[playerid][_:barid][pbar_height], pbar_Data[playerid][_:barid][pbar_maxValue], pbar_Data[playerid][barid][pbar_progressValue], pbar_Data[playerid][barid][pbar_direction]));
			PlayerTextDrawBoxColor		(playerid, pbar_TextDraw[playerid][barid][pbar_main], pbar_Data[playerid][barid][pbar_colour]);
		}
	}

	if(pbar_Data[playerid][barid][pbar_show]) {
		ShowPlayerProgressBar(playerid, PlayerBar:barid);
	}

	return true;
}