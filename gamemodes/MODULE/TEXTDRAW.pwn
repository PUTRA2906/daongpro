//------------[ Textdraw ]------------


//Info textdraw
new PlayerText:InfoTD[MAX_PLAYERS];
new Text:TextTime, Text:TextDate;

//Server Name textdraw
new Text:ServerName;
new Text:TDTime[2];
new TD_Random_Messages_Intro[ ][ ] =
{
	"Indo Vibes ~w~Roleplay"
};

function TDUpdates()
{
	TextDrawSetString(Text:ServerName, TD_Random_Messages_Intro[random(sizeof(TD_Random_Messages_Intro))]);
}
new Text:AnimH4N;
//Modern
new Text:HudChar[5];
new Text:CharBox;
new Text:VehBox;
new Text:HudVeh[6];
new Text:TextFare;

new PlayerText:HBEO[MAX_PLAYERS];
new PlayerText:HBEC[MAX_PLAYERS];

new PlayerText:DPname[MAX_PLAYERS];
new PlayerText:DPmoney[MAX_PLAYERS];
new PlayerText:DPcoin[MAX_PLAYERS];

new PlayerText:DPvehname[MAX_PLAYERS];
new PlayerText:DPvehengine[MAX_PLAYERS];
new PlayerText:DPvehspeed[MAX_PLAYERS];
new Text:DPvehfare[MAX_PLAYERS];

//simple
new Text:DGhudchar[9];
new Text:DGhudveh[3];
new PlayerText:DigiHunger[MAX_PLAYERS];
new PlayerText:DigiEnergi[MAX_PLAYERS];
new PlayerText:DigiBladdy[MAX_PLAYERS];
new PlayerText:SPvehengine[MAX_PLAYERS];
new PlayerText:SPvehname[MAX_PLAYERS];
new PlayerText:DGHBEC[MAX_PLAYERS];
new PlayerText:ActiveTD[MAX_PLAYERS];

//Textdraw Mode
new Text:DigiHPTD[5];
new PlayerText:PreviuwModelBarHp[MAX_PLAYERS];
new PlayerText:PreviewModelBarArmour[MAX_PLAYERS];
new PlayerText:BoxBarArmour[MAX_PLAYERS];
new PlayerText:BoxBarHp[MAX_PLAYERS];
//SetVobjPos
new PlayerText:EditVObjTD[MAX_PLAYERS][8];

//settoyspos
new PlayerText:EditToysTD[MAX_PLAYERS][5];
new PlayerText:ToysTDdown[MAX_PLAYERS];
new PlayerText:ToysTDup[MAX_PLAYERS];
new PlayerText:ToysTDsave[MAX_PLAYERS];
new PlayerText:ToysTDedit[MAX_PLAYERS];

CreatePlayerTextDraws(playerid)
{
	//Info textdraw
	InfoTD[playerid] = CreatePlayerTextDraw(playerid, 148.888, 361.385, "Welcome!");
 	PlayerTextDrawLetterSize(playerid, InfoTD[playerid], 0.326, 1.654);
	PlayerTextDrawAlignment(playerid, InfoTD[playerid], 1);
	PlayerTextDrawColor(playerid, InfoTD[playerid], -1);
	PlayerTextDrawSetOutline(playerid, InfoTD[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, InfoTD[playerid], 0x000000FF);
	PlayerTextDrawFont(playerid, InfoTD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, InfoTD[playerid], 1);

	ActiveTD[playerid] = CreatePlayerTextDraw(playerid, 324.000000, 113.000000, "-");
	PlayerTextDrawFont(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ActiveTD[playerid], 0.329165, 2.050004);
	PlayerTextDrawTextSize(playerid, ActiveTD[playerid], 298.500000, 219.500000);
	PlayerTextDrawSetOutline(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ActiveTD[playerid], 0);
	PlayerTextDrawAlignment(playerid, ActiveTD[playerid], 2);
	PlayerTextDrawColor(playerid, ActiveTD[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, ActiveTD[playerid], 255);
	PlayerTextDrawBoxColor(playerid, ActiveTD[playerid], 135);
	PlayerTextDrawUseBox(playerid, ActiveTD[playerid], 0);
	PlayerTextDrawSetProportional(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ActiveTD[playerid], 0);
	
	//HBE Textdraw Modern
	HBEO[playerid] = CreatePlayerTextDraw(playerid, 468.000000, 322.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, HBEO[playerid], 5);
	PlayerTextDrawLetterSize(playerid, HBEO[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBEO[playerid], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, HBEO[playerid], 0);
	PlayerTextDrawSetShadow(playerid, HBEO[playerid], 0);
	PlayerTextDrawAlignment(playerid, HBEO[playerid], 1);
	PlayerTextDrawColor(playerid, HBEO[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, HBEO[playerid], 0);
	PlayerTextDrawBoxColor(playerid, HBEO[playerid], 255);
	PlayerTextDrawUseBox(playerid, HBEO[playerid], 0);
	PlayerTextDrawSetProportional(playerid, HBEO[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, HBEO[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], 19482);
	PlayerTextDrawSetPreviewRot(playerid, HBEO[playerid], -10.000000, 0.000000, 23.000000, 1.350000);
	PlayerTextDrawSetPreviewVehCol(playerid, HBEO[playerid], 1, 1);

	DPname[playerid] = CreatePlayerTextDraw(playerid, 574.000000, 328.000000, "Han_Kennedy");
	PlayerTextDrawFont(playerid, DPname[playerid], 1);
	PlayerTextDrawLetterSize(playerid, DPname[playerid], 0.283333, 1.450000);
	PlayerTextDrawTextSize(playerid, DPname[playerid], 637.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, DPname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPname[playerid], 1);
	PlayerTextDrawAlignment(playerid, DPname[playerid], 2);
	PlayerTextDrawColor(playerid, DPname[playerid], -1378294017);
	PlayerTextDrawBackgroundColor(playerid, DPname[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DPname[playerid], 50);
	PlayerTextDrawUseBox(playerid, DPname[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DPname[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DPname[playerid], 0);

	DPcoin[playerid] = CreatePlayerTextDraw(playerid, 579.000000, 429.000000, "Gold: 1");
	PlayerTextDrawFont(playerid, DPcoin[playerid], 1);
	PlayerTextDrawLetterSize(playerid, DPcoin[playerid], 0.162498, 1.149997);
	PlayerTextDrawTextSize(playerid, DPcoin[playerid], 637.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, DPcoin[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPcoin[playerid], 1);
	PlayerTextDrawAlignment(playerid, DPcoin[playerid], 1);
	PlayerTextDrawColor(playerid, DPcoin[playerid], -2686721);
	PlayerTextDrawBackgroundColor(playerid, DPcoin[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DPcoin[playerid], 50);
	PlayerTextDrawUseBox(playerid, DPcoin[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DPcoin[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DPcoin[playerid], 0);

	DPmoney[playerid] = CreatePlayerTextDraw(playerid, 596.000000, 357.000000, "$999,99");
	PlayerTextDrawFont(playerid, DPmoney[playerid], 1);
	PlayerTextDrawLetterSize(playerid, DPmoney[playerid], 0.191666, 1.049998);
	PlayerTextDrawTextSize(playerid, DPmoney[playerid], 637.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, DPmoney[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPmoney[playerid], 1);
	PlayerTextDrawAlignment(playerid, DPmoney[playerid], 2);
	PlayerTextDrawColor(playerid, DPmoney[playerid], 9109759);
	PlayerTextDrawBackgroundColor(playerid, DPmoney[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DPmoney[playerid], 50);
	PlayerTextDrawUseBox(playerid, DPmoney[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DPmoney[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DPmoney[playerid], 0);

	DPvehname[playerid] = CreatePlayerTextDraw(playerid, 436.000000, 331.000000, "Elegy");
	PlayerTextDrawFont(playerid, DPvehname[playerid], 1);
	PlayerTextDrawLetterSize(playerid, DPvehname[playerid], 0.275000, 1.150003);
	PlayerTextDrawTextSize(playerid, DPvehname[playerid], 300.000000, 178.500000);
	PlayerTextDrawSetOutline(playerid, DPvehname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPvehname[playerid], 0);
	PlayerTextDrawAlignment(playerid, DPvehname[playerid], 2);
	PlayerTextDrawColor(playerid, DPvehname[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, DPvehname[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DPvehname[playerid], 135);
	PlayerTextDrawUseBox(playerid, DPvehname[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DPvehname[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DPvehname[playerid], 0);

	HBEC[playerid] = CreatePlayerTextDraw(playerid, 407.000000, 327.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, HBEC[playerid], 5);
	PlayerTextDrawLetterSize(playerid, HBEC[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, HBEC[playerid], 110.000000, 124.500000);
	PlayerTextDrawSetOutline(playerid, HBEC[playerid], 0);
	PlayerTextDrawSetShadow(playerid, HBEC[playerid], 0);
	PlayerTextDrawAlignment(playerid, HBEC[playerid], 1);
	PlayerTextDrawColor(playerid, HBEC[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, HBEC[playerid], 0);
	PlayerTextDrawBoxColor(playerid, HBEC[playerid], 255);
	PlayerTextDrawUseBox(playerid, HBEC[playerid], 0);
	PlayerTextDrawSetProportional(playerid, HBEC[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, HBEC[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, HBEC[playerid], 19482);
	PlayerTextDrawSetPreviewRot(playerid, HBEC[playerid], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, HBEC[playerid], 1, 1);

	DPvehengine[playerid] = CreatePlayerTextDraw(playerid, 468.000000, 428.000000, "ON");
	PlayerTextDrawFont(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawLetterSize(playerid, DPvehengine[playerid], 0.191666, 1.049998);
	PlayerTextDrawTextSize(playerid, DPvehengine[playerid], 637.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawAlignment(playerid, DPvehengine[playerid], 2);
	PlayerTextDrawColor(playerid, DPvehengine[playerid], -16776961);
	PlayerTextDrawBackgroundColor(playerid, DPvehengine[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DPvehengine[playerid], 50);
	PlayerTextDrawUseBox(playerid, DPvehengine[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DPvehengine[playerid], 0);

	DPvehspeed[playerid] = CreatePlayerTextDraw(playerid, 483.000000, 350.000000, "120_mph");
	PlayerTextDrawFont(playerid, DPvehspeed[playerid], 3);
	PlayerTextDrawLetterSize(playerid, DPvehspeed[playerid], 0.191666, 1.049998);
	PlayerTextDrawTextSize(playerid, DPvehspeed[playerid], 637.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawAlignment(playerid, DPvehspeed[playerid], 3);
	PlayerTextDrawColor(playerid, DPvehspeed[playerid], 16711935);
	PlayerTextDrawBackgroundColor(playerid, DPvehspeed[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DPvehspeed[playerid], 50);
	PlayerTextDrawUseBox(playerid, DPvehspeed[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DPvehspeed[playerid], 0);

	DPvehfare[playerid] = TextDrawCreate(462.000000, 401.166687, "$500.000");
	TextDrawLetterSize(DPvehfare[playerid], 0.216000, 0.952498);
	TextDrawAlignment(DPvehfare[playerid], 1);
	TextDrawColor(DPvehfare[playerid], 16711935);
	TextDrawSetShadow(DPvehfare[playerid], 0);
	TextDrawSetOutline(DPvehfare[playerid], 1);
	TextDrawBackgroundColor(DPvehfare[playerid], 255);
	TextDrawFont(DPvehfare[playerid], 1);
	TextDrawSetProportional(DPvehfare[playerid], 1);
	TextDrawSetShadow(DPvehfare[playerid], 0);
	//Simple Hud
	DGHBEC[playerid] = CreatePlayerTextDraw(playerid, 476.000000, 344.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, DGHBEC[playerid], 5);
	PlayerTextDrawLetterSize(playerid, DGHBEC[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, DGHBEC[playerid], 113.000000, 102.000000);
	PlayerTextDrawSetOutline(playerid, DGHBEC[playerid], 0);
	PlayerTextDrawSetShadow(playerid, DGHBEC[playerid], 0);
	PlayerTextDrawAlignment(playerid, DGHBEC[playerid], 1);
	PlayerTextDrawColor(playerid, DGHBEC[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, DGHBEC[playerid], 0);
	PlayerTextDrawBoxColor(playerid, DGHBEC[playerid], 255);
	PlayerTextDrawUseBox(playerid, DGHBEC[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DGHBEC[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DGHBEC[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, DGHBEC[playerid], 515);
	PlayerTextDrawSetPreviewRot(playerid, DGHBEC[playerid], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, DGHBEC[playerid], 1, 1);

	DigiHunger[playerid] = CreatePlayerTextDraw(playerid, 618.000000, 434.000000, "100");
	PlayerTextDrawFont(playerid, DigiHunger[playerid], 2);
	PlayerTextDrawLetterSize(playerid, DigiHunger[playerid], 0.241666, 0.899999);
	PlayerTextDrawTextSize(playerid, DigiHunger[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, DigiHunger[playerid], 0);
	PlayerTextDrawSetShadow(playerid, DigiHunger[playerid], 1);
	PlayerTextDrawAlignment(playerid, DigiHunger[playerid], 2);
	PlayerTextDrawColor(playerid, DigiHunger[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, DigiHunger[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DigiHunger[playerid], 50);
	PlayerTextDrawUseBox(playerid, DigiHunger[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DigiHunger[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DigiHunger[playerid], 0);

	DigiEnergi[playerid] = CreatePlayerTextDraw(playerid, 565.000000, 434.000000, "100");
	PlayerTextDrawFont(playerid, DigiEnergi[playerid], 2);
	PlayerTextDrawLetterSize(playerid, DigiEnergi[playerid], 0.241666, 0.899999);
	PlayerTextDrawTextSize(playerid, DigiEnergi[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, DigiEnergi[playerid], 0);
	PlayerTextDrawSetShadow(playerid, DigiEnergi[playerid], 1);
	PlayerTextDrawAlignment(playerid, DigiEnergi[playerid], 2);
	PlayerTextDrawColor(playerid, DigiEnergi[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, DigiEnergi[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DigiEnergi[playerid], 50);
	PlayerTextDrawUseBox(playerid, DigiEnergi[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DigiEnergi[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DigiEnergi[playerid], 0);

	DigiBladdy[playerid] = CreatePlayerTextDraw(playerid, 513.000000, 434.000000, "100");
	PlayerTextDrawFont(playerid, DigiBladdy[playerid], 2);
	PlayerTextDrawLetterSize(playerid, DigiBladdy[playerid], 0.241666, 0.899999);
	PlayerTextDrawTextSize(playerid, DigiBladdy[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, DigiBladdy[playerid], 0);
	PlayerTextDrawSetShadow(playerid, DigiBladdy[playerid], 1);
	PlayerTextDrawAlignment(playerid, DigiBladdy[playerid], 2);
	PlayerTextDrawColor(playerid, DigiBladdy[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, DigiBladdy[playerid], 255);
	PlayerTextDrawBoxColor(playerid, DigiBladdy[playerid], 50);
	PlayerTextDrawUseBox(playerid, DigiBladdy[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DigiBladdy[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, DigiBladdy[playerid], 0);

	SPvehengine[playerid] = CreatePlayerTextDraw(playerid, 605.000000, 414.000000, "ON");
	PlayerTextDrawFont(playerid, SPvehengine[playerid], 1);
	PlayerTextDrawLetterSize(playerid, SPvehengine[playerid], 0.204162, 1.399999);
	PlayerTextDrawTextSize(playerid, SPvehengine[playerid], 543.500000, 19.000000);
	PlayerTextDrawSetOutline(playerid, SPvehengine[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SPvehengine[playerid], 0);
	PlayerTextDrawAlignment(playerid, SPvehengine[playerid], 2);
	PlayerTextDrawColor(playerid, SPvehengine[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, SPvehengine[playerid], 255);
	PlayerTextDrawBoxColor(playerid, SPvehengine[playerid], 133);
	PlayerTextDrawUseBox(playerid, SPvehengine[playerid], 0);
	PlayerTextDrawSetProportional(playerid, SPvehengine[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, SPvehengine[playerid], 0);

	SPvehname[playerid] = CreatePlayerTextDraw(playerid, 605.000000, 373.000000, "INFERNUS");
	PlayerTextDrawFont(playerid, SPvehname[playerid], 1);
	PlayerTextDrawLetterSize(playerid, SPvehname[playerid], 0.204162, 1.249999);
	PlayerTextDrawTextSize(playerid, SPvehname[playerid], 543.500000, 153.000000);
	PlayerTextDrawSetOutline(playerid, SPvehname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SPvehname[playerid], 0);
	PlayerTextDrawAlignment(playerid, SPvehname[playerid], 2);
	PlayerTextDrawColor(playerid, SPvehname[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, SPvehname[playerid], 255);
	PlayerTextDrawBoxColor(playerid, SPvehname[playerid], 133);
	PlayerTextDrawUseBox(playerid, SPvehname[playerid], 0);
	PlayerTextDrawSetProportional(playerid, SPvehname[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, SPvehname[playerid], 0);

	//Set vObj atth pos
	EditVObjTD[playerid][0] = CreatePlayerTextDraw(playerid, 263.000000, 406.000000, "_");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][0], 0.154164, 2.700001);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][0], 1.000000, 282.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][0], -741092407);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][0], 0);

	EditVObjTD[playerid][1] = CreatePlayerTextDraw(playerid, 263.000000, 362.000000, "_");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][1], 0.154164, 9.150011);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][1], 1.000000, 94.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][1], -741092407);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][1], 0);

	EditVObjTD[playerid][2] = CreatePlayerTextDraw(playerid, 358.000000, 408.000000, "+");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][2], 0.258332, 2.149998);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][2], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][2], 1296911816);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][2], 1);

	EditVObjTD[playerid][3] = CreatePlayerTextDraw(playerid, 169.000000, 408.000000, "-");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][3], 0.258332, 2.149998);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][3], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][3], 1296911816);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][3], 1);

	EditVObjTD[playerid][4] = CreatePlayerTextDraw(playerid, 263.000000, 389.000000, "SAVE");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][4], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][4], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][4], 16711881);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][4], 1);

	EditVObjTD[playerid][5] = CreatePlayerTextDraw(playerid, 264.000000, 409.000000, "Cordinate");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][5], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][5], 16.500000, 92.000000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][5], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][5], 1296911817);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][5], 0);

	EditVObjTD[playerid][6] = CreatePlayerTextDraw(playerid, 263.000000, 429.000000, "BACK");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][6], 0.258332, 1.450000);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][6], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][6], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][6], -16777015);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][6], 1);

	EditVObjTD[playerid][7] = CreatePlayerTextDraw(playerid, 263.000000, 366.000000, "EDITING");
	PlayerTextDrawFont(playerid, EditVObjTD[playerid][7], 1);
	PlayerTextDrawLetterSize(playerid, EditVObjTD[playerid][7], 0.258332, 1.750000);
	PlayerTextDrawTextSize(playerid, EditVObjTD[playerid][7], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, EditVObjTD[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, EditVObjTD[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, EditVObjTD[playerid][7], 2);
	PlayerTextDrawColor(playerid, EditVObjTD[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, EditVObjTD[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, EditVObjTD[playerid][7], -1378294071);
	PlayerTextDrawUseBox(playerid, EditVObjTD[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, EditVObjTD[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, EditVObjTD[playerid][7], 1);

	//edit toys td
	EditToysTD[playerid][0] = CreatePlayerTextDraw(playerid, 174.000000, 160.000000, "_");
	PlayerTextDrawFont(playerid, EditToysTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, EditToysTD[playerid][0], 0.266665, 11.750000);
	PlayerTextDrawTextSize(playerid, EditToysTD[playerid][0], 298.500000, 83.500000);
	PlayerTextDrawSetOutline(playerid, EditToysTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, EditToysTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, EditToysTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, EditToysTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, EditToysTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, EditToysTD[playerid][0], -1061109690);
	PlayerTextDrawUseBox(playerid, EditToysTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, EditToysTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, EditToysTD[playerid][0], 0);

	EditToysTD[playerid][1] = CreatePlayerTextDraw(playerid, 84.000000, 160.000000, "_");
	PlayerTextDrawFont(playerid, EditToysTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, EditToysTD[playerid][1], 0.266665, 11.750000);
	PlayerTextDrawTextSize(playerid, EditToysTD[playerid][1], 298.500000, 83.500000);
	PlayerTextDrawSetOutline(playerid, EditToysTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, EditToysTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, EditToysTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, EditToysTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, EditToysTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, EditToysTD[playerid][1], -1061109690);
	PlayerTextDrawUseBox(playerid, EditToysTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, EditToysTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, EditToysTD[playerid][1], 0);

	EditToysTD[playerid][2] = CreatePlayerTextDraw(playerid, 84.000000, 171.000000, "_");
	PlayerTextDrawFont(playerid, EditToysTD[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, EditToysTD[playerid][2], 0.600000, 9.200007);
	PlayerTextDrawTextSize(playerid, EditToysTD[playerid][2], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, EditToysTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, EditToysTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, EditToysTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, EditToysTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, EditToysTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, EditToysTD[playerid][2], 135);
	PlayerTextDrawUseBox(playerid, EditToysTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, EditToysTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, EditToysTD[playerid][2], 0);

	ToysTDdown[playerid] = CreatePlayerTextDraw(playerid, 74.000000, 229.000000, "ld_beat:down");
	PlayerTextDrawFont(playerid, ToysTDdown[playerid], 4);
	PlayerTextDrawLetterSize(playerid, ToysTDdown[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ToysTDdown[playerid], 20.000000, 24.000000);
	PlayerTextDrawSetOutline(playerid, ToysTDdown[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ToysTDdown[playerid], 0);
	PlayerTextDrawAlignment(playerid, ToysTDdown[playerid], 1);
	PlayerTextDrawColor(playerid, ToysTDdown[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, ToysTDdown[playerid], 255);
	PlayerTextDrawBoxColor(playerid, ToysTDdown[playerid], 50);
	PlayerTextDrawUseBox(playerid, ToysTDdown[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ToysTDdown[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ToysTDdown[playerid], 1);

	ToysTDup[playerid] = CreatePlayerTextDraw(playerid, 74.000000, 174.000000, "ld_beat:up");
	PlayerTextDrawFont(playerid, ToysTDup[playerid], 4);
	PlayerTextDrawLetterSize(playerid, ToysTDup[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, ToysTDup[playerid], 20.000000, 24.000000);
	PlayerTextDrawSetOutline(playerid, ToysTDup[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ToysTDup[playerid], 0);
	PlayerTextDrawAlignment(playerid, ToysTDup[playerid], 1);
	PlayerTextDrawColor(playerid, ToysTDup[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, ToysTDup[playerid], 255);
	PlayerTextDrawBoxColor(playerid, ToysTDup[playerid], 50);
	PlayerTextDrawUseBox(playerid, ToysTDup[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ToysTDup[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ToysTDup[playerid], 1);

	EditToysTD[playerid][3] = CreatePlayerTextDraw(playerid, 174.000000, 171.000000, "_");
	PlayerTextDrawFont(playerid, EditToysTD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, EditToysTD[playerid][3], 0.600000, 9.200007);
	PlayerTextDrawTextSize(playerid, EditToysTD[playerid][3], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, EditToysTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, EditToysTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, EditToysTD[playerid][3], 2);
	PlayerTextDrawColor(playerid, EditToysTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, EditToysTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, EditToysTD[playerid][3], 135);
	PlayerTextDrawUseBox(playerid, EditToysTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, EditToysTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, EditToysTD[playerid][3], 0);

	ToysTDsave[playerid] = CreatePlayerTextDraw(playerid, 174.000000, 270.000000, "SAVE");
	PlayerTextDrawFont(playerid, ToysTDsave[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ToysTDsave[playerid], 0.600000, 1.600000);
	PlayerTextDrawTextSize(playerid, ToysTDsave[playerid], 298.500000, 83.500000);
	PlayerTextDrawSetOutline(playerid, ToysTDsave[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ToysTDsave[playerid], 0);
	PlayerTextDrawAlignment(playerid, ToysTDsave[playerid], 2);
	PlayerTextDrawColor(playerid, ToysTDsave[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, ToysTDsave[playerid], 255);
	PlayerTextDrawBoxColor(playerid, ToysTDsave[playerid], 135);
	PlayerTextDrawUseBox(playerid, ToysTDsave[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ToysTDsave[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ToysTDsave[playerid], 1);

	ToysTDedit[playerid] = CreatePlayerTextDraw(playerid, 84.000000, 270.000000, "EDIT");
	PlayerTextDrawFont(playerid, ToysTDedit[playerid], 1);
	PlayerTextDrawLetterSize(playerid, ToysTDedit[playerid], 0.600000, 1.600000);
	PlayerTextDrawTextSize(playerid, ToysTDedit[playerid], 298.500000, 83.000000);
	PlayerTextDrawSetOutline(playerid, ToysTDedit[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ToysTDedit[playerid], 0);
	PlayerTextDrawAlignment(playerid, ToysTDedit[playerid], 2);
	PlayerTextDrawColor(playerid, ToysTDedit[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, ToysTDedit[playerid], 255);
	PlayerTextDrawBoxColor(playerid, ToysTDedit[playerid], 135);
	PlayerTextDrawUseBox(playerid, ToysTDedit[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ToysTDedit[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, ToysTDedit[playerid], 1);

	EditToysTD[playerid][4] = CreatePlayerTextDraw(playerid, 174.000000, 206.000000, "0.00000");
	PlayerTextDrawFont(playerid, EditToysTD[playerid][4], 3);
	PlayerTextDrawLetterSize(playerid, EditToysTD[playerid][4], 0.479166, 1.400007);
	PlayerTextDrawTextSize(playerid, EditToysTD[playerid][4], 298.500000, 75.000000);
	PlayerTextDrawSetOutline(playerid, EditToysTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, EditToysTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, EditToysTD[playerid][4], 2);
	PlayerTextDrawColor(playerid, EditToysTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, EditToysTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, EditToysTD[playerid][4], 16777102);
	PlayerTextDrawUseBox(playerid, EditToysTD[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, EditToysTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, EditToysTD[playerid][4], 0);

	//Textdraw Mode - Bar
	PreviuwModelBarHp[playerid] = CreatePlayerTextDraw(playerid, 501.000000, 146.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, PreviuwModelBarHp[playerid], 5);
	PlayerTextDrawLetterSize(playerid, PreviuwModelBarHp[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PreviuwModelBarHp[playerid], 16.500000, 15.000000);
	PlayerTextDrawSetOutline(playerid, PreviuwModelBarHp[playerid], 0);
	PlayerTextDrawSetShadow(playerid, PreviuwModelBarHp[playerid], 0);
	PlayerTextDrawAlignment(playerid, PreviuwModelBarHp[playerid], 1);
	PlayerTextDrawColor(playerid, PreviuwModelBarHp[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, PreviuwModelBarHp[playerid], 125);
	PlayerTextDrawBoxColor(playerid, PreviuwModelBarHp[playerid], 255);
	PlayerTextDrawUseBox(playerid, PreviuwModelBarHp[playerid], 0);
	PlayerTextDrawSetProportional(playerid, PreviuwModelBarHp[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PreviuwModelBarHp[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, PreviuwModelBarHp[playerid], 1240);
	PlayerTextDrawSetPreviewRot(playerid, PreviuwModelBarHp[playerid], -10.000000, 0.000000, -20.000000, 1.179998);
	PlayerTextDrawSetPreviewVehCol(playerid, PreviuwModelBarHp[playerid], 1, 1);

	PreviewModelBarArmour[playerid] = CreatePlayerTextDraw(playerid, 501.000000, 163.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, PreviewModelBarArmour[playerid], 5);
	PlayerTextDrawLetterSize(playerid, PreviewModelBarArmour[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PreviewModelBarArmour[playerid], 16.500000, 14.500000);
	PlayerTextDrawSetOutline(playerid, PreviewModelBarArmour[playerid], 0);
	PlayerTextDrawSetShadow(playerid, PreviewModelBarArmour[playerid], 0);
	PlayerTextDrawAlignment(playerid, PreviewModelBarArmour[playerid], 1);
	PlayerTextDrawColor(playerid, PreviewModelBarArmour[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, PreviewModelBarArmour[playerid], 125);
	PlayerTextDrawBoxColor(playerid, PreviewModelBarArmour[playerid], 255);
	PlayerTextDrawUseBox(playerid, PreviewModelBarArmour[playerid], 0);
	PlayerTextDrawSetProportional(playerid, PreviewModelBarArmour[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, PreviewModelBarArmour[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, PreviewModelBarArmour[playerid], 1242);
	PlayerTextDrawSetPreviewRot(playerid, PreviewModelBarArmour[playerid], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, PreviewModelBarArmour[playerid], 1, 1);

	BoxBarHp[playerid] = CreatePlayerTextDraw(playerid, 563.000000, 148.000000, "_");
	PlayerTextDrawFont(playerid, BoxBarHp[playerid], 1);
	PlayerTextDrawLetterSize(playerid, BoxBarHp[playerid], 0.600000, 1.150002);
	PlayerTextDrawTextSize(playerid, BoxBarHp[playerid], 298.500000, 85.500000);
	PlayerTextDrawSetOutline(playerid, BoxBarHp[playerid], 1);
	PlayerTextDrawSetShadow(playerid, BoxBarHp[playerid], 0);
	PlayerTextDrawAlignment(playerid, BoxBarHp[playerid], 2);
	PlayerTextDrawColor(playerid, BoxBarHp[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, BoxBarHp[playerid], 255);
	PlayerTextDrawBoxColor(playerid, BoxBarHp[playerid], 135);
	PlayerTextDrawUseBox(playerid, BoxBarHp[playerid], 1);
	PlayerTextDrawSetProportional(playerid, BoxBarHp[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, BoxBarHp[playerid], 0);

	BoxBarArmour[playerid] = CreatePlayerTextDraw(playerid, 563.000000, 165.000000, "_");
	PlayerTextDrawFont(playerid, BoxBarArmour[playerid], 1);
	PlayerTextDrawLetterSize(playerid, BoxBarArmour[playerid], 0.600000, 1.150002);
	PlayerTextDrawTextSize(playerid, BoxBarArmour[playerid], 298.500000, 85.500000);
	PlayerTextDrawSetOutline(playerid, BoxBarArmour[playerid], 1);
	PlayerTextDrawSetShadow(playerid, BoxBarArmour[playerid], 0);
	PlayerTextDrawAlignment(playerid, BoxBarArmour[playerid], 2);
	PlayerTextDrawColor(playerid, BoxBarArmour[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, BoxBarArmour[playerid], 255);
	PlayerTextDrawBoxColor(playerid, BoxBarArmour[playerid], 135);
	PlayerTextDrawUseBox(playerid, BoxBarArmour[playerid], 1);
	PlayerTextDrawSetProportional(playerid, BoxBarArmour[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, BoxBarArmour[playerid], 0);
}

CreateTextDraw()
{
	//Textdraw Mode - Simple
	DigiHPTD[0] = TextDrawCreate(620.000000, 176.000000, "_");
	TextDrawFont(DigiHPTD[0], 1);
	TextDrawLetterSize(DigiHPTD[0], 0.600000, 2.900003);
	TextDrawTextSize(DigiHPTD[0], 247.500000, 32.500000);
	TextDrawSetOutline(DigiHPTD[0], 1);
	TextDrawSetShadow(DigiHPTD[0], 0);
	TextDrawAlignment(DigiHPTD[0], 2);
	TextDrawColor(DigiHPTD[0], -1);
	TextDrawBackgroundColor(DigiHPTD[0], 255);
	TextDrawBoxColor(DigiHPTD[0], 135);
	TextDrawUseBox(DigiHPTD[0], 1);
	TextDrawSetProportional(DigiHPTD[0], 1);
	TextDrawSetSelectable(DigiHPTD[0], 0);

	DigiHPTD[1] = TextDrawCreate(584.000000, 174.000000, "Preview_Model");
	TextDrawFont(DigiHPTD[1], 5);
	TextDrawLetterSize(DigiHPTD[1], 0.600000, 2.000000);
	TextDrawTextSize(DigiHPTD[1], 16.500000, 15.000000);
	TextDrawSetOutline(DigiHPTD[1], 0);
	TextDrawSetShadow(DigiHPTD[1], 0);
	TextDrawAlignment(DigiHPTD[1], 1);
	TextDrawColor(DigiHPTD[1], -1);
	TextDrawBackgroundColor(DigiHPTD[1], 125);
	TextDrawBoxColor(DigiHPTD[1], 255);
	TextDrawUseBox(DigiHPTD[1], 0);
	TextDrawSetProportional(DigiHPTD[1], 1);
	TextDrawSetSelectable(DigiHPTD[1], 0);
	TextDrawSetPreviewModel(DigiHPTD[1], 1240);
	TextDrawSetPreviewRot(DigiHPTD[1], -10.000000, 0.000000, -20.000000, 1.179999);
	TextDrawSetPreviewVehCol(DigiHPTD[1], 1, 1);

	DigiHPTD[2] = TextDrawCreate(584.000000, 190.000000, "Preview_Model");
	TextDrawFont(DigiHPTD[2], 5);
	TextDrawLetterSize(DigiHPTD[2], 0.600000, 2.000000);
	TextDrawTextSize(DigiHPTD[2], 16.500000, 14.500000);
	TextDrawSetOutline(DigiHPTD[2], 0);
	TextDrawSetShadow(DigiHPTD[2], 0);
	TextDrawAlignment(DigiHPTD[2], 1);
	TextDrawColor(DigiHPTD[2], -1);
	TextDrawBackgroundColor(DigiHPTD[2], 125);
	TextDrawBoxColor(DigiHPTD[2], 255);
	TextDrawUseBox(DigiHPTD[2], 0);
	TextDrawSetProportional(DigiHPTD[2], 1);
	TextDrawSetSelectable(DigiHPTD[2], 0);
	TextDrawSetPreviewModel(DigiHPTD[2], 1242);
	TextDrawSetPreviewRot(DigiHPTD[2], -10.000000, 0.000000, -20.000000, 1.000000);
	TextDrawSetPreviewVehCol(DigiHPTD[2], 1, 1);

	DigiHPTD[3] = TextDrawCreate(629.000000, 177.000000, "%");
	TextDrawFont(DigiHPTD[3], 2);
	TextDrawLetterSize(DigiHPTD[3], 0.241666, 0.899999);
	TextDrawTextSize(DigiHPTD[3], 400.000000, 17.000000);
	TextDrawSetOutline(DigiHPTD[3], 1);
	TextDrawSetShadow(DigiHPTD[3], 0);
	TextDrawAlignment(DigiHPTD[3], 2);
	TextDrawColor(DigiHPTD[3], -1);
	TextDrawBackgroundColor(DigiHPTD[3], 255);
	TextDrawBoxColor(DigiHPTD[3], 50);
	TextDrawUseBox(DigiHPTD[3], 0);
	TextDrawSetProportional(DigiHPTD[3], 1);
	TextDrawSetSelectable(DigiHPTD[3], 0);

	DigiHPTD[4] = TextDrawCreate(629.000000, 194.000000, "%");
	TextDrawFont(DigiHPTD[4], 2);
	TextDrawLetterSize(DigiHPTD[4], 0.241666, 0.899999);
	TextDrawTextSize(DigiHPTD[4], 400.000000, 17.000000);
	TextDrawSetOutline(DigiHPTD[4], 1);
	TextDrawSetShadow(DigiHPTD[4], 0);
	TextDrawAlignment(DigiHPTD[4], 2);
	TextDrawColor(DigiHPTD[4], -1);
	TextDrawBackgroundColor(DigiHPTD[4], 255);
	TextDrawBoxColor(DigiHPTD[4], 50);
	TextDrawUseBox(DigiHPTD[4], 0);
	TextDrawSetProportional(DigiHPTD[4], 1);
	TextDrawSetSelectable(DigiHPTD[4], 0);
	//HUD
    HudChar[0] = TextDrawCreate(592.000000, 350.000000, "_");
	TextDrawFont(HudChar[0], 1);
	TextDrawLetterSize(HudChar[0], 0.600000, 10.300003);
	TextDrawTextSize(HudChar[0], 298.500000, 87.000000);
	TextDrawSetOutline(HudChar[0], 1);
	TextDrawSetShadow(HudChar[0], 0);
	TextDrawAlignment(HudChar[0], 2);
	TextDrawColor(HudChar[0], -1);
	TextDrawBackgroundColor(HudChar[0], 255);
	TextDrawBoxColor(HudChar[0], 135);
	TextDrawUseBox(HudChar[0], 1);
	TextDrawSetProportional(HudChar[0], 1);
	TextDrawSetSelectable(HudChar[0], 0);

	HudChar[1] = TextDrawCreate(499.000000, 303.000000, "Preview_Model");
	TextDrawFont(HudChar[1], 5);
	TextDrawLetterSize(HudChar[1], 0.600000, 2.000000);
	TextDrawTextSize(HudChar[1], 112.500000, 150.000000);
	TextDrawSetOutline(HudChar[1], 0);
	TextDrawSetShadow(HudChar[1], 0);
	TextDrawAlignment(HudChar[1], 1);
	TextDrawColor(HudChar[1], -1);
	TextDrawBackgroundColor(HudChar[1], 0);
	TextDrawBoxColor(HudChar[1], 255);
	TextDrawUseBox(HudChar[1], 0);
	TextDrawSetProportional(HudChar[1], 1);
	TextDrawSetSelectable(HudChar[1], 0);
	TextDrawSetPreviewModel(HudChar[1], 2703);
	TextDrawSetPreviewRot(HudChar[1], -9.000000, -97.000000, 54.000000, 6.529996);
	TextDrawSetPreviewVehCol(HudChar[1], 1, 1);

	HudChar[2] = TextDrawCreate(500.000000, 324.000000, "Preview_Model");
	TextDrawFont(HudChar[2], 5);
	TextDrawLetterSize(HudChar[2], 0.600000, 2.000000);
	TextDrawTextSize(HudChar[2], 112.500000, 150.000000);
	TextDrawSetOutline(HudChar[2], 0);
	TextDrawSetShadow(HudChar[2], 0);
	TextDrawAlignment(HudChar[2], 1);
	TextDrawColor(HudChar[2], -1);
	TextDrawBackgroundColor(HudChar[2], 0);
	TextDrawBoxColor(HudChar[2], 255);
	TextDrawUseBox(HudChar[2], 0);
	TextDrawSetProportional(HudChar[2], 1);
	TextDrawSetSelectable(HudChar[2], 0);
	TextDrawSetPreviewModel(HudChar[2], 1546);
	TextDrawSetPreviewRot(HudChar[2], -10.000000, 0.000000, -1.000000, 7.010001);
	TextDrawSetPreviewVehCol(HudChar[2], 1, 1);

	HudChar[3] = TextDrawCreate(503.000000, 350.000000, "Preview_Model");
	TextDrawFont(HudChar[3], 5);
	TextDrawLetterSize(HudChar[3], 0.600000, 2.000000);
	TextDrawTextSize(HudChar[3], 112.500000, 138.500000);
	TextDrawSetOutline(HudChar[3], 0);
	TextDrawSetShadow(HudChar[3], 0);
	TextDrawAlignment(HudChar[3], 1);
	TextDrawColor(HudChar[3], -1);
	TextDrawBackgroundColor(HudChar[3], 0);
	TextDrawBoxColor(HudChar[3], 255);
	TextDrawUseBox(HudChar[3], 0);
	TextDrawSetProportional(HudChar[3], 1);
	TextDrawSetSelectable(HudChar[3], 0);
	TextDrawSetPreviewModel(HudChar[3], 2738);
	TextDrawSetPreviewRot(HudChar[3], -10.000000, 0.000000, -73.000000, 6.829997);
	TextDrawSetPreviewVehCol(HudChar[3], 1, 1);

	HudChar[4] = TextDrawCreate(507.000000, 329.000000, "_");
	TextDrawFont(HudChar[4], 0);
	TextDrawLetterSize(HudChar[4], 0.600000, 1.549999);
	TextDrawTextSize(HudChar[4], 636.000000, 17.000000);
	TextDrawSetOutline(HudChar[4], 0);
	TextDrawSetShadow(HudChar[4], 0);
	TextDrawAlignment(HudChar[4], 1);
	TextDrawColor(HudChar[4], -1);
	TextDrawBackgroundColor(HudChar[4], 255);
	TextDrawBoxColor(HudChar[4], 136);
	TextDrawUseBox(HudChar[4], 1);
	TextDrawSetProportional(HudChar[4], 1);
	TextDrawSetSelectable(HudChar[4], 0);

	CharBox = TextDrawCreate(525.000000, 350.000000, "_");
	TextDrawFont(CharBox, 1);
	TextDrawLetterSize(CharBox, 0.600000, 10.300003);
	TextDrawTextSize(CharBox, 298.500000, 35.500000);
	TextDrawSetOutline(CharBox, 1);
	TextDrawSetShadow(CharBox, 0);
	TextDrawAlignment(CharBox, 2);
	TextDrawColor(CharBox, -1);
	TextDrawBackgroundColor(CharBox, 255);
	TextDrawBoxColor(CharBox, 135);
	TextDrawUseBox(CharBox, 1);
	TextDrawSetProportional(CharBox, 1);
	TextDrawSetSelectable(CharBox, 0);

	VehBox = TextDrawCreate(458.000000, 350.000000, "_");
	TextDrawFont(VehBox, 1);
	TextDrawLetterSize(VehBox, 0.600000, 10.300003);
	TextDrawTextSize(VehBox, 298.500000, 87.000000);
	TextDrawSetOutline(VehBox, 1);
	TextDrawSetShadow(VehBox, 0);
	TextDrawAlignment(VehBox, 2);
	TextDrawColor(VehBox, -1);
	TextDrawBackgroundColor(VehBox, 255);
	TextDrawBoxColor(VehBox, 135);
	TextDrawUseBox(VehBox, 1);
	TextDrawSetProportional(VehBox, 1);
	TextDrawSetSelectable(VehBox, 0);

	HudVeh[2] = TextDrawCreate(373.000000, 329.000000, "_");
	TextDrawFont(HudVeh[2], 0);
	TextDrawLetterSize(HudVeh[2], 0.600000, 1.599999);
	TextDrawTextSize(HudVeh[2], 501.500000, -2.000000);
	TextDrawSetOutline(HudVeh[2], 0);
	TextDrawSetShadow(HudVeh[2], 0);
	TextDrawAlignment(HudVeh[2], 1);
	TextDrawColor(HudVeh[2], -1);
	TextDrawBackgroundColor(HudVeh[2], 255);
	TextDrawBoxColor(HudVeh[2], 136);
	TextDrawUseBox(HudVeh[2], 1);
	TextDrawSetProportional(HudVeh[2], 1);
	TextDrawSetSelectable(HudVeh[2], 0);

	HudVeh[3] = TextDrawCreate(391.000000, 350.000000, "_");
	TextDrawFont(HudVeh[3], 1);
	TextDrawLetterSize(HudVeh[3], 0.600000, 10.300003);
	TextDrawTextSize(HudVeh[3], 298.500000, 36.000000);
	TextDrawSetOutline(HudVeh[3], 1);
	TextDrawSetShadow(HudVeh[3], 0);
	TextDrawAlignment(HudVeh[3], 2);
	TextDrawColor(HudVeh[3], -1);
	TextDrawBackgroundColor(HudVeh[3], 255);
	TextDrawBoxColor(HudVeh[3], 135);
	TextDrawUseBox(HudVeh[3], 1);
	TextDrawSetProportional(HudVeh[3], 1);
	TextDrawSetSelectable(HudVeh[3], 0);

	HudVeh[0] = TextDrawCreate(324.000000, 281.000000, "Preview_Model");
	TextDrawFont(HudVeh[0], 5);
	TextDrawLetterSize(HudVeh[0], 0.600000, 2.000000);
	TextDrawTextSize(HudVeh[0], 112.500000, 150.000000);
	TextDrawSetOutline(HudVeh[0], 0);
	TextDrawSetShadow(HudVeh[0], 0);
	TextDrawAlignment(HudVeh[0], 1);
	TextDrawColor(HudVeh[0], -1);
	TextDrawBackgroundColor(HudVeh[0], 0);
	TextDrawBoxColor(HudVeh[0], 255);
	TextDrawUseBox(HudVeh[0], 0);
	TextDrawSetProportional(HudVeh[0], 1);
	TextDrawSetSelectable(HudVeh[0], 0);
	TextDrawSetPreviewModel(HudVeh[0], 1240);
	TextDrawSetPreviewRot(HudVeh[0], -10.000000, 0.000000, -1.000000, 7.529995);
	TextDrawSetPreviewVehCol(HudVeh[0], 1, 1);

	HudVeh[1] = TextDrawCreate(343.000000, 281.000000, "Preview_Model");
	TextDrawFont(HudVeh[1], 5);
	TextDrawLetterSize(HudVeh[1], 0.600000, 2.000000);
	TextDrawTextSize(HudVeh[1], 112.500000, 150.000000);
	TextDrawSetOutline(HudVeh[1], 0);
	TextDrawSetShadow(HudVeh[1], 0);
	TextDrawAlignment(HudVeh[1], 1);
	TextDrawColor(HudVeh[1], -1);
	TextDrawBackgroundColor(HudVeh[1], 0);
	TextDrawBoxColor(HudVeh[1], 255);
	TextDrawUseBox(HudVeh[1], 0);
	TextDrawSetProportional(HudVeh[1], 1);
	TextDrawSetSelectable(HudVeh[1], 0);
	TextDrawSetPreviewModel(HudVeh[1], 1650);
	TextDrawSetPreviewRot(HudVeh[1], -10.000000, 0.000000, -1.000000, 6.589995);
	TextDrawSetPreviewVehCol(HudVeh[1], 1, 1);

	HudVeh[4] = TextDrawCreate(430.000000, 350.000000, "Speed:");
	TextDrawFont(HudVeh[4], 1);
	TextDrawLetterSize(HudVeh[4], 0.191666, 1.049999);
	TextDrawTextSize(HudVeh[4], 637.000000, 17.000000);
	TextDrawSetOutline(HudVeh[4], 1);
	TextDrawSetShadow(HudVeh[4], 1);
	TextDrawAlignment(HudVeh[4], 1);
	TextDrawColor(HudVeh[4], 16777215);
	TextDrawBackgroundColor(HudVeh[4], 255);
	TextDrawBoxColor(HudVeh[4], 50);
	TextDrawUseBox(HudVeh[4], 0);
	TextDrawSetProportional(HudVeh[4], 1);
	TextDrawSetSelectable(HudVeh[4], 0);

	HudVeh[5] = TextDrawCreate(437.000000, 428.000000, "Engine:");
	TextDrawFont(HudVeh[5], 1);
	TextDrawLetterSize(HudVeh[5], 0.191666, 1.049999);
	TextDrawTextSize(HudVeh[5], 637.000000, 17.000000);
	TextDrawSetOutline(HudVeh[5], 1);
	TextDrawSetShadow(HudVeh[5], 1);
	TextDrawAlignment(HudVeh[5], 1);
	TextDrawColor(HudVeh[5], 16777215);
	TextDrawBackgroundColor(HudVeh[5], 255);
	TextDrawBoxColor(HudVeh[5], 50);
	TextDrawUseBox(HudVeh[5], 0);
	TextDrawSetProportional(HudVeh[5], 1);
	TextDrawSetSelectable(HudVeh[5], 0);
	
	TextFare = TextDrawCreate(427.000000, 400.583374, "Fare:");
	TextDrawLetterSize(TextFare, 0.360498, 1.022500);
	TextDrawAlignment(TextFare, 1);
	TextDrawColor(TextFare, -1);
	TextDrawSetShadow(TextFare, 0);
	TextDrawSetOutline(TextFare, 1);
	TextDrawBackgroundColor(TextFare, 255);
	TextDrawFont(TextFare, 1);
	TextDrawSetProportional(TextFare, 1);
	TextDrawSetShadow(TextFare, 0);
	
	//Simple Hud
	DGhudchar[0] = TextDrawCreate(579.000000, 434.000000, "%");
	TextDrawFont(DGhudchar[0], 2);
	TextDrawLetterSize(DGhudchar[0], 0.241666, 0.899999);
	TextDrawTextSize(DGhudchar[0], 400.000000, 17.000000);
	TextDrawSetOutline(DGhudchar[0], 0);
	TextDrawSetShadow(DGhudchar[0], 1);
	TextDrawAlignment(DGhudchar[0], 2);
	TextDrawColor(DGhudchar[0], -1);
	TextDrawBackgroundColor(DGhudchar[0], 255);
	TextDrawBoxColor(DGhudchar[0], 50);
	TextDrawUseBox(DGhudchar[0], 0);
	TextDrawSetProportional(DGhudchar[0], 1);
	TextDrawSetSelectable(DGhudchar[0], 0);

	DGhudchar[1] = TextDrawCreate(631.000000, 434.000000, "%");
	TextDrawFont(DGhudchar[1], 2);
	TextDrawLetterSize(DGhudchar[1], 0.241666, 0.899999);
	TextDrawTextSize(DGhudchar[1], 400.000000, 17.000000);
	TextDrawSetOutline(DGhudchar[1], 0);
	TextDrawSetShadow(DGhudchar[1], 1);
	TextDrawAlignment(DGhudchar[1], 2);
	TextDrawColor(DGhudchar[1], -1);
	TextDrawBackgroundColor(DGhudchar[1], 255);
	TextDrawBoxColor(DGhudchar[1], 50);
	TextDrawUseBox(DGhudchar[1], 0);
	TextDrawSetProportional(DGhudchar[1], 1);
	TextDrawSetSelectable(DGhudchar[1], 0);

	DGhudchar[2] = TextDrawCreate(614.000000, 434.000000, "_");
	TextDrawFont(DGhudchar[2], 1);
	TextDrawLetterSize(DGhudchar[2], 0.600000, 1.050003);
	TextDrawTextSize(DGhudchar[2], 294.000000, 45.000000);
	TextDrawSetOutline(DGhudchar[2], 1);
	TextDrawSetShadow(DGhudchar[2], 0);
	TextDrawAlignment(DGhudchar[2], 2);
	TextDrawColor(DGhudchar[2], -1);
	TextDrawBackgroundColor(DGhudchar[2], 255);
	TextDrawBoxColor(DGhudchar[2], 135);
	TextDrawUseBox(DGhudchar[2], 1);
	TextDrawSetProportional(DGhudchar[2], 1);
	TextDrawSetSelectable(DGhudchar[2], 0);

	DGhudchar[3] = TextDrawCreate(513.000000, 434.000000, "_");
	TextDrawFont(DGhudchar[3], 1);
	TextDrawLetterSize(DGhudchar[3], 0.600000, 1.050003);
	TextDrawTextSize(DGhudchar[3], 294.000000, 47.500000);
	TextDrawSetOutline(DGhudchar[3], 1);
	TextDrawSetShadow(DGhudchar[3], 0);
	TextDrawAlignment(DGhudchar[3], 2);
	TextDrawColor(DGhudchar[3], -1);
	TextDrawBackgroundColor(DGhudchar[3], 255);
	TextDrawBoxColor(DGhudchar[3], 135);
	TextDrawUseBox(DGhudchar[3], 1);
	TextDrawSetProportional(DGhudchar[3], 1);
	TextDrawSetSelectable(DGhudchar[3], 0);

	DGhudchar[4] = TextDrawCreate(589.000000, 429.000000, "Preview_Model");
	TextDrawFont(DGhudchar[4], 5);
	TextDrawLetterSize(DGhudchar[4], 0.600000, 2.000000);
	TextDrawTextSize(DGhudchar[4], 20.000000, 18.000000);
	TextDrawSetOutline(DGhudchar[4], 0);
	TextDrawSetShadow(DGhudchar[4], 0);
	TextDrawAlignment(DGhudchar[4], 1);
	TextDrawColor(DGhudchar[4], -1);
	TextDrawBackgroundColor(DGhudchar[4], 0);
	TextDrawBoxColor(DGhudchar[4], 0);
	TextDrawUseBox(DGhudchar[4], 0);
	TextDrawSetProportional(DGhudchar[4], 1);
	TextDrawSetSelectable(DGhudchar[4], 0);
	TextDrawSetPreviewModel(DGhudchar[4], 2703);
	TextDrawSetPreviewRot(DGhudchar[4], -81.000000, -20.000000, -16.000000, 1.000000);
	TextDrawSetPreviewVehCol(DGhudchar[4], 1, 1);

	DGhudchar[5] = TextDrawCreate(479.000000, 423.000000, "Preview_Model");
	TextDrawFont(DGhudchar[5], 5);
	TextDrawLetterSize(DGhudchar[5], 0.600000, 2.000000);
	TextDrawTextSize(DGhudchar[5], 34.500000, 32.000000);
	TextDrawSetOutline(DGhudchar[5], 0);
	TextDrawSetShadow(DGhudchar[5], 0);
	TextDrawAlignment(DGhudchar[5], 1);
	TextDrawColor(DGhudchar[5], -1);
	TextDrawBackgroundColor(DGhudchar[5], 0);
	TextDrawBoxColor(DGhudchar[5], 255);
	TextDrawUseBox(DGhudchar[5], 0);
	TextDrawSetProportional(DGhudchar[5], 1);
	TextDrawSetSelectable(DGhudchar[5], 0);
	TextDrawSetPreviewModel(DGhudchar[5], 2738);
	TextDrawSetPreviewRot(DGhudchar[5], 0.000000, 0.000000, -76.000000, 1.909999);
	TextDrawSetPreviewVehCol(DGhudchar[5], 1, 1);

	DGhudchar[6] = TextDrawCreate(530.000000, 434.000000, "%");
	TextDrawFont(DGhudchar[6], 2);
	TextDrawLetterSize(DGhudchar[6], 0.241666, 0.899999);
	TextDrawTextSize(DGhudchar[6], 400.000000, 17.000000);
	TextDrawSetOutline(DGhudchar[6], 0);
	TextDrawSetShadow(DGhudchar[6], 1);
	TextDrawAlignment(DGhudchar[6], 2);
	TextDrawColor(DGhudchar[6], -1);
	TextDrawBackgroundColor(DGhudchar[6], 255);
	TextDrawBoxColor(DGhudchar[6], 50);
	TextDrawUseBox(DGhudchar[6], 0);
	TextDrawSetProportional(DGhudchar[6], 1);
	TextDrawSetSelectable(DGhudchar[6], 0);

	DGhudchar[7] = TextDrawCreate(535.000000, 429.000000, "Preview_Model");
	TextDrawFont(DGhudchar[7], 5);
	TextDrawLetterSize(DGhudchar[7], 0.600000, 2.000000);
	TextDrawTextSize(DGhudchar[7], 26.000000, 18.500000);
	TextDrawSetOutline(DGhudchar[7], 0);
	TextDrawSetShadow(DGhudchar[7], 0);
	TextDrawAlignment(DGhudchar[7], 1);
	TextDrawColor(DGhudchar[7], -1);
	TextDrawBackgroundColor(DGhudchar[7], 0);
	TextDrawBoxColor(DGhudchar[7], 0);
	TextDrawUseBox(DGhudchar[7], 0);
	TextDrawSetProportional(DGhudchar[7], 1);
	TextDrawSetSelectable(DGhudchar[7], 0);
	TextDrawSetPreviewModel(DGhudchar[7], 1546);
	TextDrawSetPreviewRot(DGhudchar[7], -10.000000, 0.000000, -20.000000, 1.000000);
	TextDrawSetPreviewVehCol(DGhudchar[7], 1, 1);

	DGhudchar[8] = TextDrawCreate(564.000000, 434.000000, "_");
	TextDrawFont(DGhudchar[8], 1);
	TextDrawLetterSize(DGhudchar[8], 0.600000, 1.050003);
	TextDrawTextSize(DGhudchar[8], 294.000000, 45.000000);
	TextDrawSetOutline(DGhudchar[8], 1);
	TextDrawSetShadow(DGhudchar[8], 0);
	TextDrawAlignment(DGhudchar[8], 2);
	TextDrawColor(DGhudchar[8], -1);
	TextDrawBackgroundColor(DGhudchar[8], 255);
	TextDrawBoxColor(DGhudchar[8], 135);
	TextDrawUseBox(DGhudchar[8], 1);
	TextDrawSetProportional(DGhudchar[8], 1);
	TextDrawSetSelectable(DGhudchar[8], 0);
	
	//hude veh in simple hud
	DGhudveh[0] = TextDrawCreate(563.000000, 374.000000, "_");
	TextDrawFont(DGhudveh[0], 1);
	TextDrawLetterSize(DGhudveh[0], 0.600000, 5.950012);
	TextDrawTextSize(DGhudveh[0], 294.000000, 147.500000);
	TextDrawSetOutline(DGhudveh[0], 1);
	TextDrawSetShadow(DGhudveh[0], 0);
	TextDrawAlignment(DGhudveh[0], 2);
	TextDrawColor(DGhudveh[0], -1);
	TextDrawBackgroundColor(DGhudveh[0], 255);
	TextDrawBoxColor(DGhudveh[0], 135);
	TextDrawUseBox(DGhudveh[0], 1);
	TextDrawSetProportional(DGhudveh[0], 1);
	TextDrawSetSelectable(DGhudveh[0], 0);

	DGhudveh[1] = TextDrawCreate(550.000000, 391.000000, "Preview_Model");
	TextDrawFont(DGhudveh[1], 5);
	TextDrawLetterSize(DGhudveh[1], 0.600000, 2.000000);
	TextDrawTextSize(DGhudveh[1], 34.500000, 32.000000);
	TextDrawSetOutline(DGhudveh[1], 0);
	TextDrawSetShadow(DGhudveh[1], 0);
	TextDrawAlignment(DGhudveh[1], 1);
	TextDrawColor(DGhudveh[1], -1);
	TextDrawBackgroundColor(DGhudveh[1], 0);
	TextDrawBoxColor(DGhudveh[1], 255);
	TextDrawUseBox(DGhudveh[1], 0);
	TextDrawSetProportional(DGhudveh[1], 1);
	TextDrawSetSelectable(DGhudveh[1], 0);
	TextDrawSetPreviewModel(DGhudveh[1], 1650);
	TextDrawSetPreviewRot(DGhudveh[1], 0.000000, 0.000000, 2.000000, 1.909999);
	TextDrawSetPreviewVehCol(DGhudveh[1], 1, 1);

	DGhudveh[2] = TextDrawCreate(550.000000, 374.000000, "Preview_Model");
	TextDrawFont(DGhudveh[2], 5);
	TextDrawLetterSize(DGhudveh[2], 0.600000, 2.000000);
	TextDrawTextSize(DGhudveh[2], 34.500000, 32.000000);
	TextDrawSetOutline(DGhudveh[2], 0);
	TextDrawSetShadow(DGhudveh[2], 0);
	TextDrawAlignment(DGhudveh[2], 1);
	TextDrawColor(DGhudveh[2], -1);
	TextDrawBackgroundColor(DGhudveh[2], 0);
	TextDrawBoxColor(DGhudveh[2], 255);
	TextDrawUseBox(DGhudveh[2], 0);
	TextDrawSetProportional(DGhudveh[2], 1);
	TextDrawSetSelectable(DGhudveh[2], 0);
	TextDrawSetPreviewModel(DGhudveh[2], 1240);
	TextDrawSetPreviewRot(DGhudveh[2], 0.000000, 0.000000, 2.000000, 2.079998);
	TextDrawSetPreviewVehCol(DGhudveh[2], 1, 1);

    //Date and Time
 	TextTime = TextDrawCreate(547.000000, 28.000000, "-:-:-");
    TextDrawFont(TextTime, 1);
    TextDrawLetterSize(TextTime, 0.400000, 2.000000);
    TextDrawTextSize(TextTime, 400.000000, 1.399999);
    TextDrawSetOutline(TextTime, 1);
    TextDrawSetShadow(TextTime, 0);
    TextDrawAlignment(TextTime, 1);
    TextDrawColor(TextTime, -1);
    TextDrawBackgroundColor(TextTime, 255);
    TextDrawBoxColor(TextTime, 50);
    TextDrawUseBox(TextTime, 0);
    TextDrawSetProportional(TextTime, 1);
    TextDrawSetSelectable(TextTime, 0);

	TextDate = TextDrawCreate(71.000000, 430.000000, "24 - March - 2021");
	TextDrawFont(TextDate, 1);
	TextDrawLetterSize(TextDate, 0.308332, 1.349998);
	TextDrawTextSize(TextDate, 404.500000, 114.500000);
	TextDrawSetOutline(TextDate, 1);
	TextDrawSetShadow(TextDate, 0);
	TextDrawAlignment(TextDate, 2);
	TextDrawColor(TextDate, -1);
	TextDrawBackgroundColor(TextDate, 255);
	TextDrawBoxColor(TextDate, 50);
	TextDrawSetProportional(TextDate, 1);
	TextDrawSetSelectable(TextDate, 0);

	/*TDTime[0] = TextDrawCreate(279.000000, 10.000000, "[");
	TextDrawFont(TDTime[0], 1);
	TextDrawLetterSize(TDTime[0], 0.304166, 1.850000);
	TextDrawTextSize(TDTime[0], 659.500000, 20.500000);
	TextDrawSetOutline(TDTime[0], 1);
	TextDrawSetShadow(TDTime[0], 0);
	TextDrawAlignment(TDTime[0], 1);
	TextDrawColor(TDTime[0], -1);
	TextDrawBackgroundColor(TDTime[0], 255);
	TextDrawBoxColor(TDTime[0], 50);
	TextDrawUseBox(TDTime[0], 0);
	TextDrawSetProportional(TDTime[0], 1);
	TextDrawSetSelectable(TDTime[0], 0);

	TDTime[1] = TextDrawCreate(344.000000, 10.000000, "]");
	TextDrawFont(TDTime[1], 1);
	TextDrawLetterSize(TDTime[1], 0.304166, 1.850000);
	TextDrawTextSize(TDTime[1], 659.500000, 20.500000);
	TextDrawSetOutline(TDTime[1], 1);
	TextDrawSetShadow(TDTime[1], 0);
	TextDrawAlignment(TDTime[1], 1);
	TextDrawColor(TDTime[1], -1);
	TextDrawBackgroundColor(TDTime[1], 255);
	TextDrawBoxColor(TDTime[1], 50);
	TextDrawUseBox(TDTime[1], 0);
	TextDrawSetProportional(TDTime[1], 1);
	TextDrawSetSelectable(TDTime[1], 0);*/

	//anim
	AnimH4N = TextDrawCreate(542.000000, 417.000000, /*~r~~k~~KEY_~ ~w~*/"H - To stop the animation");
	TextDrawUseBox(AnimH4N, 0);
	TextDrawFont(AnimH4N, 2);
	TextDrawSetShadow(AnimH4N,0); // no shadow
	TextDrawSetOutline(AnimH4N,1); // thickness 1
	TextDrawBackgroundColor(AnimH4N,0x000000FF);
	TextDrawColor(AnimH4N,0xFFFFFFFF);
	TextDrawAlignment(AnimH4N,3); // align right
	
	//Server Name
 	ServerName = TextDrawCreate(490.000000, 8.000038, "Indo Vibes ~w~Roleplay");
    TextDrawLetterSize(ServerName, 0.269998, 1.405864);
    TextDrawAlignment(ServerName, 1);
    TextDrawColor(ServerName, -16776961);
    TextDrawSetShadow(ServerName, 0);
    TextDrawSetOutline(ServerName, 1);
    TextDrawBackgroundColor(ServerName, 0x000000FF);
    TextDrawFont(ServerName, 1);
    TextDrawSetProportional(ServerName, 1);
}
