
//-------------[ Player Commands ]-------------//
CMD:help(playerid, params[])
{
	ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "Help List", "General Commands\nChat Commands\nVehicle Commands\nJob Commands\nFaction Commands\nFamily Commands\nBisnis Commands\nHouse Commands\nWorkshop Commands\nDealership Commands\nDonate Menu\nServer Credits", "Select", "Close");
	return 1;
}

CMD:jobhelp(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_JOBHELP, DIALOG_STYLE_LIST, "Job Help", "Taxi Driver\nMechanic Service\nProduction\nLumberjack\nFarmers\nMiner\nTrucker\nSweeper\nBus Driver\nTrashmaster\nPizza Boy\n{FF0000}Drug Smuggler", "Select", "Close");
	return 1;
}

CMD:hauling(playerid)
{
    new vehicleid = GetPlayerVehicleID(playerid);
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && !IsATruck(vehicleid)) return Error(playerid, "Anda harus mengendarai truck.");

    if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
	ShowPlayerDialog(playerid, DIALOG_TAKEHAULING, DIALOG_STYLE_LIST, "Hauling Mission", "GasStation Mission\nDealer Mission\nContainer Delivery", "Select", "Close");
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}

CMD:credits(playerid)
{
	if(pData[playerid][pFreeze] == 1)
	return Error(playerid, "Anda sedang di Freeze oleh staff, tidak dapat menggunakan ini");
	if(pData[playerid][pCuffed] == 1)
	return Error(playerid, "Anda sedang di borgol oleh kepolisian, tidak dapat menggunakan ini");
	new line1[1200], line2[300], line3[500];
	strcat(line3, "Chief Executive Officer: "YELLOW_E"Aditya(Truster)\n");
	strcat(line3, "Support Developer: "YELLOW_E"Radit(Radeetz) & Aldrich(Tudo)\n");
	strcat(line3, "Server Manager: "YELLOW_E"Asadu & Nathan\n");
	strcat(line3, "Support Mapper: "YELLOW_E"Arif\n");
	strcat(line3, "Gamemode Creator: "YELLOW_E"Dandy Prasetyo\n");
	format(line2, sizeof(line2), ""LB_E"Server Support: "YELLOW_E"%s & All SA-MP Team\n\n\
	"GREEN_E"Terima kasih telah bergabung dengan kami! Copyright © 2020.", pData[playerid][pName]);
	format(line1, sizeof(line1), "%s%s", line3, line2);
   	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""ORANGE_E"ILRP: "WHITE_E"Server Credits", line1, "OK", "");
	return 1;
}

CMD:vip(playerid)
{
	new longstr2[3500];
	strcat(longstr2, ""YELLOW_E"Looking for bonus features and commands? Get premium status today!\n\n"RED_E"Premium features:\n\
	"dot""GREEN_E"Regular(1) "PINK_E"Rp.30.000/month"RED_E"|| "PINK_E"Features:\n\
	"YELLOW_E"1) "WHITE_E"Gratis "LB_E"20 "WHITE_E"VIP Gold.\n");
	strcat(longstr2, ""YELLOW_E"2) "WHITE_E"Mendapat "GREEN_E"2 "WHITE_E"slot job.\n");

	strcat(longstr2, ""YELLOW_E"3) "WHITE_E"Akses custom VIP room dan VIP locker.\n\
	"YELLOW_E"4) "WHITE_E"Mempunya "LB_E"4 "WHITE_E"slot untuk kendaraan pribadi.\n\
	"YELLOW_E"5) "WHITE_E"Mempunya "LB_E"2 "WHITE_E"Slot untuk rumah.\n");
	strcat(longstr2, ""YELLOW_E"6) "WHITE_E"Mempunyai "LB_E"2 "WHITE_E"slot untuk bisnis.\n\
	"YELLOW_E"7) "WHITE_E"Akses VIP chat dan VIP status "LB_E"/vips"WHITE_E".\n");
	strcat(longstr2, ""YELLOW_E"8) "WHITE_E"Waktu Paycheck/Payday "LB_E"5% "WHITE_E"lebih cepat.\n\
	"YELLOW_E"9) "WHITE_E"Mendapatkan "LB_E"10% "WHITE_E"bunga bank setiap kali paycheck.");


	strcat(longstr2, "\n\n"dot""YELLOW_E"Premium(2) "PINK_E"Rp.50,000/month "RED_E"|| "PINK_E"Features:\n\
	"YELLOW_E"1) "WHITE_E"Gratis "LB_E"30"WHITE_E" VIP Gold.\n\
	"YELLOW_E"2) "WHITE_E"Mendapat "GREEN_E"2 "WHITE_E"slot job.\n");
	strcat(longstr2, ""YELLOW_E"3) "WHITE_E"Akses custom VIP room dan VIP locker.\n\
	"YELLOW_E"4) "WHITE_E"Mempunyai "LB_E"5 "WHITE_E"slot untuk kendaraan pribadi.");

	strcat(longstr2, "\n"YELLOW_E"5) "WHITE_E"Mempunyai "LB_E"3 "WHITE_E"Slot untuk rumah.\n\
	"YELLOW_E"6) "WHITE_E"Mempunyai "LB_E"3 "WHITE_E"slot untuk bisnis.\n\
	"YELLOW_E"7) "WHITE_E"Akses VIP chat dan VIP status "LB_E"/vips"WHITE_E".\n");
	strcat(longstr2, ""YELLOW_E"8) "WHITE_E"Waktu Paycheck/Payday "LB_E"10% "WHITE_E"lebih cepat\n\
	"YELLOW_E"9) "WHITE_E"Mendapatkan "LB_E"15% "WHITE_E"bunga bank setiap kali paycheck.");

	strcat(longstr2, "\n\n"dot""PURPLE_E"VIP Player(3) "PINK_E"Rp.80,000/month "RED_E"|| "PINK_E"Features:\n\
	"YELLOW_E"1) "WHITE_E"Gratis "LB_E"40 "WHITE_E"VIP Gold.\n\
	"YELLOW_E"2) "WHITE_E"Mendapat "GREEN_E"2 "WHITE_E"slot job.\n\
	"YELLOW_E"3) "WHITE_E"Akses custom VIP room dan VIP locker.");
	strcat(longstr2, "\n"YELLOW_E"4) "WHITE_E"Mempunyai "LB_E"6 "WHITE_E"slot untuk kendaraan pribadi.\n\
	"YELLOW_E"5) "WHITE_E"Mempunyai "LB_E"4 "WHITE_E"Slot untuk rumah.\n\
	"YELLOW_E"6) "WHITE_E"Mempunyai "LB_E"4 "WHITE_E"slot untuk bisnis.\n\
	"YELLOW_E"7) "WHITE_E"Akses VIP chat dan VIP status "LB_E"/vips"WHITE_E".");
	strcat(longstr2, "\n"YELLOW_E"8) "WHITE_E"Waktu Paycheck/Payday "LB_E"15% "WHITE_E"lebih cepat.\n\
	"YELLOW_E"9) "WHITE_E"Mendapatkan "LB_E"20% "WHITE_E"bunga bank setiap kali paycheck.");

	strcat(longstr2, "\n\n"LB_E"Pembayaran Via Gopay/Dana. "LB2_E"Harga VIP Gold "LB_E"Rp.1,000/gold.\n\
	"YELLOW_E"Untuk informasi selengkapnya hubungi Aditya/Radeetz(Server Owner & Founder)!");
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""ORANGE_E"ILRP "PINK_E"VIP SYSTEM", longstr2, "Close", "");
	return 1;
}

CMD:donate(playerid)
{
    new line3[3500];
    strcat(line3, ""RED_E"...:::... "DOOM_"Donate List Advanced Roleplay"RED_E"...:::...\n");
    strcat(line3, ""RED_E"..:.. "DOOM_"GOLD(OOC) "RED_E"..:..\n\n");

    strcat(line3, ""DOOM_"1. 250 Gold >> "RED_E"Rp 20.000\n");
    strcat(line3, ""DOOM_"2. 505 Gold >> "RED_E"Rp 30.000\n");
	strcat(line3, ""DOOM_"3. 1025 Gold >> "RED_E"Rp 50.000\n");
    strcat(line3, ""DOOM_"4. 2150 Gold >> "RED_E"Rp 100.000\n");
	strcat(line3, ""DOOM_"5. 3125 Gold >> "RED_E"Rp 150.000\n");
    strcat(line3, ""DOOM_"6. 4200 Gold >> "RED_E"Rp 200.000\n\n");

	strcat(line3, ""RED_E"..::.. "DOOM_"VIP PLAYER "RED_E"..::..\n\n");

    strcat(line3, ""DOOM_"- VIP Player >> "RED_E"/vip\n");

	strcat(line3, ""RED_E"..:::.. "DOOM_"SERVER FEATURE "RED_E"..:::..\n\n");
    strcat(line3, ""DOOM_"1. Mapping(per object) >> "RED_E"50 Gold\n");
	strcat(line3, ""DOOM_"2. Private Garage >> "RED_E"900 Gold\n");
	strcat(line3, ""DOOM_"3. Private Gate >> "RED_E"560 Gold\n");
	strcat(line3, ""DOOM_"4. Bisnis >> "RED_E"(Tergantung Lokasi)\n");
	strcat(line3, ""DOOM_"5. House >> "RED_E"(Tergantung Lokasi dan Type)\n");
	strcat(line3, ""DOOM_"6. Custom House Interior >> "RED_E"(Tergantung Interior)\n\n");

	strcat(line3, ""RED_E"..::::.. "DOOM_"SERVER VEHICLE "RED_E"..:::::..\n\n");
    strcat(line3, ""DOOM_"1. MOBIL DEALER >> "RED_E"520 Gold\n");
	strcat(line3, ""DOOM_"2. MOBIL VIP >> "RED_E"2000 Gold\n");
	strcat(line3, ""DOOM_"3. HELI / KAPAL >> "RED_E"3000 Gold\n\n");

    strcat(line3, ""RED_E"..::.. "WHITE_E"CONTACT INFO "RED_E"..::..\n");
    strcat(line3, ""WHITE_E"1. NAMA : "RED_E"Radeetz DAN Truster\n");
    strcat(line3, ""WHITE_E"- DISCORD : "RED_E"@R4d1tz, @Truster\n\n");

    strcat(line3, ""RED_E"..::.. "WHITE_E"NOTE "RED_E"..::..\n");
    strcat(line3, ""WHITE_E"Note: "RED_E"Info lebih lanjut Silahkan cek discord kami!\n\n");

	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""ORANGE_E"ILRP: "WHITE_E"DONATE LIST", line3, "Okay", "");
	return 1;
}

CMD:email(playerid)
{
    if(pData[playerid][IsLoggedIn] == false)
		return Error(playerid, "You must be logged in to change your email address!");

	ShowPlayerDialog(playerid, DIALOG_EMAIL, DIALOG_STYLE_INPUT, ""WHITE_E"Set your email address", ""WHITE_E"Enter your email address below.\nThis will be used to reset your password incase you lose it.\n\n"RED_E"* "WHITE_E"Your e-mail is confidential and will not be displayed publicly\n"RED_E"* "WHITE_E"Emails will only be sent for a password reset or important news\n\
	"RED_E"* "WHITE_E"Be sure to double-check and enter a valid email address!", "Enter", "Exit");
	return 1;
}

CMD:changepass(playerid)
{
    if(pData[playerid][IsLoggedIn] == false)
		return Error(playerid, "You must be logged in to change your email address!");

	ShowPlayerDialog(playerid, DIALOG_PASSWORD, DIALOG_STYLE_INPUT, ""WHITE_E"Change your password", "Insert your new password to change!", "Change", "Exit");
	InfoTD_MSG(playerid, 3000, "~g~~h~Insert your current password!");
	return 1;
}

CMD:savestats(playerid, params[])
{
	if(pData[playerid][IsLoggedIn] == false)
		return Error(playerid, "You are not logged in!");

	UpdatePlayerData(playerid);
	Servers(playerid, "Your statistics has successfully saved in database!");
	return 1;
}

CMD:gshop(playerid, params[])
{
	new Dstring[512];
	format(Dstring, sizeof(Dstring), "Gold Shop\tPrice\n\
	Instant Change Name\t500 Gold\n");
	format(Dstring, sizeof(Dstring), "%sClear Warning\t1000 Gold\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sCustom Vehicle Plate\t250 Gold\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sVIP Level 1(7 Days)\t150 Gold\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sVIP Level 2(7 Days)\t250 Gold\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sVIP Level 3(7 Days)\t500 Gold\n", Dstring);
	ShowPlayerDialog(playerid, DIALOG_GOLDSHOP, DIALOG_STYLE_TABLIST_HEADERS, "Gold Shop", Dstring, "Buy", "Cancel");
	return 1;
}

CMD:mypos(playerid, params[])
{
	new int, Float:px,Float:py,Float:pz, Float:a;
	GetPlayerPos(playerid, px, py, pz);
	GetPlayerFacingAngle(playerid, a);
	int = GetPlayerInterior(playerid);
	new zone[MAX_ZONE_NAME];
	GetPlayer3DZone(playerid, zone, sizeof(zone));
	SendClientMessageEx(playerid, COLOR_WHITE, "Lokasi Anda Saat Ini: %s (%0.2f, %0.2f, %0.2f, %0.2f) Int = %d", zone, px, py, pz, a, int);
	return 1;
}

CMD:gps(playerid, params[])
{
	if(pData[playerid][pGPS] < 1) return Error(playerid, "Anda tidak memiliki GPS.");
	ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "GPS Menu", "Disable GPS\nFaction\nPublic GPS\nJobs\nMy property\nDMV Location", "Select", "Close");
	return 1;
}
CMD:gpsbis(playerid)
{
	new
 	han2[MAX_BISNIS * 32];

	han2 = "ID\tName\tType\tLocation\n";

    new type[128];
   	foreach(new bid : Bisnis)
	{
		if(bData[bid][bType] == 1)
		{
			type = "Fast Food";
		}
		else if(bData[bid][bType] == 2)
		{
			type = "Market";
		}
		else if(bData[bid][bType] == 3)
		{
			type = "Clothes";
		}
		else if(bData[bid][bType] == 4)
		{
			type = "Equipment";
		}
		else if(bData[bid][bType] == 5)
		{
			type = "Bar";
		}
		else
		{
			type = "Unknow";
		}

	    format(han2, sizeof(han2), "%s%d\t%s\t%s\t"RED_E"%.1f m\n", han2,
	    bid, bData[bid][bName], type, GetPlayerDistanceFromPoint(playerid, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]));
	}
	ShowPlayerDialog(playerid, DIALOG_FIND_BISNIS, DIALOG_STYLE_TABLIST_HEADERS, "Business Location", han2, "Select", "Close");
	return 1;
}

CMD:gpsdealer(playerid)
{
	new
 	han2[MAX_DEALERSHIP * 32];

	han2 = "ID\tName\tType\tLocation\n";

    new type[128];
   	foreach(new bid : Dealer)
	{
		if(DealerData[bid][dealerType] == 1)
		{
			type = "Motorcycle";
		}
		else if(DealerData[bid][dealerType] == 2)
		{
			type = "Cars";
		}
		else if(DealerData[bid][dealerType] == 3)
		{
			type = "Unique Cars";
		}
		else if(DealerData[bid][dealerType] == 4)
		{
			type = "Job Cars";
		}
		else if(DealerData[bid][dealerType] == 5)
		{
			type = "Truck";
		}
		else
		{
			type = "Unknow";
		}

	    format(han2, sizeof(han2), "%s%d\t%s\t%s\t"RED_E"%.1f m\n", han2,
	    bid, DealerData[bid][dealerName], type, GetPlayerDistanceFromPoint(playerid, DealerData[bid][dealerPosX], DealerData[bid][dealerPosY], DealerData[bid][dealerPosZ]));
	}
	ShowPlayerDialog(playerid, DIALOG_FIND_DEALER, DIALOG_STYLE_TABLIST_HEADERS, "Dealership Location", han2, "Select", "Close");
	return 1;
}

CMD:findatm(playerid)
{
	new
	han2[MAX_ATM * 32];

	han2 = "ID\tLocation\n";

   	foreach(new bid : Trees)
	{
 	   format(han2, sizeof(han2), "%s%d\t"RED_E"%.1f m\n", han2,
 	   bid, GetPlayerDistanceFromPoint(playerid, AtmData[bid][atmX], AtmData[bid][atmY], AtmData[bid][atmZ]));
	}
	ShowPlayerDialog(playerid, DIALOG_FIND_ATM, DIALOG_STYLE_TABLIST_HEADERS, "Atm Location", han2, "Select", "Close");
	return 1;
}

CMD:death(playerid, params[])
{
    if(pData[playerid][pInjured] == 0)
        return Error(playerid, "You are not injured at the moment.");

	if(pData[playerid][pJail] > 0)
		return Error(playerid, "You can't do this when in jail!");

	if(pData[playerid][pArrest] > 0)
		return Error(playerid, "You can't do this when in arrest sapd!");

    if((gettime()-GetPVarInt(playerid, "GiveUptime")) < 100)
        return Error(playerid, "You must waiting 3 minutes for spawn to hospital");

	/*if(pMatiPukul[playerid] == 1)
	{
	    SetPlayerHealthEx(playerid, 50.0);
	    ClearAnimations(playerid);
	    pData[playerid][pInjured] = 0;
	    pMatiPukul[playerid] = 0;
    	Servers(playerid, "You have wake up and accepted death in your position.");
    	return 1;
	}*/
    Servers(playerid, "You have given up and accepted your death.");
	pData[playerid][pHospitalTime] = 0;
	pData[playerid][pHospital] = 1;
    return 1;
}

CMD:piss(playerid, params[])
{
    if(pData[playerid][pInjured] == 1)
        return Error(playerid, "You can't use this command at the injured moment.");

	new time = (100 - pData[playerid][pBladder]) * (300);
    SetTimerEx("UnfreezePee", time, 0, "i", playerid);
    SetPlayerSpecialAction(playerid, 68);
    return 1;
}

CMD:sleep(playerid, params[])
{
	if(pData[playerid][pInjured] == 1)
        return Error(playerid, "You can't use this command at the injured moment.");

	if(pData[playerid][pInHouse] == -1)
		return Error(playerid, "You must inside a house to sleep.");

	InfoTD_MSG(playerid, 10000, "Sleeping... Please wait!");
	TogglePlayerControllable(playerid, 0);
	new time = (100 - pData[playerid][pEnergy]) * (400);
    SetTimerEx("UnfreezeSleep", time, 0, "i", playerid);
	switch(random(6))
	{
		case 0: ApplyAnimation(playerid, "INT_HOUSE", "BED_In_L",4.1,0,0,0,1,1);
		case 1: ApplyAnimation(playerid, "INT_HOUSE", "BED_In_R",4.1,0,0,0,1,1);
		case 2: ApplyAnimation(playerid, "INT_HOUSE", "BED_Loop_L",4.1,1,0,0,1,1);
		case 3: ApplyAnimation(playerid, "INT_HOUSE", "BED_Loop_R",4.1,1,0,0,1,1);
		case 4: ApplyAnimation(playerid, "INT_HOUSE", "BED_Out_L",4.1,0,1,1,0,0);
		case 5: ApplyAnimation(playerid, "INT_HOUSE", "BED_Out_R",4.1,0,1,1,0,0);
	}
	return 1;
}

CMD:time(playerid)
{
	if(pData[playerid][IsLoggedIn] == false)
		return Error(playerid, "You must logged in!");

	new line2[1200];
	new paycheck = 3600 - pData[playerid][pPaycheck];
	if(paycheck < 1)
	{
		paycheck = 0;
	}

	format(line2, sizeof(line2), ""WHITE_E"Paycheck Time: "YELLOW_E"%d remaining\n"WHITE_E"Job Delay Time: "RED_E"%d second\n"WHITE_E"Side Job Delay Time: "RED_E"%d second\n"WHITE_E"Plant Time(Farmer): "RED_E"%d second\n"WHITE_E"Arrest Time: "RED_E"%d second\n"WHITE_E"Jail Time: "RED_E"%d second\n", paycheck, pData[playerid][pJobTime], pData[playerid][pSideJobTime], pData[playerid][pPlantTime], pData[playerid][pArrestTime], pData[playerid][pJailTime]);
   	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""ORANGE_E"IndoluckRp: "WHITE_E"My Time", line2, "Okay", "");
	return 1;
}

CMD:delays(playerid)
{
	if(pData[playerid][IsLoggedIn] == false)
		return Error(playerid, "You must logged in!");

	new String[1200];

	format(String, sizeof(String), "Jobs\tTime\n\
	Sweeper\t"YELLOW_E"%d\n", pData[playerid][pSweeperTime]);
	format(String, sizeof(String), "%sBus Driver\t"YELLOW_E"%d\n", String, pData[playerid][pBusTime]);
	format(String, sizeof(String), "%sForklift\t"YELLOW_E"%d\n", String, pData[playerid][pForkliftTime]);
	format(String, sizeof(String), "%sPizza delivery\t"YELLOW_E"%d\n", String, pData[playerid][pPizzaTime]);

   	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "SideJob Time", String, "Okay", "");
	return 1;
}

CMD:idcard(playerid, params[])
{
	if(pData[playerid][pIDCard] == 0) return Error(playerid, "Anda tidak memiliki id card!");
	new sext[40];
	if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
	SendNearbyMessage(playerid, 20.0, COLOR_GREEN, "[ID-Card] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pIDCardTime]));
	return 1;
}

CMD:drivelic(playerid, params[])
{
	if(pData[playerid][pDriveLic] == 0) return Error(playerid, "Anda tidak memiliki Driving License/SIM!");
	new sext[40];
	if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
	SendNearbyMessage(playerid, 20.0, COLOR_GREEN, "[Drive-Lic] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pDriveLicTime]));
	return 1;
}

CMD:licbiz(playerid, params[])
{
	if(pData[playerid][pDriveLic] == 0) return Error(playerid, "Anda tidak memiliki Business Lic!");
	new sext[40];
	if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
	SendNearbyMessage(playerid, 20.0, COLOR_GREEN, "[Business-Lic] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pLicBizTime]));
	return 1;
}

CMD:showskck(playerid, params[])
{
    if(!pData[playerid][pSkck])
	 	return Error(playerid, "Anda Tidak Memiliki SKCK");


	new to_player;
    if(sscanf(params, "u", to_player))
        return Usage(playerid, "/showskck [playerid/PartOfName]");
	if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	new sext[40], lstr[128], mstr[128];
	if(pData[to_player][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(mstr, sizeof(mstr), "Surat SKCK %s", pData[playerid][pName]);
	format(mstr,sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nSisa Waktu: %s", pData[playerid][pName], pData[playerid][pAge], sext,  ReturnTimelapse(gettime(), pData[playerid][pSkckTime]));
	ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, lstr, mstr, "Tutup", "");
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memperlihatkan Surat SKCK Kepada %s", ReturnName(playerid), ReturnName(to_player));
	return 1;
}

CMD:showpenebang(playerid, params[])
{
    if(!pData[playerid][pPenebangs])
	 	return Error(playerid, "Anda Tidak Memiliki License Penebang");

	new to_player;
    if(sscanf(params, "u", to_player))
        return Usage(playerid, "/showpenebang [playerid/PartOfName]");

	if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	new sext[40], lstr[128], mstr[128];
	if(pData[to_player][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(lstr, sizeof(lstr), "License Penebang Milik %s", pData[playerid][pName]);
	format(mstr,sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nSisa Waktu: %s", pData[playerid][pName], pData[playerid][pAge], sext,  ReturnTimelapse(gettime(), pData[playerid][pPenebangsTime]));
	ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, lstr, mstr, "Tutup", "");
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memperlihatkan License Penebang Kepada %s", ReturnName(playerid), ReturnName(to_player));
	return 1;
}

CMD:showbpjs(playerid, params[])
{
    if(!pData[playerid][pBpjs])
	 	return Error(playerid, "Anda Tidak Memiliki License Penebang");

	new to_player;
    if(sscanf(params, "u", to_player))
        return Usage(playerid, "/showbpjs [playerid/PartOfName]");

	if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	new sext[40], lstr[128], mstr[128];
	if(pData[to_player][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(lstr, sizeof(lstr), "Surat BPJS %s %s", pData[playerid][pName]);
	format(mstr,sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nSisa Waktu: %s", pData[playerid][pName], pData[playerid][pAge], sext,  ReturnTimelapse(gettime(), pData[playerid][pBpjsTime]));
	ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, lstr, mstr, "Tutup", "");
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memperlihatkan BPJS Kepada %s", ReturnName(playerid), ReturnName(to_player));
	return 1;
}

CMD:ktp(playerid, params[])
{
	if(!pData[playerid][pIDCard])
	    return Error(playerid, "Anda Tidak Memiliki KTP");

    new to_player;
    if(sscanf(params, "u", to_player))
        return Usage(playerid, "/ktp [playerid/PartOfName]");
	if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	new gstr[1024], header[512], fac[24], fid = pData[playerid][pFamily];
	header = "";
	gstr = "";

	if(pData[playerid][pFaction] == 1)
	{
		fac = "San Andreas Police";
	}
	else if(pData[playerid][pFaction] == 2)
	{
		fac = "San Andreas Goverment";
	}
	else if(pData[playerid][pFaction] == 3)
	{
		fac = "San Andreas Medic";
	}
	else if(pData[playerid][pFaction] == 4)
	{
		fac = "San Andreas News";
	}
	else
	{
		fac = "Menganggur";
	}

	new fname[128];
	if(fid != -1)
	{
		format(fname, 128, fData[fid][fName]);
	}
	else
	{
		format(fname, 128, "None");
	}

	format(header,sizeof(header),"KTP Milik: "YELLOW_E"%s", pData[playerid][pName]);
	format(gstr,sizeof(gstr),"%sNama: %s\n", gstr, pData[playerid][pName]);
    format(gstr,sizeof(gstr),"%sGender: [%s] | Rekening Bank: [%d] | Phone Number: [%d]\n", gstr,(pData[playerid][pGender] == 2) ? ("Female") : ("Male") , pData[playerid][pBankRek], pData[playerid][pPhone]);
    format(gstr,sizeof(gstr),"%sBirdthdate: [%s] | Job: [%s] | Job 2: [%s] | Faction: [%s] | Family: [%s]", gstr, pData[playerid][pAge], GetJobName(pData[playerid][pJob]), GetJobName(pData[playerid][pJob2]), fac, fname);
    ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, header, gstr, "Tutup", "");
    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memperlihatkan KTP Kepada %s", ReturnName(playerid), ReturnName(to_player));
	return 1;
}


CMD:newidcard(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1392.77, -22.25, 1000.97)) return Error(playerid, "Anda harus berada di City Hall!");
	if(pData[playerid][pIDCard] != 0) return Error(playerid, "Anda sudah memiliki ID Card!");
	if(GetPlayerMoney(playerid) < 5000) return Error(playerid, "Anda butuh $50.00 untuk membuat ID Card");
	new sext[40], mstr[128];
	if(pData[playerid][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(mstr, sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nBerlaku hingga 14 hari!", pData[playerid][pName], pData[playerid][pAge], sext);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "ID-Card", mstr, "Tutup", "");
	pData[playerid][pIDCard] = 1;
	pData[playerid][pIDCardTime] = gettime() + (15 * 86400);
	GivePlayerMoneyEx(playerid, -5000);
	Server_AddMoney(5000);
	return 1;
}

CMD:newbpjs(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1370.6390,717.5485,-15.7573)) return Error(playerid, "Anda harus berada di Rumah Sakit!");
	if(pData[playerid][pBpjs] != 0) return Error(playerid, "Anda sudah memiliki BPJS!");
	if(GetPlayerMoney(playerid) < 5000) return Error(playerid, "Anda butuh $50.00 untuk membuat BPJS");
	if(GetPlayerMoney(playerid) > 100000) return Error(playerid, "BPJS Tidak untuk orang kaya");
	if(pData[playerid][pBankMoney] > 100000) return Error(playerid, "BPJS Tidak untuk orang kaya");
	new sext[40], mstr[128];
	if(pData[playerid][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(mstr, sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nBerlaku hingga 14 hari!", pData[playerid][pName], pData[playerid][pAge], sext);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "BPJS", mstr, "Tutup", "");
	pData[playerid][pBpjs] = 1;
	pData[playerid][pBpjsTime] = gettime() + (15 * 86400);
	GivePlayerMoneyEx(playerid, -5000);
	Server_AddMoney(5000);
	return 1;
}

CMD:newage(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1392.77, -22.25, 1000.97)) return Error(playerid, "Anda harus berada di City Hall!");
	//if(pData[playerid][pIDCard] != 0) return Error(playerid, "Anda sudah memiliki ID Card!");
	if(GetPlayerMoney(playerid) < 5000) return Error(playerid, "Anda butuh $50.00 untuk mengganti tgl lahir anda!");
	if(pData[playerid][IsLoggedIn] == false) return Error(playerid, "Anda harus login terlebih dahulu!");
	ShowPlayerDialog(playerid, DIALOG_CHANGEAGE, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukan tanggal lahir (Tgl/Bulan/Tahun): 15/04/1998", "Change", "Cancel");
	return 1;
}

CMD:treatment(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1252.8046,-1286.8199,1061.1492)) return Error(playerid, "Anda harus berada di Rumah Sakit!");
	if(GetPlayerMoney(playerid) < 30000) return Error(playerid, "Anda butuh $250.00 untuk membeli obat pereda sakit!");
	if(pData[playerid][IsLoggedIn] == false) return Error(playerid, "Anda harus login terlebih dahulu!");
	GivePlayerMoneyEx(playerid, -30000);
	pData[playerid][pSick] = 0;
	pData[playerid][pSickTime] = 0;
	SetPlayerDrunkLevel(playerid, 0);
	Info(playerid, "Kamu telah membeli obat pereda sakit, dan kamu sudah kembali sembuh");
	return 1;
}

CMD:newdrivelic(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1081.2939,-1696.7833,13.5469)) return Error(playerid, "Anda harus berada di DMV!");
	if(pData[playerid][pDriveLic] == 1) return Error(playerid, "Anda Sudah Memiliki {FFFF00}Driving Licence");
	if(Global[SKM] == 1) return Error(playerid, "Masih Ada Proses Sekolah SIM Yang Berlangsung, Tunggu Sebentar");
	PutPlayerInVehicle(playerid, DmvVeh[0], 0);
    Global[SKM] = 1;
    pData[playerid][pSekolahSim] = 1;
    SetPlayerCheckpoint(playerid, dmvpoint1, 3.0);
    Info(playerid, "Anda sedang memulai {FFFF00}DMV {FFFFFF}Test");
    if(GetPlayerMoney(playerid) < 10000) return Error(playerid, "Anda butuh {00FF00}$100.00 {FFFFFF}untuk memulai {FFFF00}DMV {FFFFFF}Test");
    GivePlayerMoneyEx(playerid, -10000);
    return 1;
}

CMD:payticket(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 246.45, 118.53, 1003.21)) return Error(playerid, "Anda harus berada di kantor SAPD!");

	new vehid;
	if(sscanf(params, "d", vehid))
		return Usage(playerid, "/payticket [vehid] | /v my(/mypv) - for find vehid");

	if(vehid == INVALID_VEHICLE_ID || !IsValidVehicle(vehid))
		return Error(playerid, "Invalid id");

	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				new ticket = pvData[i][cTicket];

				if(ticket > GetPlayerMoney(playerid))
					return Error(playerid, "Not enough money! check your ticket in /v insu.");

				if(ticket > 0)
				{
					GivePlayerMoneyEx(playerid, -ticket);
					pvData[i][cTicket] = 0;
					Info(playerid, "Anda telah berhasil membayar ticket tilang kendaraan %s(id: %d) sebesar "RED_E"%s", GetVehicleName(vehid), vehid, FormatMoney(ticket));
					return 1;
				}
			}
			else return Error(playerid, "Kendaraan ini bukan milik anda! /v my(/mypv) - for find vehid");
		}
	}
	return 1;
}

CMD:buyplate(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 240.80, 112.95, 1003.21)) return Error(playerid, "Anda harus berada di SAPD!");

	new vehid;
	if(sscanf(params, "d", vehid)) return Usage(playerid, "/buyplate [vehid] | /v my(/mypv) - for find vehid");

	if(vehid == INVALID_VEHICLE_ID || !IsValidVehicle(vehid))
		return Error(playerid, "Invalid id");

	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				if(GetPlayerMoney(playerid) < 20000) return Error(playerid, "Anda butuh $200.00 untuk membeli Plate baru.");
				GivePlayerMoneyEx(playerid, -20000);
				new rand = RandomEx(1111, 9999);
				format(pvData[i][cPlate], 32, "A-%d", rand);
				SetVehicleNumberPlate(pvData[i][cVeh], pvData[i][cPlate]);
				pvData[i][cPlateTime] = gettime() + (15 * 86400);
				Info(playerid, "Model: %s || New plate: %s || Plate Time: %s || Plate Price: $100.00", GetVehicleModelName(pvData[i][cModel]), pvData[i][cPlate], ReturnTimelapse(gettime(), pvData[i][cPlateTime]));
			}
			else return Error(playerid, "ID kendaraan ini bukan punya mu! gunakan /v my(/mypv) untuk mencari ID.");
		}
	}
	return 1;
}

CMD:work(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_WORK, DIALOG_STYLE_LIST, "Start Work", "MechDuty\nTaxiDuty", "Enter", "Back");
	return 1;
}

CMD:buyinsu(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, -367.8806, 1635.2896, 999.2969)) return Error(playerid, "Anda harus berada di Insurance office(/gps)!");

	new vehid;
	if(sscanf(params, "d", vehid)) return Usage(playerid, "/buyinsu [vehid] | /v my(mypv) - for find vehid");
	if(vehid == INVALID_VEHICLE_ID) return Error(playerid, "Invalid id");

	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID] && pvData[i][cClaim] == 0)
			{
				if(GetPlayerMoney(playerid) < 20000) return Error(playerid, "Anda butuh $200.00 untuk membeli Insurance.");
				GivePlayerMoneyEx(playerid, -20000);
				pvData[i][cInsu]++;
				Info(playerid, "Model: %s || Total Insurance: %d || Insurance Price: $200.00", GetVehicleModelName(pvData[i][cModel]), pvData[i][cInsu]);
			}
			else return Error(playerid, "ID kendaraan ini bukan punya mu! gunakan /v my(/mypv) untuk mencari ID.");
		}
	}
	return 1;
}

CMD:claimpv(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, -367.8806, 1635.2896, 999.2969)) return Error(playerid, "Anda harus berada di Insurance office(/gps)!");
	new found = 0;
	foreach(new i : PVehicles)
	{
		if(pvData[i][cClaim] == 1 && pvData[i][cClaimTime] == 0)
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				pvData[i][cClaim] = 0;

				OnPlayerVehicleRespawn(i);
				pvData[i][cPosX] = 1590.1661;
				pvData[i][cPosY] = -2162.8203;
				pvData[i][cPosZ] = 13.1109;
				pvData[i][cPosA] = 268.6917;
				SetValidVehicleHealth(pvData[i][cVeh], 1500);
				SetVehiclePos(pvData[i][cVeh], 1590.1661, -2162.8203, 13.1109);
				SetVehicleZAngle(pvData[i][cVeh], 268.6917);
				SetVehicleFuel(pvData[i][cVeh], 1000);
				found++;
				Info(playerid, "Anda telah mengclaim kendaraan %s anda.", GetVehicleModelName(pvData[i][cModel]));
			}
			//else return Error(playerid, "ID kendaraan ini bukan punya mu! gunakan /v my(/mypv) untuk mencari ID.");
		}
	}
	if(found == 0)
	{
		Info(playerid, "Sekarang belum saatnya anda mengclaim kendaraan anda!");
	}
	else
	{
		Info(playerid, "Anda berhasil mengclaim %d kendaraan anda!", found);
	}
	return 1;
}

CMD:sellpv(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, -367.8806, 1635.2896, 999.2969)) return Error(playerid, "Anda harus berada di Insurance office(/gps)!");

	new vehid;
	if(sscanf(params, "d", vehid)) return Usage(playerid, "/sellpv [vehid] | /v my(mypv) - for find vehid");
	if(vehid == INVALID_VEHICLE_ID) return Error(playerid, "Invalid id");

	foreach(new i : PVehicles)
	{
		if(vehid == pvData[i][cVeh])
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				if(!IsValidVehicle(pvData[i][cVeh])) return Error(playerid, "Your vehicle is not spanwed!");
				if(pvData[i][cRent] != 0) return Error(playerid, "You can't sell rental vehicle!");
				new pay = pvData[i][cPrice] / 2;
				GivePlayerMoneyEx(playerid, pay);

				Info(playerid, "Anda menjual kendaraan model %s(%d) dengan seharga "LG_E"%s", GetVehicleName(vehid), GetVehicleModel(vehid), FormatMoney(pay));
				new query[128];
				mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[i][cID]);
				mysql_tquery(g_SQL, query);
				if(IsValidVehicle(pvData[i][cVeh])) DestroyVehicle(pvData[i][cVeh]);
				Iter_SafeRemove(PVehicles, i, i);
			}
			else return Error(playerid, "ID kendaraan ini bukan punya anda! gunakan /v my(/mypv) untuk mencari ID.");
		}
	}
	return 1;
}

CMD:newrek(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 2246.46, -1757.03, 1014.77)) return Error(playerid, "Anda harus berada di Bank!");
	if(GetPlayerMoney(playerid) < 5000) return Error(playerid, "Not enough money!");
	new query[128], rand = RandomEx(111111, 999999);
	new rek = rand+pData[playerid][pID];
	mysql_format(g_SQL, query, sizeof(query), "SELECT brek FROM players WHERE brek='%d'", rek);
	mysql_tquery(g_SQL, query, "BankRek", "id", playerid, rek);
	Info(playerid, "New rekening bank!");
	GivePlayerMoneyEx(playerid, -5000);
	Server_AddMoney(5000);
	return 1;
}

CMD:bank(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 2246.55, -1750.25, 1014.77)) return Error(playerid, "Anda harus berada di bank point!");
	new tstr[128];
	format(tstr, sizeof(tstr), ""ORANGE_E"No Rek: "LB_E"%d", pData[playerid][pBankRek]);
	ShowPlayerDialog(playerid, DIALOG_BANK, DIALOG_STYLE_LIST, tstr, "Deposit Money\nWithdraw Money\nCheck Balance\nTransfer Money\nSign Paycheck", "Select", "Cancel");
	return 1;
}

CMD:pay(playerid, params[])
{
    new id, cash[32], String[256];
    new dollars, cents, totalcash[25];
    if(sscanf(params, "us[32]", id, cash)) return SendClientMessage(playerid, COLOR_RIKO, "USAGE: /pay [playerid] [amount]");

    if(strfind(cash, ".", true) != -1)
    {
        sscanf(cash, "p<.>dd", dollars, cents);
        format(totalcash, sizeof(totalcash), "%d%02d", dollars, cents);
        if(IsPlayerConnected(id) && id != playerid)
        {
            if(GetPlayerMoney(playerid) >= strval(totalcash))
            {
                if(IsPlayerInRangeOfPlayer(playerid, id, 6.0))
				{
				    if(strval(totalcash) < 0) return SendClientMessageEx(playerid, COLOR_RED, "ERROR: {FFFFFF}Tidak bisa dibawah $0.00");
       	            GivePlayerMoneyEx(playerid, -strval(totalcash));
     			    GivePlayerMoneyEx(id, strval(totalcash));
          		    format(String, sizeof(String), "PAYINFO: {ffffff}You've given {ffff00}%s {00ff00}$%s", ReturnName(playerid), FormatMoney(strval(totalcash)));
	              	SendClientMessage(playerid, COLOR_LOGS, String);
                    format(String, sizeof(String), "PAYINFO: {ffffff}You've received {00ff00}$%s {ffffff}from {ffff00}%s ", FormatMoney(strval(totalcash)), ReturnName(playerid));
                    SendClientMessage(id, COLOR_LOGS, String);
                   	ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
					ApplyAnimation(id, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
				    new ip[32], ipex[32];
				    GetPlayerIp(playerid, ip, sizeof(ip));
				    GetPlayerIp(id, ipex, sizeof(ipex));
				}
				else Error(playerid, "Anda tidak berada dekat dengan Player tersebut.");
            }
            else Error(playerid, "Anda tidak memiliki uang sebesar itu.");
        }
    }
    else
    {
        sscanf(cash, "d", dollars);
        format(totalcash, sizeof(totalcash), "%d00", dollars);
        if(IsPlayerConnected(id) && id != playerid)
        {
            if(GetPlayerMoney(playerid) >= strval(totalcash))
            {
                if(IsPlayerInRangeOfPlayer(playerid, id, 6.0))
			    {
				    if(strval(totalcash) < 0) return SendClientMessageEx(playerid, COLOR_GREY, "Tidak bisa dibawah $0.00");
       	            GivePlayerMoneyEx(playerid, -strval(totalcash));
     			    GivePlayerMoneyEx(id, strval(totalcash));
          		    format(String, sizeof(String), "PAYINFO: {ffffff}You've given {ffff00}%s {00ff00}$%s", ReturnName(playerid), FormatMoney(strval(totalcash)));
	              	SendClientMessage(playerid, COLOR_LOGS, String);
                    format(String, sizeof(String), "PAYINFO: {ffffff}You've received {00ff00}$%s {ffffff}from {ffff00}%s ", FormatMoney(strval(totalcash)), ReturnName(playerid));
                    SendClientMessage(id, COLOR_LOGS, String);
                   	ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
					ApplyAnimation(id, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
				    new ip[32], ipex[32];
				    GetPlayerIp(playerid, ip, sizeof(ip));
				    GetPlayerIp(id, ipex, sizeof(ipex));
			    }
				else Error(playerid, "Anda tidak berada dekat dengan Player tersebut.");
            }
            else Error(playerid, "Anda tidak memiliki uang sebesar itu.");
        }
    }
    return 1;
}
/*
CMD:showlic(playerid, params[])
{
    static
        item[24],
		to_player;

	//new otherid, item, mstr[128];
	if(sscanf(params, "ud", to_player, item))
	{
	    Usage(playerid, "/showlic <ID/Name> <item>");
		Info(playerid, "[idcard], [penebang], [skck], [sim]");
	    return true;
	}

	if(!IsPlayerConnected(to_player) || !NearPlayer(playerid, to_player, 4.0))
        	return Error(playerid, "The specified player is disconnected or not near you.");

    if(!strcmp(item,"idcard"))
	{
        if(pData[playerid][pIDCard] == 0) return Error(playerid, "Anda tidak memiliki id card!");
		new sext[40];
		if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
		SendClientMessage(to_player, COLOR_GREEN, "[ID-Card] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pIDCardTime]));
    }
    else if(!strcmp(item,"penebang",true))
	{
        if(pData[playerid][pPenebangs] == 0) return Error(playerid, "Anda tidak memiliki lic penebang!");
		new fmt_text, sext[1000];
		if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
		SendClientMessage(to_player, COLOR_GREEN, "[LIC PENEBANG] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pPenebangsTime]));
    }
    else if(!strcmp(item,"skck"))
	{
        if(pData[playerid][pSkck] == 0) return Error(playerid, "Anda tidak memiliki SKCK!");
		new fmt_text, sext[1000];
		if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
		format(fmt_text, sizeof fmt_text, "[SKCK] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pSkckTime]));
		SendClientMessage(to_player, COLOR_GREEN, fmt_text);
		//SendClientMessage(to_player, COLOR_GREEN, "[SKCK] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pSkckTime]));
    }

    else if(!strcmp(item,"sim"))
	{
       	if(pData[playerid][pDriveLic] == 0) return Error(playerid, "Anda tidak memiliki SIM!");
		new sext[40];
		if(pData[playerid][pGender] == 1) { sext = "Male"; } else { sext = "Female"; }
		SendClientMessage(to_player, COLOR_GREEN, "[SIM] "GREY3_E"Name: %s | Gender: %s | Brithday: %s | Expire: %s.", pData[playerid][pName], sext, pData[playerid][pAge], ReturnTimelapse(gettime(), pData[playerid][pDriveLicTime]));
    }
	return 1;
}
*/

CMD:givebpjs(playerid, params[])
{

    if(pData[playerid][pFaction] != 3)
        return Error(playerid, "You must be part of a medical faction.");
	new to_player;
    if(sscanf(params, "u", to_player))
        return Usage(playerid, "/givebpjs [playerid/PartOfName]");

    if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(pData[to_player][pBpjs] != 0) return Error(playerid, "Orang ini sudah mempunyai BPJS");
	new sext[40], lstr[128], mstr[128];
	if(pData[to_player][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(lstr, sizeof(lstr), "Surat BPJS %s", pData[to_player][pName]);
	format(mstr,sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nBerlaku hingga 14 hari!", pData[to_player][pName], pData[to_player][pAge], sext);
	ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, lstr, mstr, "Tutup", "");
	Info(to_player, "Anda mendapatkan surat	BPJS dari departemen rumah sakit");
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memberikan Surat BPJS Kepada %s", ReturnName(playerid), ReturnName(to_player));
	pData[to_player][pBpjs] = 1;
	pData[to_player][pBpjsTime] = gettime() +  (15 * 86400);
	Info(playerid, "Anda Telah Memberikan Surat SKCK kepada %s", ReturnName(to_player));

    return 1;
}

CMD:giveskck(playerid, params[])
{
	if(pData[playerid][pFaction] != 1)
        return Error(playerid, "You not police officer.");
    if(pData[playerid][pFactionRank] < 3)
		return Error(playerid, "You must be 3 rank level!");

	new to_player;
    if(sscanf(params, "u", to_player))
        return Usage(playerid, "/giveskck [playerid/PartOfName]");
	if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(pData[to_player][pSkck] != 0) return Error(playerid, "Orang ini sudah mempunyai SKCK");
	new sext[40], lstr[128], mstr[128];
	if(pData[to_player][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(lstr, sizeof(lstr), "Surat SKCK", pData[to_player][pName]);
	format(mstr,sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nBerlaku hingga 14 hari!", pData[to_player][pName], pData[to_player][pAge], sext);
	ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, lstr, mstr, "Tutup", "");
	Info(to_player, "Anda mendapatkan surat SKCK dari departemen kepolisian");
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memberikan Surat SKCK Kepada %s", ReturnName(playerid), ReturnName(to_player));
	pData[to_player][pSkck] = 1;
	pData[to_player][pSkckTime] = gettime() +  (15 * 86400);
	Info(playerid, "Anda Telah Memberikan Surat SKCK kepada %s", ReturnName(to_player));
	//GivePlayerMoneyEx(playerid, -50);
	//Server_AddMoney(25);
	return 1;
}

CMD:givepenebang(playerid, params[])
{
	if(pData[playerid][pFaction] != 1)
        return Error(playerid, "You not police officer.");
    if(pData[playerid][pFactionRank] < 3)
		return Error(playerid, "You must be 3 rank level!");

	new to_player;
    if(sscanf(params, "u", to_player))
        return Usage(playerid, "/givepenebang [playerid/PartOfName]");

	if(!NearPlayer(playerid, to_player, 6.0))
		return SendClientMessage(playerid, 0xCECECEFF, "Pemainnya terlalu jauh");

	if(pData[to_player][pPenebangs] != 0) return Error(playerid, "Orang ini sudah mempunyai Lic Penebang");
	new sext[40], lstr[128], mstr[128];
	if(pData[to_player][pGender] == 1) { sext = "Laki-Laki"; } else { sext = "Perempuan"; }
	format(lstr, sizeof(lstr), "Surat Penebang %s", pData[to_player][pName]);
	format(mstr,sizeof(mstr), "{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nBerlaku hingga 14 hari!", pData[to_player][pName], pData[to_player][pAge], sext);
	ShowPlayerDialog(to_player, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, lstr, mstr, "Tutup", "");
	Info(to_player, "Anda Mendapatkan License Penebang dari Departemen kepolisian");
	pData[to_player][pPenebangs] = 1;
	pData[to_player][pPenebangsTime] = gettime() +  (15 * 86400);
	Info(playerid, "Anda Telah Memberikan License Penebang Kepada %s", ReturnName(to_player));
	SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s Memberikan License Penebang Kepada %s", ReturnName(playerid), ReturnName(to_player));
	//GivePlayerMoneyEx(playerid, -50);
	//Server_AddMoney(25);
	return 1;
}

CMD:stats(playerid, params[])
{
	if(pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be logged in to check statistics!");
	    return 1;
	}

	DisplayStats(playerid, playerid);
	return 1;
}

CMD:settings(playerid)
{
	if(pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be logged in to check statistics!");
	    return 1;
	}

	new str[1024], hbemode[64], tdmode[64], togpm[64], toglog[64], togads[64], togwt[64];
	if(pData[playerid][pHBEMode] == 1)
	{
		hbemode = ""LG_E"Simple";
	}
	else if(pData[playerid][pHBEMode] == 2)
	{
		hbemode = ""LG_E"Modern";
	}
	else
	{
		hbemode = ""RED_E"Disable";
	}

	if(pData[playerid][pTogPM] == 0)
	{
		togpm = ""RED_E"Disable";
	}
	else
	{
		togpm = ""LG_E"Enable";
	}

	if(pData[playerid][pTogLog] == 0)
	{
		toglog = ""RED_E"Disable";
	}
	else
	{
		toglog = ""LG_E"Enable";
	}

	if(pData[playerid][pTogAds] == 0)
	{
		togads = ""RED_E"Disable";
	}
	else
	{
		togads = ""LG_E"Enable";
	}

	if(pData[playerid][pTogWT] == 0)
	{
		togwt = ""RED_E"Disable";
	}
	else
	{
		togwt = ""LG_E"Enable";
	}

	format(str, sizeof(str), ""WHITEP_E"Email:\t"GREY3_E"%s\n"WHITEP_E"Change Password\n"WHITEP_E"HUD HBE Mode:\t%s\n"WHITEP_E"Toggle PM:\t%s\n"WHITEP_E"Toggle Log Server:\t%s\n"WHITEP_E"Toggle Ads:\t%s\n"WHITEP_E"Toggle WT:\t%s",
	pData[playerid][pEmail],
	hbemode,
	togpm,
	toglog,
	togads,
	togwt
	);

	ShowPlayerDialog(playerid, DIALOG_SETTINGS, DIALOG_STYLE_LIST, "Settings", str, "Set", "Close");
	return 1;
}
CMD:shakehand(playerid, params[])
{
	new String[10000], giveplayerid, style;
	if(sscanf(params, "ud", giveplayerid, style)) return SendClientMessageEx(playerid, COLOR_WHITE, "USE: /shakehand [playerid] [style (1-8)]");

	if(IsPlayerConnected(giveplayerid))
	{
		if(giveplayerid == playerid)
		{
			SendClientMessageEx(playerid, COLOR_GREY, "You can't shake your own hand.");
			return 1;
		}
		if(style >= 1 && style < 9)
		{
			new Float: ppFloats[3];

			GetPlayerPos(giveplayerid, ppFloats[0], ppFloats[1], ppFloats[2]);

			if(!IsPlayerInRangeOfPoint(playerid, 5, ppFloats[0], ppFloats[1], ppFloats[2]))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "You're too far away. You can't shake hands right now.");
				return 1;
			}

			SetPVarInt(playerid, "shrequest", giveplayerid);
			SetPVarInt(playerid, "shstyle", style);

			format(String, sizeof(String), "You have requested to shake %s's hand, please wait for them to respond.", pData[giveplayerid][pName]);
			SendClientMessageEx(playerid, COLOR_WHITE, String);

			format(String, sizeof(String), "%s has requested to shake your hand, please use {FFFF00}'/accept handshake'{FFFFFF} to approve the hand shake.", pData[playerid][pName]);
			SendClientMessageEx(giveplayerid, COLOR_WHITE, String);
		}
		else
		{
			Usage(playerid,"/shakehand [1-9]");
		}
	}
	else
	{
		 Error(playerid, "Invalid player specified.");
	}
	return 1;
}
CMD:items(playerid, params[])
{
	if(pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be logged in to check items!");
	    return true;
	}
	DisplayItems(playerid, playerid);
	return 1;
}
CMD:health(playerid, params[])
{
	DisplayCondition(playerid, playerid);
	return 1;
}
CMD:getjob(playerid, params[])
{
	if(pData[playerid][pIDCard] <= 0)
		return Error(playerid, "Anda tidak memiliki ID-Card.");

	if(pData[playerid][pVip] > 0)
	{
		if(pData[playerid][pJob] == 0 || pData[playerid][pJob2] == 0)
		{
			if(pData[playerid][pJob] == 0)
			{
				if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -2159.04, 640.36, 1052.38))
				{
					pData[playerid][pGetJob] = 1;
					Info(playerid, "Anda telah berhasil mendaftarkan job Taxi. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 2171.0276,-2238.5984,13.3178))
				{
					pData[playerid][pGetJob] = 2;
					Info(playerid, "Anda telah berhasil mendaftarkan job mechanic. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -265.87, -2213.63, 29.04))
				{
					pData[playerid][pGetJob] = 3;
					Info(playerid, "Anda telah berhasil mendaftarkan job lumber jack. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -77.38, -1136.52, 1.07))
				{
					pData[playerid][pGetJob] = 4;
					Info(playerid, "Anda telah berhasil mendaftarkan job trucker. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 319.94, 874.77, 20.39))
				{
					pData[playerid][pGetJob] = 5;
					Info(playerid, "Anda telah berhasil mendaftarkan job miner. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -283.02, -2174.36, 28.66))
				{
					pData[playerid][pGetJob] = 6;
					Info(playerid, "Anda telah berhasil mendaftarkan job production. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -383.67, -1438.90, 26.32))
				{
					pData[playerid][pGetJob] = 7;
					Info(playerid, "Anda telah berhasil mendaftarkan job farmer. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -3805.5723,1307.4285,75.5859))
				{
					pData[playerid][pGetJob] = 8;
					Info(playerid, "Anda telah berhasil mendaftarkan job smuggler. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1613.6221,-1892.9106,13.5469))
				{
					pData[playerid][pGetJob] = 9;
					Info(playerid, "Anda telah berhasil mendaftarkan job courier. /accept job untuk konfirmasi.");
				}
				else return Error(playerid, "Anda sudah memiliki job atau tidak berada di dekat pendaftaran job.");
			}
			else if(pData[playerid][pJob2] == 0)
			{
				if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -2159.04, 640.36, 1052.38))
				{
					pData[playerid][pGetJob2] = 1;
					Info(playerid, "Anda telah berhasil mendaftarkan job Taxi. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 2171.0276,-2238.5984,13.3178))
				{
					pData[playerid][pGetJob2] = 2;
					Info(playerid, "Anda telah berhasil mendaftarkan job mechanic. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -265.87, -2213.63, 29.04))
				{
					pData[playerid][pGetJob2] = 3;
					Info(playerid, "Anda telah berhasil mendaftarkan job lumber jack. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -77.38, -1136.52, 1.07))
				{
					pData[playerid][pGetJob2] = 4;
					Info(playerid, "Anda telah berhasil mendaftarkan job trucker. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 319.94, 874.77, 20.39))
				{
					pData[playerid][pGetJob2] = 5;
					Info(playerid, "Anda telah berhasil mendaftarkan job miner. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -283.02, -2174.36, 28.66))
				{
					pData[playerid][pGetJob2] = 6;
					Info(playerid, "Anda telah berhasil mendaftarkan job production. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -383.67, -1438.90, 26.32))
				{
					pData[playerid][pGetJob2] = 7;
					Info(playerid, "Anda telah berhasil mendaftarkan job farmer. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -3805.5723,1307.4285,75.5859))
				{
					pData[playerid][pGetJob2] = 8;
					Info(playerid, "Anda telah berhasil mendaftarkan job smuggler. /accept job untuk konfirmasi.");
				}
				else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1613.6221,-1892.9106,13.5469))
				{
					pData[playerid][pGetJob2] = 9;
					Info(playerid, "Anda telah berhasil mendaftarkan job courier. /accept job untuk konfirmasi.");
				}
				else return Error(playerid, "Anda sudah memiliki job atau tidak berada di dekat pendaftaran job.");
			}
			else return Error(playerid, "Anda sudah memiliki 2 pekerjaan!");
		}
		else return Error(playerid, "Anda sudah memiliki 2 pekerjaan!");
	}
	else
	{
		if(pData[playerid][pJob] > 0)
			return Error(playerid, "Anda hanya bisa memiliki 1 pekerjaan!");

		if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -2159.04, 640.36, 1052.38))
		{
			pData[playerid][pGetJob] = 1;
			Info(playerid, "Anda telah berhasil mendaftarkan job Taxi. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 2171.0276,-2238.5984,13.3178))
		{
			pData[playerid][pGetJob] = 2;
			Info(playerid, "Anda telah berhasil mendaftarkan job mechanic. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -265.87, -2213.63, 29.04))
		{
			pData[playerid][pGetJob] = 3;
			Info(playerid, "Anda telah berhasil mendaftarkan job lumber jack. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -77.38, -1136.52, 1.07))
		{
			pData[playerid][pGetJob] = 4;
			Info(playerid, "Anda telah berhasil mendaftarkan job trucker. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob2] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 319.94, 874.77, 20.39))
		{
			pData[playerid][pGetJob] = 5;
			Info(playerid, "Anda telah berhasil mendaftarkan job miner. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -283.02, -2174.36, 28.66))
		{
			pData[playerid][pGetJob] = 6;
			Info(playerid, "Anda telah berhasil mendaftarkan job production. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, -383.67, -1438.90, 26.32))
		{
			pData[playerid][pGetJob] = 7;
			Info(playerid, "Anda telah berhasil mendaftarkan job farmer. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 988.890563, -1349.136962, 13.545228))
		{
			pData[playerid][pGetJob] = 8;
			Info(playerid, "Anda telah berhasil mendaftarkan job smuggler. /accept job untuk konfirmasi.");
		}
		else if(pData[playerid][pJob] == 0 && GetPlayerState(playerid) == 1 && IsPlayerInRangeOfPoint(playerid, 3.0, 1613.6221,-1892.9106,13.5469))
		{
			pData[playerid][pGetJob] = 9;
			Info(playerid, "Anda telah berhasil mendaftarkan job courier. /accept job untuk konfirmasi.");
		}
		else return Error(playerid, "Anda sudah memiliki job atau tidak berada di dekat pendaftaran job.");
	}
	return 1;
}

CMD:inspect(playerid, params[])
{
	new otherid;
	if(sscanf(params, "u", otherid))
        return Usage(playerid, "/inspect [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "The specified player is disconnected or not near you.");

    if(otherid == playerid)
        return Error(playerid, "You cannot inspect yourself.");

    pData[otherid][pInspectOffer] = playerid;

    Info(otherid, "%s has offered to inspect you (type \"/accept inspect or /deny inspect\").", ReturnName(playerid));
    Info(playerid, "You have offered to inspect %s.", ReturnName(otherid));
	return 1;
}

CMD:frisk(playerid, params[])
{
	new otherid;
	if(sscanf(params, "u", otherid))
        return Usage(playerid, "/frisk [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "The specified player is disconnected or not near you.");

    if(otherid == playerid)
        return Error(playerid, "You cannot frisk yourself.");

    pData[otherid][pFriskOffer] = playerid;

    Info(otherid, "%s has offered to frisk you (type \"/accept frisk or /deny frisk\").", ReturnName(playerid));
    Info(playerid, "You have offered to frisk %s.", ReturnName(otherid));
	return 1;
}

CMD:accept(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
        if(isnull(params))
		{
            Usage(playerid, "/accept [name]");
            Info(playerid, "Names: faction, family, drag, frisk, job, farm");
            return 1;
        }
		if(strcmp(params,"faction",true) == 0)
		{
            if(IsPlayerConnected(pData[playerid][pFacOffer]))
			{
                if(pData[playerid][pFacInvite] > 0)
				{
                    pData[playerid][pFaction] = pData[playerid][pFacInvite];
					pData[playerid][pFactionRank] = 1;
					Info(playerid, "Anda telah menerima invite faction dari %s", pData[pData[playerid][pFacOffer]][pName]);
					Info(pData[playerid][pFacOffer], "%s telah menerima invite faction yang anda tawari", pData[playerid][pName]);
					pData[playerid][pFacInvite] = 0;
					pData[playerid][pFacOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid faction id!");
					return 1;
				}
            }
            else
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
		if(strcmp(params,"family",true) == 0)
		{
            if(IsPlayerConnected(pData[playerid][pFamOffer]))
			{
                if(pData[playerid][pFamInvite] > -1)
				{
                    pData[playerid][pFamily] = pData[playerid][pFamInvite];
					pData[playerid][pFamilyRank] = 1;
					Info(playerid, "Anda telah menerima invite family dari %s", pData[pData[playerid][pFamOffer]][pName]);
					Info(pData[playerid][pFamOffer], "%s telah menerima invite family yang anda tawari", pData[playerid][pName]);
					pData[playerid][pFamInvite] = 0;
					pData[playerid][pFamOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid family id!");
					return 1;
				}
            }
            else
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
        if(strcmp(params,"farm",true) == 0)
		{
            if(IsPlayerConnected(pData[playerid][pFarmOffer]))
			{
                if(pData[playerid][pFarmInvite] > -1)
				{
                    pData[playerid][pFarm] = pData[playerid][pFarmInvite];
					pData[playerid][pFarmRank] = 1;
					Info(playerid, "Anda telah menerima invite farm dari %s", pData[pData[playerid][pFarmOffer]][pName]);
					Info(pData[playerid][pFarmOffer], "%s telah menerima invite farm yang anda tawari", pData[playerid][pName]);
					pData[playerid][pFarmInvite] = 0;
					pData[playerid][pFarmOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid farm id!");
					return 1;
				}
            }
            else
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
		else if(strcmp(params,"drag",true) == 0)
		{
			new dragby = GetPVarInt(playerid, "DragBy");
			if(dragby == INVALID_PLAYER_ID || dragby == playerid)
				return Error(playerid, "That player is disconnected.");

			if(!NearPlayer(playerid, dragby, 5.0))
				return Error(playerid, "You must be near this player.");

			pData[playerid][pDragged] = 1;
			pData[playerid][pDraggedBy] = dragby;

			pData[playerid][pDragTimer] = SetTimerEx("DragUpdate", 1000, true, "ii", dragby, playerid);
			SendNearbyMessage(dragby, 30.0, COLOR_PURPLE, "* %s grabs %s and starts dragging them, (/undrag).", ReturnName(dragby), ReturnName(playerid));
			return true;
		}
		else if(strcmp(params,"frisk",true) == 0)
		{
			if(pData[playerid][pFriskOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pFriskOffer]))
				return Error(playerid, "That player not connected!");

			if(!NearPlayer(playerid, pData[playerid][pFriskOffer], 5.0))
				return Error(playerid, "You must be near this player.");

			DisplayItems(pData[playerid][pFriskOffer], playerid);
			Servers(playerid, "Anda telah berhasil menaccept tawaran frisk kepada %s.", ReturnName(pData[playerid][pFriskOffer]));
			pData[playerid][pFriskOffer] = INVALID_PLAYER_ID;
		}
		else if(strcmp(params,"inspect",true) == 0)
		{
			if(pData[playerid][pInspectOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pFriskOffer]))
				return Error(playerid, "That player not connected!");

			if(!NearPlayer(playerid, pData[playerid][pInspectOffer], 5.0))
				return Error(playerid, "You must be near this player.");

			DisplayCondition(pData[playerid][pInspectOffer], playerid);
			Servers(playerid, "Anda telah berhasil menaccept tawaran inspect kepada %s.", ReturnName(pData[playerid][pFriskOffer]));
			pData[playerid][pInspectOffer] = INVALID_PLAYER_ID;
		}
		else if(strcmp(params, "handshake",true) == 0) {

            foreach(new i : Player)
	 			{
                if(GetPVarInt(i, "shrequest") == playerid) {
                    new
                        Float: ppFloats[3];

                    GetPlayerPos(i, ppFloats[0], ppFloats[1], ppFloats[2]);

                    if(!IsPlayerInRangeOfPoint(playerid, 5, ppFloats[0], ppFloats[1], ppFloats[2])) {
                        Count++;
                        SendClientMessageEx(playerid, COLOR_WHITE, "You're too far away. You can't accept the handshake right now.");
                    }
                    else {
                        switch(GetPVarInt(i, "shstyle")) {
                            case 1:
                            {
                                Count++;
                                PlayerFacePlayer( playerid, i );
                                ApplyAnimation( playerid, "GANGS", "hndshkaa", 4.1, 0, 1, 1, 0, 0, 1);
                                ApplyAnimation( i, "GANGS", "hndshkaa", 4.1, 0, 1, 1, 0, 0, 1);
                                SetPVarInt(i, "shrequest", INVALID_PLAYER_ID);
                                DeletePVar(i, "shstyle");
                            }
                            case 2:
                            {
                                Count++;
                                PlayerFacePlayer( playerid, i );
                                ApplyAnimation( playerid, "GANGS", "hndshkba", 4.1, 0, 1, 1, 0, 0, 1);
                                ApplyAnimation( i, "GANGS", "hndshkba", 4.1, 0, 1, 1, 0, 0, 1);
                                SetPVarInt(i, "shrequest", INVALID_PLAYER_ID);
                                DeletePVar(i, "shstyle");
                            }
                            case 3:
                            {
                                Count++;
                                PlayerFacePlayer( playerid, i );
                                ApplyAnimation( playerid, "GANGS", "hndshkca", 4.1, 0, 1, 1, 0, 0, 1);
                                ApplyAnimation( i, "GANGS", "hndshkca", 4.1, 0, 1, 1, 0, 0, 1);
                                SetPVarInt(i, "shrequest", INVALID_PLAYER_ID);
                                DeletePVar(i, "shstyle");
                            }
                            case 4:
                            {
                                Count++;
                                PlayerFacePlayer( playerid, i );
                                ApplyAnimation( playerid, "GANGS", "hndshkcb", 4.1, 0, 1, 1, 0, 0, 1);
                                ApplyAnimation( i, "GANGS", "hndshkca", 4.1, 0, 1, 1, 0, 0, 1);
                                SetPVarInt(i, "shrequest", INVALID_PLAYER_ID);
                                DeletePVar(i, "shstyle");
                            }
                            case 5:
                            {
                                Count++;
                                PlayerFacePlayer( playerid, i );
                                ApplyAnimation( playerid, "GANGS", "hndshkda", 4.1, 0, 1, 1, 0, 0, 1);
                                ApplyAnimation( i, "GANGS", "hndshkca", 4.1, 0, 1, 1, 0, 0, 1);
                                SetPVarInt(i, "shrequest", INVALID_PLAYER_ID);
                                DeletePVar(i, "shstyle");
                            }
                            case 6:
                            {
                                Count++;
                                PlayerFacePlayer( playerid, i );
                                ApplyAnimation( playerid, "GANGS","hndshkfa_swt", 4.1, 0, 1, 1, 0, 0, 1);
                                ApplyAnimation( i, "GANGS","hndshkfa_swt", 4.1, 0, 1, 1, 0, 0, 1);
                                SetPVarInt(i, "shrequest", INVALID_PLAYER_ID);
                                DeletePVar(i, "shstyle");
                            }
                            case 7:
                            {
                                Count++;
                                PlayerFacePlayer( playerid, i );
                                ApplyAnimation( playerid, "GANGS", "prtial_hndshk_01", 4.1, 0, 1, 1, 0, 0, 1);
                                ApplyAnimation( i, "GANGS", "prtial_hndshk_01", 4.1, 0, 1, 1, 0, 0, 1);
                                SetPVarInt(i, "shrequest", INVALID_PLAYER_ID);
                                DeletePVar(i, "shstyle");
                            }
                            case 8:
                            {
                                Count++;
                                PlayerFacePlayer( playerid, i );
                                ApplyAnimation( playerid, "GANGS", "prtial_hndshk_biz_01", 4.1, 0, 1, 1, 0, 0, 1);
                                ApplyAnimation( i, "GANGS", "prtial_hndshk_biz_01", 4.1, 0, 1, 1, 0, 0, 1);
                                SetPVarInt(i, "shrequest", INVALID_PLAYER_ID);
                                DeletePVar(i, "shstyle");
                            }
                        }
                    }
                }
            }
            if(Count == 0) return SendClientMessageEx(playerid, COLOR_WHITE, "You don't have any pending handshake requests.");
            return 1;
        }
		else if(strcmp(params,"job",true) == 0)
		{
			if(pData[playerid][pGetJob] > 0)
			{
				pData[playerid][pJob] = pData[playerid][pGetJob];
				Info(playerid, "Anda telah berhasil mendapatkan pekerjaan baru. gunakan /help untuk informasi.");
				pData[playerid][pGetJob] = 0;
				pData[playerid][pExitJob] = gettime() + (1 * 7200);
			}
			else if(pData[playerid][pGetJob2] > 0)
			{
				pData[playerid][pJob2] = pData[playerid][pGetJob2];
				Info(playerid, "Anda telah berhasil mendapatkan pekerjaan baru. gunakan /help untuk informasi.");
				pData[playerid][pGetJob2] = 0;
				pData[playerid][pExitJob] = gettime() + (1 * 7200);
			}
		}
	}
	return 1;
}

CMD:deny(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
        if(isnull(params))
		{
            Usage(playerid, "/deny [name]");
            Info(playerid, "Names: faction, drag, frisk, job1, job2");
            return 1;
        }
		if(strcmp(params,"faction",true) == 0)
		{
            if(pData[playerid][pFacOffer] > -1)
			{
                if(pData[playerid][pFacInvite] > 0)
				{
					Info(playerid, "Anda telah menolak faction dari %s", ReturnName(pData[playerid][pFacOffer]));
					Info(pData[playerid][pFacOffer], "%s telah menolak invite faction yang anda tawari", ReturnName(playerid));
					pData[playerid][pFacInvite] = 0;
					pData[playerid][pFacOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid faction id!");
					return 1;
				}
            }
            else
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
        if(strcmp(params,"family",true) == 0)
		{
            if(pData[playerid][pFamOffer] > -1)
			{
                if(pData[playerid][pFamInvite] > 0)
				{
					Info(playerid, "Anda telah menolak fam dari %s", ReturnName(pData[playerid][pFamOffer]));
					Info(pData[playerid][pFamOffer], "%s telah menolak invite fam yang anda tawari", ReturnName(playerid));
					pData[playerid][pFamInvite] = 0;
					pData[playerid][pFamOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid fam id!");
					return 1;
				}
            }
            else
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
        if(strcmp(params,"farm",true) == 0)
		{
            if(pData[playerid][pFarmOffer] > -1)
			{
                if(pData[playerid][pFarmInvite] > 0)
				{
					Info(playerid, "Anda telah menolak farm dari %s", ReturnName(pData[playerid][pFarmOffer]));
					Info(pData[playerid][pFarmOffer], "%s telah menolak invite farm yang anda tawari", ReturnName(playerid));
					pData[playerid][pFarmInvite] = 0;
					pData[playerid][pFarmOffer] = -1;
				}
				else
				{
					Error(playerid, "Invalid farm id!");
					return 1;
				}
            }
            else
			{
                Error(playerid, "Tidak ada player yang menawari anda!");
                return 1;
            }
        }
		else if(strcmp(params,"drag",true) == 0)
		{
			new dragby = GetPVarInt(playerid, "DragBy");
			if(dragby == INVALID_PLAYER_ID || dragby == playerid)
				return Error(playerid, "That player is disconnected.");

			Info(playerid, "Anda telah menolak drag.");
			Info(dragby, "Player telah menolak drag yang anda tawari.");

			DeletePVar(playerid, "DragBy");
			pData[playerid][pDragged] = 0;
			pData[playerid][pDraggedBy] = INVALID_PLAYER_ID;
			return 1;
		}
		else if(strcmp(params,"frisk",true) == 0)
		{
			if(pData[playerid][pFriskOffer] == INVALID_PLAYER_ID || !IsPlayerConnected(pData[playerid][pFriskOffer]))
				return Error(playerid, "That player not connected!");

			Info(playerid, "Anda telah menolak tawaran frisk kepada %s.", ReturnName(pData[playerid][pFriskOffer]));
			pData[playerid][pFriskOffer] = INVALID_PLAYER_ID;
			return 1;
		}
		else if(strcmp(params,"job1",true) == 0)
		{
			if(pData[playerid][pJob] == 0) return Error(playerid, "Anda tidak memiliki job apapun.");
			if(pData[playerid][pExitJob] != 0) return Error(playerid, "You must wait 1 days for exit from your current job!");
			if(pData[playerid][pJob] != 0)
			{
				pData[playerid][pJob] = 0;
				Info(playerid, "Anda berhasil keluar dari pekerjaan anda.");
				return 1;
			}
		}
		else if(strcmp(params,"job2",true) == 0)
		{
			if(pData[playerid][pJob2] == 0) return Error(playerid, "Anda tidak memiliki job apapun.");
			if(pData[playerid][pJob2] != 0)
			{
				pData[playerid][pJob2] = 0;
				Info(playerid, "Anda berhasil keluar dari pekerjaan anda.");
				return 1;
			}
		}
	}
	return 1;
}

CMD:give(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		new name[24], ammount, otherid;
        if(sscanf(params, "us[24]d", otherid, name, ammount))
		{
			Usage(playerid, "/give [playerid] [name] [ammount]");
			Info(playerid, "Names: bandage, medicine, snack, sprunk, material, component, marijuana, berry");
			return 1;
		}
		if(otherid == INVALID_PLAYER_ID || otherid == playerid || !NearPlayer(playerid, otherid, 3.0))
			return Error(playerid, "Invalid playerid!");

		if(!(1 <= ammount <= 500))
			return Error(playerid, "1-500");

		if(strcmp(name,"bandage",true) == 0)
		{
			if(pData[playerid][pBandage] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			pData[playerid][pBandage] -= ammount;
			pData[otherid][pBandage] += ammount;
			Info(playerid, "Anda telah berhasil memberikan perban kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan perban kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"medicine",true) == 0)
		{
			if(pData[playerid][pMedicine] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			pData[playerid][pMedicine] -= ammount;
			pData[otherid][pMedicine] += ammount;
			Info(playerid, "Anda telah berhasil memberikan medicine kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan medicine kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"snack",true) == 0)
		{
			if(pData[playerid][pSnack] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			pData[playerid][pSnack] -= ammount;
			pData[otherid][pSnack] += ammount;
			Info(playerid, "Anda telah berhasil memberikan snack kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan snack kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"sprunk",true) == 0)
		{
			if(pData[playerid][pSprunk] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			pData[playerid][pSprunk] -= ammount;
			pData[otherid][pSprunk] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Sprunk kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Sprunk kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"material",true) == 0)
		{
			if(pData[playerid][pMaterial] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount > 500)
				return Error(playerid, "Invalid ammount 1 - 500");

			new maxmat = pData[otherid][pMaterial] + ammount;

			if(maxmat > 500)
				return Error(playerid, "That player already have maximum material!");

			pData[playerid][pMaterial] -= ammount;
			pData[otherid][pMaterial] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Material kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Material kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"component",true) == 0)
		{
			if(pData[playerid][pComponent] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			if(ammount > 500)
				return Error(playerid, "Invalid ammount 1 - 500");

			new maxcomp = pData[otherid][pComponent] + ammount;

			if(maxcomp > 500)
				return Error(playerid, "That player already have maximum component!");

			pData[playerid][pComponent] -= ammount;
			pData[otherid][pComponent] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Component kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Component kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"marijuana",true) == 0)
		{
			if(pData[playerid][pMarijuana] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			pData[playerid][pMarijuana] -= ammount;
			pData[otherid][pMarijuana] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Marijuana kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Marijuana kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(strcmp(name,"berry",true) == 0)
		{
			if(pData[playerid][pBerry] < ammount)
				return Error(playerid, "Item anda tidak cukup.");

			pData[playerid][pBerry] -= ammount;
			pData[otherid][pBerry] += ammount;
			Info(playerid, "Anda telah berhasil memberikan Berry kepada %s sejumlah %d.", ReturnName(otherid), ammount);
			Info(otherid, "%s telah berhasil memberikan Berry kepada anda sejumlah %d.", ReturnName(playerid), ammount);
			ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
	}
	return 1;
}

CMD:use(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
        if(isnull(params))
		{
            Usage(playerid, "/use [name]");
            Info(playerid, "Names: bandage, snack, sprunk, gas, medicine, marijuana, boombox, berry");
            return 1;
        }
		if(strcmp(params,"bandage",true) == 0)
		{
			if(pData[playerid][pBandage] < 1)
				return Error(playerid, "Anda tidak memiliki perban.");

			new Float:darah;
			GetPlayerHealth(playerid, darah);
			pData[playerid][pBandage]--;
			SetPlayerHealthEx(playerid, darah+15);
			Info(playerid, "Anda telah berhasil menggunakan perban.");
			InfoTD_MSG(playerid, 3000, "Restore +15 Health");
		}
		else if(strcmp(params,"snack",true) == 0)
		{
			if(pData[playerid][pSnack] < 1)
				return Error(playerid, "Anda tidak memiliki snack.");

			pData[playerid][pSnack]--;
			pData[playerid][pHunger] += 15;
			pData[playerid][pTrash] += 1;
			Info(playerid, "Anda telah berhasil menggunakan snack dan terdapat sampah di inventory.");
			InfoTD_MSG(playerid, 3000, "Restore +15 Hunger");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"sprunk",true) == 0)
		{
			if(pData[playerid][pSprunk] < 1)
				return Error(playerid, "Anda tidak memiliki sprunk.");

			pData[playerid][pSprunk]--;
			pData[playerid][pEnergy] += 15;
			pData[playerid][pTrash] += 1;
			Info(playerid, "Anda telah berhasil meminum sprunk dan terdapat sampah pada inventory.");
			InfoTD_MSG(playerid, 3000, "Restore +15 Energy");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		/*else if(strcmp(params,"sprunk",true) == 0)
		{
			if(pData[playerid][pSprunk] < 1)
				return Error(playerid, "Anda tidak memiliki snack.");

			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_SPRUNK);
			//SendNearbyMessage(playerid, 10.0, COLOR_PURPLE,"* %s opens a can of sprunk.", ReturnName(playerid));
			SetPVarInt(playerid, "UsingSprunk", 1);
			pData[playerid][pSprunk]--;
		}*/
		else if(strcmp(params,"gas",true) == 0)
		{
			if(pData[playerid][pGas] < 1)
				return Error(playerid, "Anda tidak memiliki gas.");

			if(IsPlayerInAnyVehicle(playerid))
				return Error(playerid, "Anda harus berada diluar kendaraan!");

			if(pData[playerid][pActivityTime] > 5) return Error(playerid, "Anda masih memiliki activity progress!");

			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			if(IsValidVehicle(vehicleid))
			{
				new fuel = GetVehicleFuel(vehicleid);

				if(GetEngineStatus(vehicleid))
					return Error(playerid, "Turn off vehicle engine.");

				if(fuel >= 999.0)
					return Error(playerid, "This vehicle gas is full.");

				if(!IsEngineVehicle(vehicleid))
					return Error(playerid, "This vehicle can't be refull.");

				if(!GetHoodStatus(vehicleid))
					return Error(playerid, "The hood must be opened before refull the vehicle.");

				pData[playerid][pGas]--;
				Info(playerid, "Don't move from your position or you will failed to refulling this vehicle.");
				ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
				pData[playerid][pActivity] = SetTimerEx("RefullCar", 1000, true, "id", playerid, vehicleid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Refulling...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				/*InfoTD_MSG(playerid, 10000, "Refulling...");
				//SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s starts to refulling the vehicle.", ReturnName(playerid));*/
				return 1;
			}
		}
		else if(strcmp(params,"medicine",true) == 0)
		{
			if(pData[playerid][pMedicine] < 1)
				return Error(playerid, "Anda tidak memiliki medicine.");

			pData[playerid][pMedicine]--;
			pData[playerid][pSick] = 0;
			pData[playerid][pSickTime] = 0;
			SetPlayerDrunkLevel(playerid, 0);
			Info(playerid, "Anda menggunakan medicine.");

			//InfoTD_MSG(playerid, 3000, "Restore +15 Hunger");
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"marijuana",true) == 0)
		{
			if(pData[playerid][pMarijuana] < 1)
				return Error(playerid, "You dont have marijuana.");

			new Float:armor;
			GetPlayerArmour(playerid, armor);
			if(armor+10 > 90) return Error(playerid, "Over dosis!");

			pData[playerid][pMarijuana]--;
			SetPlayerArmourEx(playerid, armor+10);
			SetPlayerDrunkLevel(playerid, 4000);
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
		else if(strcmp(params,"boombox",true) == 0)
		{
			if(pData[playerid][pBoombox] < 1)
				return Error(playerid, "You dont have boombox");

			new string[128], Float:BBCoord[4], pNames[MAX_PLAYER_NAME];
		    GetPlayerPos(playerid, BBCoord[0], BBCoord[1], BBCoord[2]);
		    GetPlayerFacingAngle(playerid, BBCoord[3]);
		    SetPVarFloat(playerid, "BBX", BBCoord[0]);
		    SetPVarFloat(playerid, "BBY", BBCoord[1]);
		    SetPVarFloat(playerid, "BBZ", BBCoord[2]);
		    GetPlayerName(playerid, pNames, sizeof(pNames));
		    BBCoord[0] += (2 * floatsin(-BBCoord[3], degrees));
		   	BBCoord[1] += (2 * floatcos(-BBCoord[3], degrees));
		   	BBCoord[2] -= 1.0;
			if(GetPVarInt(playerid, "PlacedBB")) return SCM(playerid, -1, "Kamu Sudah Memasang Boombox");
			foreach(new i : Player)
			{
		 		if(GetPVarType(i, "PlacedBB"))
		   		{
		  			if(IsPlayerInRangeOfPoint(playerid, 30.0, GetPVarFloat(i, "BBX"), GetPVarFloat(i, "BBY"), GetPVarFloat(i, "BBZ")))
					{
		   				SendClientMessage(playerid, COLOR_WHITE, "Kamu Tidak Dapat Memasang Boombox Disini, Karena Orang Sudah Lain Sudah Memasang Boombox Disini");
					    return 1;
					}
				}
			}
			new string2[128];
			format(string2, sizeof(string2), "%s Telah Memasang Boombox!", pNames);
			SendNearbyMessage(playerid, 15, COLOR_PURPLE, string2);
			SetPVarInt(playerid, "PlacedBB", CreateDynamicObject(2102, BBCoord[0], BBCoord[1], BBCoord[2], 0.0, 0.0, 0.0, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid)));
			format(string, sizeof(string), "Creator "WHITE_E"%s\n["LBLUE"/bbhelp for info"WHITE_E"]", pNames);
			SetPVarInt(playerid, "BBLabel", _:CreateDynamic3DTextLabel(string, COLOR_YELLOW, BBCoord[0], BBCoord[1], BBCoord[2]+0.6, 5, .worldid = GetPlayerVirtualWorld(playerid), .interiorid = GetPlayerInterior(playerid)));
			SetPVarInt(playerid, "BBArea", CreateDynamicSphere(BBCoord[0], BBCoord[1], BBCoord[2], 30.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid)));
			SetPVarInt(playerid, "BBInt", GetPlayerInterior(playerid));
			SetPVarInt(playerid, "BBVW", GetPlayerVirtualWorld(playerid));
			ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0);
		    ApplyAnimation(playerid,"BOMBER","BOM_Plant",4.0,0,0,0,0,0);
		}
        else if(strcmp(params,"berry",true) == 0)
		{
			if(pData[playerid][pBerry] < 0)
				return Error(playerid, "You dont have berry.");

			pData[playerid][pHunger] += 8;
			pData[playerid][pBerry]--;
			ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop",2.1,0,0,0,0,0);
		}
	}
	return 1;
}

CMD:bbhelp(playerid, params[])
{
	Usage(playerid, "/use boombox /setbb /pickupbb");
	return 1;
}

CMD:setbb(playerid, params[])
{
    if(pData[playerid][pBoombox] == 0)
	    return SendClientMessage(playerid, 0xCECECEFF, "you dont have boombox");

	if(GetPVarType(playerid, "PlacedBB"))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, GetPVarFloat(playerid, "BBX"), GetPVarFloat(playerid, "BBY"), GetPVarFloat(playerid, "BBZ")))
		{
			ShowPlayerDialog(playerid,DIALOG_BOOMBOX,DIALOG_STYLE_LIST,"Boombox","Turn Off Boombox\nInput URL","Select", "Cancel");
		}
		else
		{
   			return SendClientMessage(playerid, -1, "You're not near from your boombox");
		}
    }
    else
    {
        SendClientMessage(playerid, -1, "you didnt place boombox before");
	}
	return 1;
}

CMD:pickupbb(playerid, params [])
{
    if(pData[playerid][pBoombox] == 0)
	    return SendClientMessage(playerid, 0xCECECEFF, "you dont have boombox");

	if(!GetPVarInt(playerid, "PlacedBB"))
    {
        SendClientMessage(playerid, -1, "you dont have placedboombox to take");
    }
	if(IsPlayerInRangeOfPoint(playerid, 3.0, GetPVarFloat(playerid, "BBX"), GetPVarFloat(playerid, "BBY"), GetPVarFloat(playerid, "BBZ")))
    {
        PickUpBoombox(playerid);
        SendClientMessage(playerid, -1, "boombox pickup");
    }
    return 1;
}
stock StopStream(playerid)
{
	DeletePVar(playerid, "pAudioStream");
    StopAudioStreamForPlayer(playerid);
}

stock PlayStream(playerid, url[], Float:posX = 0.0, Float:posY = 0.0, Float:posZ = 0.0, Float:distance = 50.0, usepos = 0)
{
	if(GetPVarType(playerid, "pAudioStream")) StopAudioStreamForPlayer(playerid);
	else SetPVarInt(playerid, "pAudioStream", 1);
    PlayAudioStreamForPlayer(playerid, url, posX, posY, posZ, distance, usepos);
}

stock PickUpBoombox(playerid)
{
    foreach(new i : Player)
	{
 		if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "BBArea")))
   		{
     		StopStream(i);
		}
	}
	DeletePVar(playerid, "BBArea");
	DestroyDynamicObject(GetPVarInt(playerid, "PlacedBB"));
	DestroyDynamic3DTextLabel(Text3D:GetPVarInt(playerid, "BBLabel"));
	DeletePVar(playerid, "PlacedBB"); DeletePVar(playerid, "BBLabel");
 	DeletePVar(playerid, "BBX"); DeletePVar(playerid, "BBY"); DeletePVar(playerid, "BBZ");
	DeletePVar(playerid, "BBInt");
	DeletePVar(playerid, "BBVW");
	DeletePVar(playerid, "BBStation");
	return 1;
}

CMD:drop(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
        if(isnull(params))
		{
            Usage(playerid, "/throws [name]");
            Info(playerid, "Names: bandage, snack, sprunk, gas, medicine, marijuana");
            return 1;
        }
		if(strcmp(params,"bandage",true) == 0)
		{
			if(pData[playerid][pBandage] < 1)
				return Error(playerid, "Anda tidak memiliki perban.");

			pData[playerid][pBandage] = 0;
			Info(playerid, "Anda telah berhasil membuang bandage");
		}
		else if(strcmp(params,"snack",true) == 0)
		{
			if(pData[playerid][pSnack] < 1)
				return Error(playerid, "Anda tidak memiliki snack.");

			pData[playerid][pSnack] = 0;
			Info(playerid, "Anda telah berhasil membuang Snack");
		}
		else if(strcmp(params,"sprunk",true) == 0)
		{
			if(pData[playerid][pSprunk] < 1)
				return Error(playerid, "Anda tidak memiliki sprunk.");

			pData[playerid][pSprunk] = 0;
			Info(playerid, "Anda telah berhasil membuang sprunk");
		}
		else if(strcmp(params,"sprunk",true) == 0)
		{
			if(pData[playerid][pSprunk] < 1)
				return Error(playerid, "Anda tidak memiliki snack.");

			pData[playerid][pSprunk] = 0;
			Info(playerid, "Anda telah berhasil membuang snack");
		}
		else if(strcmp(params,"gas",true) == 0)
		{
			if(pData[playerid][pGas] < 1)
				return Error(playerid, "Anda tidak memiliki gas.");

			pData[playerid][pGas] = 0;
			Info(playerid, "Anda telah berhasil membuang gas");
		}
		else if(strcmp(params,"medicine",true) == 0)
		{
			if(pData[playerid][pMedicine] < 1)
				return Error(playerid, "Anda tidak memiliki medicine.");

			pData[playerid][pMedicine] = 0;
			Info(playerid, "Anda telah berhasil membuang medicine");
		}
		else if(strcmp(params,"marijuana",true) == 0)
		{
			if(pData[playerid][pMarijuana] < 1)
				return Error(playerid, "You dont have marijuana.");

			pData[playerid][pMarijuana] = 0;
			Info(playerid, "Anda telah berhasil membuang marijuana");
		}
	}
	return 1;
}


CMD:enter(playerid, params[])
{
	if(pData[playerid][pInjured] == 0)
    {
		foreach(new did : Doors)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
			{
				if(dData[did][dGarage] == 1 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsPlayerInAnyVehicle(playerid))
				{
					if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
						return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

					if(dData[did][dLocked])
						return Error(playerid, "This entrance is locked at the moment.");

					if(dData[did][dFaction] > 0)
					{
						if(dData[did][dFaction] != pData[playerid][pFaction])
							return Error(playerid, "This door only for faction.");
					}
					if(dData[did][dFamily] > 0)
					{
						if(dData[did][dFamily] != pData[playerid][pFamily])
							return Error(playerid, "This door only for family.");
					}

					if(dData[did][dVip] > pData[playerid][pVip])
						return Error(playerid, "Your VIP level not enough to enter this door.");

					if(dData[did][dAdmin] > pData[playerid][pAdmin])
						return Error(playerid, "Your admin level not enough to enter this door.");

					if(strlen(dData[did][dPass]))
					{
						if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
						if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");

						if(dData[did][dCustom])
						{
							SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						else
						{
							SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						pData[playerid][pInDoor] = did;
						SetPlayerInterior(playerid, dData[did][dIntint]);
						SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, 0);
					}
					else
					{
						if(dData[did][dCustom])
						{
							SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						else
						{
							SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						pData[playerid][pInDoor] = did;
						SetPlayerInterior(playerid, dData[did][dIntint]);
						SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, 0);
					}
				}
				else
				{
					if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
						return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

					if(dData[did][dLocked])
						return Error(playerid, "This entrance is locked at the moment.");

					if(dData[did][dFaction] > 0)
					{
						if(dData[did][dFaction] != pData[playerid][pFaction])
							return Error(playerid, "This door only for faction.");
					}
					if(dData[did][dFamily] > 0)
					{
						if(dData[did][dFamily] != pData[playerid][pFamily])
							return Error(playerid, "This door only for family.");
					}

					if(dData[did][dVip] > pData[playerid][pVip])
						return Error(playerid, "Your VIP level not enough to enter this door.");

					if(dData[did][dAdmin] > pData[playerid][pAdmin])
						return Error(playerid, "Your admin level not enough to enter this door.");

					if(strlen(dData[did][dPass]))
					{
						if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
						if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");

						if(dData[did][dCustom])
						{
							SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						else
						{
							SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						pData[playerid][pInDoor] = did;
						SetPlayerInterior(playerid, dData[did][dIntint]);
						SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, 0);
					}
					else
					{
						if(dData[did][dCustom])
						{
							SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						else
						{
							SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
						}
						pData[playerid][pInDoor] = did;
						SetPlayerInterior(playerid, dData[did][dIntint]);
						SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, 0);
					}
				}
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
			{
				if(dData[did][dGarage] == 1 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsPlayerInAnyVehicle(playerid))
				{
					if(dData[did][dFaction] > 0)
					{
						if(dData[did][dFaction] != pData[playerid][pFaction])
							return Error(playerid, "This door only for faction.");
					}

					if(dData[did][dCustom])
					{
						SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
					}
					else
					{
						SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
					}
					pData[playerid][pInDoor] = -1;
					SetPlayerInterior(playerid, dData[did][dExtint]);
					SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, WorldWeather);
				}
				else
				{
					if(dData[did][dFaction] > 0)
					{
						if(dData[did][dFaction] != pData[playerid][pFaction])
							return Error(playerid, "This door only for faction.");
					}

					if(dData[did][dCustom])
						SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);

					else
						SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);

					pData[playerid][pInDoor] = -1;
					SetPlayerInterior(playerid, dData[did][dExtint]);
					SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
			}
        }
		//Houses
		foreach(new hid : Houses)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
			{
				if(hData[hid][hIntposX] == 0.0 && hData[hid][hIntposY] == 0.0 && hData[hid][hIntposZ] == 0.0)
					return Error(playerid, "Interior house masih kosong, atau tidak memiliki interior.");

				if(hData[hid][hLocked])
					return Error(playerid, "This house is locked!");

				pData[playerid][pInHouse] = hid;
				SetPlayerPositionEx(playerid, hData[hid][hIntposX], hData[hid][hIntposY], hData[hid][hIntposZ], hData[hid][hIntposA]);

				SetPlayerInterior(playerid, hData[hid][hInt]);
				SetPlayerVirtualWorld(playerid, hid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inhouseid = pData[playerid][pInHouse];
		if(pData[playerid][pInHouse] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, hData[inhouseid][hIntposX], hData[inhouseid][hIntposY], hData[inhouseid][hIntposZ]))
		{
			SetPlayerPositionEx(playerid, hData[inhouseid][hExtposX], hData[inhouseid][hExtposY], hData[inhouseid][hExtposZ], hData[inhouseid][hExtposA]);

			pData[playerid][pInHouse] = -1;
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Bisnis
		foreach(new bid : Bisnis)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
			{
				if(bData[bid][bIntposX] == 0.0 && bData[bid][bIntposY] == 0.0 && bData[bid][bIntposZ] == 0.0)
					return Error(playerid, "Interior bisnis masih kosong, atau tidak memiliki interior.");

				if(bData[bid][bLocked])
					return Error(playerid, "This bisnis is locked!");

				pData[playerid][pInBiz] = bid;
				SetPlayerPositionEx(playerid, bData[bid][bIntposX], bData[bid][bIntposY], bData[bid][bIntposZ], bData[bid][bIntposA]);

				PlayAudioStreamForPlayer(playerid, bData[bid][bSong], bData[bid][bIntposX], bData[bid][bIntposY], bData[bid][bIntposZ], 15.0, 1);
				SetPlayerInterior(playerid, bData[bid][bInt]);
				SetPlayerVirtualWorld(playerid, bid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inbisnisid = pData[playerid][pInBiz];
		if(pData[playerid][pInBiz] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, bData[inbisnisid][bIntposX], bData[inbisnisid][bIntposY], bData[inbisnisid][bIntposZ]))
		{
			SetPlayerPositionEx(playerid, bData[inbisnisid][bExtposX], bData[inbisnisid][bExtposY], bData[inbisnisid][bExtposZ], bData[inbisnisid][bExtposA]);

			StopAudioStreamForPlayer(playerid);
			pData[playerid][pInBiz] = -1;
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Family
		foreach(new fid : FAMILYS)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ]))
			{
				if(fData[fid][fIntposX] == 0.0 && fData[fid][fIntposY] == 0.0 && fData[fid][fIntposZ] == 0.0)
					return Error(playerid, "Interior masih kosong, atau tidak memiliki interior.");

				if(pData[playerid][pFaction] == 0)
					if(pData[playerid][pFamily] == -1)
						return Error(playerid, "You dont have registered for this door!");

				SetPlayerPositionEx(playerid, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ], fData[fid][fIntposA]);

				SetPlayerInterior(playerid, fData[fid][fInt]);
				SetPlayerVirtualWorld(playerid, fid);
				SetCameraBehindPlayer(playerid);
				//pData[playerid][pInBiz] = fid;
				SetPlayerWeather(playerid, 0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ]))
			{
				SetPlayerPositionEx(playerid, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ], fData[fid][fExtposA]);

				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
				//pData[playerid][pInBiz] = -1;
			}
        }
	}
	return 1;
}
CMD:skills(playerid)
{
	SkillStatus(playerid);
}
CMD:putplayer(playerid, params[])
{
	new giveplayerid, seat;
	if(sscanf(params, "ud", giveplayerid, seat)) return Usage(playerid, "/putplayer [playerid] [seatid 1-3]");

	if(!IsPlayerInAnyVehicle(playerid))
		return Error(playerid, "You can't do this while you're in a vehicle.");

	if(seat < 1 || seat > 3)
		return Error(playerid, "The seat ID cannot be above 3 or below 1.");

	if(IsPlayerInAnyVehicle(giveplayerid))
		return Error(playerid, "That person is in a car - get them out first.");

	if(giveplayerid == INVALID_PLAYER_ID)
    	return Error(playerid, "That player is disconnected.");

    if(giveplayerid == playerid)
        return Error(playerid, "You cannot put yourself.");

    if(!NearPlayer(playerid, giveplayerid, 5.0))
        return Error(playerid, "You must be near this player.");

    if(!pData[giveplayerid][pInjured])
        return Error(playerid, "That person is not injured!.");

	new carid = GetPlayerVehicleID(playerid);
	new Float:pos[6];
	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	GetPlayerPos(giveplayerid, pos[3], pos[4], pos[5]);
	GetVehiclePos( carid, pos[0], pos[1], pos[2]);
	if (floatcmp(floatabs(floatsub(pos[0], pos[3])), 10.0) != -1 &&
	floatcmp(floatabs(floatsub(pos[1], pos[4])), 10.0) != -1 &&
	floatcmp(floatabs(floatsub(pos[2], pos[5])), 10.0) != -1) return false;
	Info(giveplayerid, "You were put in vehicle by %s .", ReturnName(playerid));
	Info(playerid, "Put %s To Vehicle.", ReturnName(giveplayerid));

	ClearAnimations(giveplayerid);
	PutPlayerInVehicle(giveplayerid, carid, seat);

	return 1;
}
CMD:eject(playerid, params[])
{
	new giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return Usage(playerid, "/eject [playerid]");

	new State;
	State = GetPlayerState(playerid);
	if(State != PLAYER_STATE_DRIVER)
		return Error(playerid, "You can only eject people as the driver!");

	if(giveplayerid == INVALID_PLAYER_ID)
    return Error(playerid, "That player is disconnected.");

    if(giveplayerid == playerid)
        return Error(playerid, "You cannot eject yourself.");

    if(!NearPlayer(playerid, giveplayerid, 5.0))
        return Error(playerid, "You must be near this player.");

	new vid;
	vid = GetPlayerVehicleID(playerid);

	if(IsPlayerInVehicle(giveplayerid, vid))
	{
		Servers(playerid, "You have thrown %s out of the car.", ReturnName(giveplayerid));
		Servers(giveplayerid, "You have been thrown out the car by %s.", ReturnName(playerid));

		RemovePlayerFromVehicle(giveplayerid);
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(giveplayerid, slx, sly, slz);
		SetPlayerPos(giveplayerid, slx, sly, slz+1.2);
	}
	return 1;
}
CMD:drag(playerid, params[])
{
	new otherid;
    if(sscanf(params, "u", otherid))
        return Usage(playerid, "/drag [playerid/PartOfName] || /undrag [playerid]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "That player is disconnected.");

    if(otherid == playerid)
        return Error(playerid, "You cannot drag yourself.");

    if(!NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "You must be near this player.");

    if(!pData[otherid][pInjured])
        return Error(playerid, "kamu tidak bisa drag orang yang tidak mati.");

    SetPVarInt(otherid, "DragBy", playerid);
    Info(otherid, "%s Telah menawari drag kepada anda, /accept drag untuk menerimanya /deny drag untuk membatalkannya.", ReturnName(playerid));
	Info(playerid, "Anda berhasil menawari drag kepada player %s", ReturnName(otherid));
    return 1;
}

CMD:undrag(playerid, params[])
{
	new otherid;
    if(sscanf(params, "u", otherid)) return Usage(playerid, "/undrag [playerid]");
	if(pData[otherid][pDragged])
    {
        DeletePVar(playerid, "DragBy");
        DeletePVar(otherid, "DragBy");
        pData[otherid][pDragged] = 0;
        pData[otherid][pDraggedBy] = INVALID_PLAYER_ID;

        KillTimer(pData[otherid][pDragTimer]);
        SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s releases %s from their grip.", ReturnName(playerid), ReturnName(otherid));
    }
    return 1;
}

CMD:masked(playerid)
{
	new mstr[4000];
	mstr = "Player Name\tMask ID\n";
	foreach(new i : Player)
	{
		if(pData[i][pMaskOn] == 1)
		{
			format(mstr, sizeof(mstr), "%s%s[%d]\t"YELLOW_E"Mask_%d\n", mstr, pData[i][pName], i, pData[i][pMaskID]);
			ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "Masked Users", mstr, "Close","");
		}
	}
}

CMD:tweet(playerid, params[])
{
    if(GetPVarInt(playerid, "maketw") > gettime())
        return Error(playerid, "Mohon Tunggu 5 Detik Untuk Menggunakan kembali (Don't Spam).");


	if(!pData[playerid][pTweet]) return Error(playerid, "Anda tidak mempunyai akun twitter");
    if(!strcmp(pData[playerid][pTname], "None"))
		return Error(playerid, "Kamu Harus set nama untuk nama akun Twitter mu.");
    if(pData[playerid][pPhoneCredit] <= 0) return Error(playerid, "You dont have phone credits!");

	if(!strlen(params)) return Usage(playerid, "/tweet [teks]");

	new string[300];
	format(string, sizeof(string), "[TWITTER] @%s: %s ", pData[playerid][pTname], params);
	SendTweetMessage(0x00BFFFFF, string);
	format(string, sizeof string, "```[TWITTER] @%s: %s ```", pData[playerid][pTname], params);
	pData[playerid][pPhoneCredit] -= 1;
    DCC_SendChannelMessage(g_discord_twt, string);

	SetPVarInt(playerid, "maketw", gettime() + 5);
	return 1;
}
CMD:twlist(playerid)
{
	new mstr[4000];
	mstr = "Player Name\tTweet Name\n";
	foreach (new i : Player)
	{
		if(pData[i][pTweet] == 1)
		{
			format(mstr, sizeof(mstr), "%s%s[%d]\t"YELLOW_E"%s\n", mstr, pData[i][pName], i, pData[i][pTname]);
			ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "List Tweet Account", mstr, "Close","");
		}
	}
}

CMD:mask(playerid, params[])
{
	if(pData[playerid][pMask] <= 0)
		return Error(playerid, "Anda tidak memiliki topeng!");

	switch (pData[playerid][pMaskOn])
    {
        case 0:
        {
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s takes out a mask and puts it on.", ReturnName(playerid));
            pData[playerid][pMaskOn] = 1;
            new string[35];
            GetPlayerName(playerid, string, sizeof(string));
            format(string,sizeof(string), "Mask_%d", pData[playerid][pMaskID]);
      	 	SetPlayerName(playerid, string);
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				ShowPlayerNameTagForPlayer(i, playerid, 0);
			}
			//SetPlayerAttachedObject(playerid, 9, 18911, 2,0.078534, 0.041857, -0.001727, 268.970458, 1.533374, 269.223754);
        }
        case 1:
        {
            pData[playerid][pMaskOn] = 0;
            SetPlayerName(playerid, pData[playerid][pName]);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s takes their mask off and puts it away.", ReturnName(playerid));
			for(new i = GetPlayerPoolSize(); i != -1; --i)
			{
				ShowPlayerNameTagForPlayer(i, playerid, 1);
			}
			//RemovePlayerAttachedObject(playerid, 9);
        }
    }
	return 1;
}

CMD:dice(playerid, params[])
{
	new Float:pPos[3];

	new dice = 1 + random(30);

	if(dice > 30 ) return dice = 30;

	GetPlayerPos(playerid, pPos[0], pPos[1], pPos[2]);

	foreach(new i : Player)
	{
	    if(IsPlayerInRangeOfPoint(i, 8.0, pPos[0], pPos[1], pPos[2]))
	    {
	        SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s rolls a dice which lands on the number %d.", ReturnName(playerid), dice);
	    }
	}

	return 1;
}

//Text and Chat Commands
CMD:try(playerid, params[])
{

    if(isnull(params))
        return Usage(playerid, "/try [action]");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s %.64s ..", ReturnName(playerid), params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s, %s", params[64], (random(2) == 0) ? ("and success") : ("but fail"));
    }
    else {
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s %s, %s", ReturnName(playerid), params, (random(2) == 0) ? ("and success") : ("but fail"));
    }
	printf("[TRY] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:ado(playerid, params[])
{
    new flyingtext[164], Float:x, Float:y, Float:z;

    if(isnull(params))
	{
        Usage(playerid, "/ado [text]");
		Info(playerid, "Use /ado off to disable or delete the ado tag.");
		return 1;
	}
    if(strlen(params) > 128)
        return Error(playerid, "Max text can only maximmum 128 characters.");

    if (!strcmp(params, "off", true))
    {
        if (!pData[playerid][pAdoActive])
            return Error(playerid, "You're not actived your 'ado' text.");

        if (IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pAdoTag]);

        Servers(playerid, "You're removed your ado text.");
        pData[playerid][pAdoActive] = false;
        return 1;
    }

    FixText(params);
    format(flyingtext, sizeof(flyingtext), "* %s *\n(( %s ))", ReturnName(playerid), params);

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* [ADO]: %.64s ..", params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s", params[64]);
    }
    else
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* [ADO]: %s", params);
    }

    GetPlayerPos(playerid, x, y, z);
    if(pData[playerid][pAdoActive])
    {
        if (IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            UpdateDynamic3DTextLabelText(pData[playerid][pAdoTag], COLOR_PURPLE, flyingtext);
        else
            pData[playerid][pAdoTag] = CreateDynamic3DTextLabel(flyingtext, COLOR_PURPLE, x, y, z, 15, _, _, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    }
    else
    {
        pData[playerid][pAdoActive] = true;
        pData[playerid][pAdoTag] = CreateDynamic3DTextLabel(flyingtext, COLOR_PURPLE, x, y, z, 15, _, _, 1, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
    }
	printf("[ADO] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:ame(playerid, params[])
{
    new flyingtext[164];

    if(isnull(params))
        return Usage(playerid, "/ame [action]");

    if(strlen(params) > 128)
        return Error(playerid, "Max action can only maximmum 128 characters.");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* [AME]: %.64s ..", params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s", params[64]);
    }
    else
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* [AME]: %s", params);
    }
    format(flyingtext, sizeof(flyingtext), "* %s %s*", ReturnName(playerid), params);
    SetPlayerChatBubble(playerid, flyingtext, COLOR_PURPLE, 10.0, 10000);
	printf("[AME] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:me(playerid, params[])
{

    if(isnull(params))
        return Usage(playerid, "/me [action]");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s %.64s ..", ReturnName(playerid), params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s", params[64]);
    }
    else
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s %s", ReturnName(playerid), params);
    }
	printf("[ME] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:do(playerid, params[])
{
    if(isnull(params))
        return Usage(playerid, "/do [description]");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64)
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %.64s ..", params);
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, ".. %s (( %s ))", params[64], ReturnName(playerid));
    }
    else
	{
        SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s (( %s ))", params, ReturnName(playerid));
    }
	printf("[DO] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:toglog(playerid)
{
	if(!pData[playerid][pTogLog])
	{
		pData[playerid][pTogLog] = 1;
		Info(playerid, "Anda telah menonaktifkan log server.");
	}
	else
	{
		pData[playerid][pTogLog] = 0;
		Info(playerid, "Anda telah mengaktifkan log server.");
	}
	return 1;
}

CMD:togpm(playerid)
{
	if(!pData[playerid][pTogPM])
	{
		pData[playerid][pTogPM] = 1;
		Info(playerid, "Anda telah menonaktifkan PM");
	}
	else
	{
		pData[playerid][pTogPM] = 0;
		Info(playerid, "Anda telah mengaktifkan PM");
	}
	return 1;
}

CMD:togads(playerid)
{
	if(!pData[playerid][pTogAds])
	{
		pData[playerid][pTogAds] = 1;
		Info(playerid, "Anda telah menonaktifkan Ads/Iklan.");
	}
	else
	{
		pData[playerid][pTogAds] = 0;
		Info(playerid, "Anda telah mengaktifkan Ads/Iklan.");
	}
	return 1;
}

CMD:togwt(playerid)
{
	if(!pData[playerid][pTogWT])
	{
		pData[playerid][pTogWT] = 1;
		Info(playerid, "Anda telah menonaktifkan Walkie Talkie.");
	}
	else
	{
		pData[playerid][pTogWT] = 0;
		Info(playerid, "Anda telah mengaktifkan Walkie Talkie.");
	}
	return 1;
}

CMD:pm(playerid, params[])
{
    static text[128], otherid;
    if(sscanf(params, "us[128]", otherid, text))
        return Usage(playerid, "/pm [playerid/PartOfName] [message]");

    /*if(pData[playerid][pTogPM])
        return Error(playerid, "You must enable private messaging first.");*/

    /*if(pData[otherid][pAdminDuty])
        return Error(playerid, "You can't pm'ing admin duty now!");*/

	if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You have specified an invalid player.");

    if(otherid == playerid)
        return Error(playerid, "You can't private message yourself.");

    if(pData[otherid][pTogPM] && pData[playerid][pAdmin] < 1)
        return Error(playerid, "That player has disabled private messaging.");

    GameTextForPlayer(otherid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~New message!", 3000, 3);
    PlayerPlaySound(otherid, 1085, 0.0, 0.0, 0.0);

    SendClientMessageEx(otherid, COLOR_YELLOW, "(( PM from %s (%d): %s ))", pData[playerid][pName], playerid, text);
    SendClientMessageEx(playerid, COLOR_YELLOW, "(( PM to %s (%d): %s ))", pData[otherid][pName], otherid, text);
	Info(otherid, "/togpm for tog enable/disable PM");

    foreach(new i : Player) if((pData[i][pAdmin]) && pData[playerid][pSPY] > 0)
    {
        SendClientMessageEx(i, COLOR_LIGHTGREEN, "[SPY PM] %s (%d) to %s (%d): %s", pData[playerid][pName], playerid, pData[otherid][pName], otherid, text);
    }
    return 1;
}

CMD:whisper(playerid, params[])
{
	new text[128], otherid;
    if(sscanf(params, "us[128]", otherid, text))
        return Usage(playerid, "/(w)hisper [playerid/PartOfName] [text]");

    if(otherid == INVALID_PLAYER_ID || !NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "That player is disconnected or not near you.");

    if(otherid == playerid)
        return Error(playerid, "You can't whisper yourself.");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(text) > 64)
	{
        SendClientMessageEx(otherid, COLOR_YELLOW, "** Whisper from %s (%d): %.64s", ReturnName(playerid), playerid, text);
        SendClientMessageEx(otherid, COLOR_YELLOW, "...%s **", text[64]);

        SendClientMessageEx(playerid, COLOR_YELLOW, "** Whisper to %s (%d): %.64s", ReturnName(otherid), otherid, text);
        SendClientMessageEx(playerid, COLOR_YELLOW, "...%s **", text[64]);
    }
    else
	{
        SendClientMessageEx(otherid, COLOR_YELLOW, "** Whisper from %s (%d): %s **", ReturnName(playerid), playerid, text);
        SendClientMessageEx(playerid, COLOR_YELLOW, "** Whisper to %s (%d): %s **", ReturnName(otherid), otherid, text);
    }
    SendNearbyMessage(playerid, 10.0, COLOR_PURPLE, "* %s mutters something in %s's ear.", ReturnName(playerid), ReturnName(otherid));

	foreach(new i : Player) if((pData[i][pAdmin]) && pData[i][pSPY] > 0)
    {
        SendClientMessageEx(i, COLOR_YELLOW2, "[SPY Whisper] %s (%d) to %s (%d): %s", pData[playerid][pName], playerid, pData[otherid][pName], otherid, text);
    }
    return 1;
}

CMD:l(playerid, params[])
{
    if(isnull(params))
        return Usage(playerid, "/(l)ow [low text]");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
	if(IsPlayerInAnyVehicle(playerid))
	{
		foreach(new i : Player)
		{
			if(IsPlayerInAnyVehicle(i) && GetPlayerVehicleID(i) == GetPlayerVehicleID(playerid))
			{
				if(strlen(params) > 64)
				{
					SendClientMessageEx(i, COLOR_WHITE, "[car] %s says: %.64s ..", ReturnName(playerid), params);
					SendClientMessageEx(i, COLOR_WHITE, "...%s", params[64]);
				}
				else
				{
					SendClientMessageEx(i, COLOR_WHITE, "[car] %s says: %s", ReturnName(playerid), params);
				}
				printf("[CAR] %s(%d) : %s", pData[playerid][pName], playerid, params);
			}
		}
	}
	else
	{
		if(strlen(params) > 64)
		{
			SendNearbyMessage(playerid, 5.0, COLOR_WHITE, "[low] %s says: %.64s ..", ReturnName(playerid), params);
			SendNearbyMessage(playerid, 5.0, COLOR_WHITE, "...%s", params[64]);
		}
		else
		{
			SendNearbyMessage(playerid, 5.0, COLOR_WHITE, "[low] %s says: %s", ReturnName(playerid), params);
		}
		printf("[LOW] %s(%d) : %s", pData[playerid][pName], playerid, params);
	}
    return 1;
}

CMD:s(playerid, params[])
{

    if(isnull(params))
        return Usage(playerid, "/(s)hout [shout text] /ds for in the door");

	if(GetPVarType(playerid, "Caps")) UpperToLower(params);
    if(strlen(params) > 64)
	{
        SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "%s shouts: %.64s ..", ReturnName(playerid), params);
        SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "...%s!", params[64]);
    }
    else
	{
        SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "%s shouts: %s!", ReturnName(playerid), params);
    }
	new flyingtext[128];
	format(flyingtext, sizeof(flyingtext), "%s!", params);
    SetPlayerChatBubble(playerid, flyingtext, COLOR_WHITE, 10.0, 10000);
	printf("[SHOUTS] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:b(playerid, params[])
{
    if(isnull(params))
        return Usage(playerid, "/b [local OOC]");

	UpperToLower(params);
	if(pData[playerid][pAdminDuty] == 1)
    {
		if(strlen(params) > 64)
		{
			SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %.64s ..", ReturnName(playerid), params);
            SendNearbyMessage(playerid, 20.0, COLOR_WHITE, ".. %s ))", params[64]);
		}
		else
        {
            SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %s ))", ReturnName(playerid), params);
            return 1;
        }
	}
	else
	{
		if(strlen(params) > 64)
		{
			SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "%s: (( %.64s ..", ReturnName(playerid), params);
            SendNearbyMessage(playerid, 20.0, COLOR_WHITE, ".. %s ))", params[64]);
		}
		else
        {
            SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "%s: (( %s ))", ReturnName(playerid), params);
            return 1;
        }
	}
	//printf("[OOC] %s(%d) : %s", pData[playerid][pName], playerid, params);
    return 1;
}

CMD:call(playerid, params[])
{
	new ph;
	if(pData[playerid][pPhone] == 0) return Error(playerid, "You dont have phone!");
	if(pData[playerid][pPhoneCredit] <= 0) return Error(playerid, "You dont have phone credits!");

	if(sscanf(params, "d", ph))
	{
		Usage(playerid, "/call [phone number] 933 - Taxi Call | 911 - SAPD Crime Call | 922 - SAMD Medic Call");
		foreach(new ii : Player)
		{
			if(pData[ii][pMechDuty] == 1)
			{
				SendClientMessageEx(playerid, COLOR_GREEN, "Mekanik Duty: %s | PH: [%d]", ReturnName(ii), pData[ii][pPhone]);
			}
		}
		return 1;
	}
	if(ph == 911)
	{
		if(pData[playerid][pCallTime] >= gettime())
			return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());

        Info(playerid, "911: "WHITE_E"You have reached the emergency crime.");
		Info(playerid, "911: "WHITE_E"How can I help you?");
		SetPVarInt(playerid, "911", 1);

		pData[playerid][pCallTime] = gettime() + 60;
	}
	if(ph == 922)
	{
		if(pData[playerid][pCallTime] >= gettime())
			return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());

		Info(playerid, "922: "WHITE_E"You have reached the emergency medical service.");
		Info(playerid, "922: "WHITE_E"How can I help you?");
		SetPVarInt(playerid, "922", 1);

		pData[playerid][pCallTime] = gettime() + 60;
	}
	if(ph == 933)
	{
		if(pData[playerid][pCallTime] >= gettime())
			return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());

		Info(playerid, "933: "WHITE_E"You have reached the taxi driver.");
		Info(playerid, "933: "WHITE_E"Describe Your Positions!");
		SetPVarInt(playerid, "933", 1);
	}
	if(ph == pData[playerid][pPhone]) return Error(playerid, "Nomor sedang sibuk!");
	foreach(new ii : Player)
	{
		if(pData[ii][pPhone] == ph)
		{
			if(pData[ii][IsLoggedIn] == false || !IsPlayerConnected(ii)) return Error(playerid, "This number is not actived!");

			if(pData[ii][pCall] == INVALID_PLAYER_ID)
			{
				pData[playerid][pCall] = ii;

				SendClientMessageEx(playerid, COLOR_YELLOW, "[CELLPHONE to %d] "WHITE_E"phone begins to ring, please wait for answer!", ph);
				SendClientMessageEx(ii, COLOR_YELLOW, "[CELLPHONE form %d] "WHITE_E"Your phonecell is ringing, type '/p' to answer it!", pData[playerid][pPhone]);
				PlayerPlaySound(playerid, 3600, 0,0,0);
				PlayerPlaySound(ii, 6003, 0,0,0);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
				SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s takes out a cellphone and calling someone.", ReturnName(playerid));
				return 1;
			}
			else
			{
				Error(playerid, "Nomor ini sedang sibuk.");
				return 1;
			}
		}
	}
	return 1;
}

CMD:p(playerid, params[])
{
	if(pData[playerid][pCall] != INVALID_PLAYER_ID)
		return Error(playerid, "Anda sudah sedang menelpon seseorang!");

	if(pData[playerid][pInjured] != 0)
		return Error(playerid, "You cant do that in this time.");

	foreach(new ii : Player)
	{
		if(playerid == pData[ii][pCall])
		{
			pData[ii][pPhoneCredit]--;

			pData[playerid][pCall] = ii;
			SendClientMessageEx(ii, COLOR_YELLOW, "[CELLPHONE] "WHITE_E"phone is connected, type '/hu' to stop!");
			SendClientMessageEx(playerid, COLOR_YELLOW, "[CELLPHONE] "WHITE_E"phone is connected, type '/hu' to stop!");
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
			SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s answers their cellphone.", ReturnName(playerid));
			return 1;
		}
	}
	return 1;
}

CMD:shareloc(playerid, params[])
{
    if(pData[playerid][pPhone] == 0) return Error(playerid, "You dont have phone!");

	new ph;
	if(sscanf(params, "d", ph))
	{
		Usage(playerid, "/shareloc [phone number]");
		return 1;
	}
	foreach(new ii : Player)
	{
		if(pData[ii][pPhone] == ph)
		{
			if(pData[ii][IsLoggedIn] == false || !IsPlayerConnected(ii) || pData[playerid][pPhoneOff] == 1) return Error(playerid, "This number is not actived!");

			Servers(playerid, "Send Your location to phone number  %d", ph);
			Info(ii, "Anda Dikirimi Lokasi Oleh Seseorang");

			SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s mengirimkan lokasinya kepada seseorang", ReturnName(playerid));

			new
				Float: X,
				Float: Y,
				Float: Z;

			GetPlayerPos(playerid, X, Y, Z);
			SetPlayerCheckpoint(ii, X, Y, Z, 5.0);
			return 1;
		}
	}
	return 1;
}

CMD:hu(playerid, params[])
{
	new caller = pData[playerid][pCall];
	if(IsPlayerConnected(caller) && caller != INVALID_PLAYER_ID)
	{
		pData[caller][pCall] = INVALID_PLAYER_ID;
		SetPlayerSpecialAction(caller, SPECIAL_ACTION_STOPUSECELLPHONE);
		SendNearbyMessage(caller, 20.0, COLOR_PURPLE, "* %s puts away their cellphone.", ReturnName(caller));

		SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s puts away their cellphone.", ReturnName(playerid));
		pData[playerid][pCall] = INVALID_PLAYER_ID;
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
	}
	return 1;
}

CMD:sms(playerid, params[])
{
	new ph, text[50];
	if(pData[playerid][pPhone] == 0) return Error(playerid, "You dont have phone!");
	if(pData[playerid][pPhoneCredit] <= 0) return Error(playerid, "You dont have phone credits!");
	if(pData[playerid][pInjured] != 0) return Error(playerid, "You cant do at this time.");

	if(sscanf(params, "ds[50]", ph, text))
        return Usage(playerid, "/sms [phone number] [message max 50 text]");

	foreach(new ii : Player)
	{
		if(pData[ii][pPhone] == ph)
		{
			if(ii == INVALID_PLAYER_ID || !IsPlayerConnected(ii)) return Error(playerid, "This number is not actived!");
			SendClientMessageEx(playerid, COLOR_YELLOW, "[SMS to %d]"WHITE_E" %s", ph, text);
			SendClientMessageEx(ii, COLOR_YELLOW, "[SMS from %d]"WHITE_E" %s", pData[playerid][pPhone], text);
			Info(ii, "Gunakan "LB_E"'@<text>' "WHITE_E"untuk membalas SMS!");
			PlayerPlaySound(ii, 6003, 0,0,0);
			pData[ii][pSMS] = pData[playerid][pPhone];

			pData[playerid][pPhoneCredit] -= 1;
			return 1;
		}
	}
	return 1;
}
CMD:setfreq(playerid, params[])
{
	if(pData[playerid][pWT] == 0)
		return Error(playerid, "You dont have walkie talkie!");

	new channel;
	if(sscanf(params, "d", channel))
		return Usage(playerid, "/setfreq [channel 1 - 1000]");

	if(pData[playerid][pTogWT] == 1) return Error(playerid, "Your walkie talkie is turned off.");
	if(channel == pData[playerid][pWT]) return Error(playerid, "You are already in this channel.");

	if(channel > 0 && channel <= 1000)
	{
		foreach(new i : Player)
		{
		    if(pData[i][pWT] == channel)
		    {
				SendClientMessageEx(i, COLOR_LIME, "[WT] "WHITE_E"%s has joined in to this channel!", ReturnName(playerid));
		    }
		}
		Info(playerid, "You have set your walkie talkie channel to "LIME_E"%d", channel);
		pData[playerid][pWT] = channel;
	}
	else
	{
		Error(playerid, "Invalid channel id! 1 - 1000");
	}
	return 1;
}


CMD:wt(playerid)
{
	if(pData[playerid][pWT] == 0)
		return Error(playerid, "You dont have walkie talkie!");

	if(pData[playerid][pUsingWT] == 0)
	{
		pData[playerid][pUsingWT] = 1;
		Info(playerid, "Turn on Walkie Talkie!");
		SetPlayerAttachedObject(playerid, 9, 2967, 1, 0.064000, 0.137000, -0.098000, 20.999000, -18.399000, -88.699000, 1.000000, 1.000000, 1.000000);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
	}
	else
	{
		pData[playerid][pUsingWT] = 0;
		Info(playerid, "Turn off Walkie Talkie!");
		if(IsPlayerAttachedObjectSlotUsed(playerid,9)) RemovePlayerAttachedObject(playerid,9);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	}
	return 1;
}


/*CMD:savestats(playerid, params[])
{
	UpdateWeapons(playerid);
	UpdatePlayerData(playerid);
	Info(playerid, "Your data have been saved!");
	return 1;
}*/

CMD:ads(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 2461.21, 2270.42, 91.67)) return Error(playerid, "You must in SANA Station!");
	//if(pData[playerid][pPhone] == 0) return Error(playerid, "You dont have phone!");
	if(GetPVarInt(playerid, "makead") > gettime())
        return Error(playerid, "Anda Sudah Membuat iklan beberapa menit yang lalu(Tunggulah beberapa saat lagi).");

	if(isnull(params))
	{
		Usage(playerid, "/ads [text] | 1 character pay $2");
		return 1;
	}
	if(strlen(params) >= 100 ) return Error(playerid, "Maximum character is 100 text." );
	new payout = strlen(params) * 500;
	if(GetPlayerMoney(playerid) < payout) return Error(playerid, "Not enough money.");

	GivePlayerMoneyEx(playerid, -payout);
	Server_AddMoney(payout);
	foreach(new ii : Player)
	{
		if(pData[ii][pTogAds] == 0)
		{
			SendClientMessageEx(ii, COLOR_GREEN, "[ADS] "YELLOW_E"%s.", params);
			SendClientMessageEx(ii, COLOR_GREEN, "Contact Info: ["RED_E"%s"GREEN_E"] Ph: ["RED_E"%d"GREEN_E"] Bank Rek: ["RED_E"%d"GREEN_E"]", pData[playerid][pName], pData[playerid][pPhone], pData[playerid][pBankRek]);
		}
	}
	SetPVarInt(playerid, "makead", gettime() + 300);
	return 1;
}

//------------------[ Bisnis and Buy Commands ]-------
CMD:buy(playerid, params[])
{
	//Kurir
	if(IsPlayerInRangeOfPoint(playerid, 3.5, 1654.9298,-1862.5781,13.5344))
	{
		if(pData[playerid][pJob] == 9 || pData[playerid][pJob2] == 9)
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				SetPlayerCheckpoint(playerid, 2787.4229,-2417.5588,13.6338, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("KurirStart", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Memuat Crate...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				GivePlayerMoneyEx(playerid, 500);
				SendClientMessage(playerid, COLOR_RIKO, "COURIER: {FFFFFF}You buying crate packet "LG_E"$5.00.");
			}
			else return Error(playerid, "You are not in vehicle trucker.");
		}
		else return Error(playerid, "You are not trucker job.");
	}
	//trucker product
	if(IsPlayerInRangeOfPoint(playerid, 3.5, -279.67, -2148.42, 28.54))
	{
		if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				new mstr[128];
				format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah product:\nProduct Stock: "GREEN_E"%d\n"WHITE_E"Product Price"GREEN_E"%s / item", Product, FormatMoney(ProductPrice));
				ShowPlayerDialog(playerid, DIALOG_PRODUCT, DIALOG_STYLE_INPUT, "Buy Product", mstr, "Buy", "Cancel");
			}
			else return Error(playerid, "You are not in vehicle trucker.");
		}
		else return Error(playerid, "You are not trucker job.");
	}
	if(IsPlayerInRangeOfPoint(playerid, 3.5, 336.70, 895.54, 20.40))
	{
		if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				new mstr[128];
				format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah liter gasoil:\nGasOil Stock: "GREEN_E"%d\n"WHITE_E"GasOil Price"GREEN_E"%s / liters", GasOil, FormatMoney(GasOilPrice));
				ShowPlayerDialog(playerid, DIALOG_GASOIL, DIALOG_STYLE_INPUT, "Buy GasOil", mstr, "Buy", "Cancel");
			}
			else return Error(playerid, "You are not in vehicle trucker.");
		}
		else return Error(playerid, "You are not trucker job.");
	}
	//spray
	if(IsPlayerInRangeOfPoint(playerid, 2.5, 1345.3302,-1763.2202,13.5992))
	{
		if(pData[playerid][pLevel] < 5)
			return Error(playerid, "You must level 5 to use this!");

		new String[900];
		format(String, sizeof(String), "Size\tPrice\n\
		"ORANGE_E"Small\t$70\n");
		format(String, sizeof(String), "%s"GREEN_E"Normal\t$120\n", String);
		format(String, sizeof(String), "%s"RED_E"Big\t$200\n", String);
		SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "[BOT]Radeetz says: %s apakah kamu ingin membeli spraycan?Silahkan dipilih.", ReturnName(playerid));
		ShowPlayerDialog(playerid, BUY_SPRAYCAN, DIALOG_STYLE_TABLIST_HEADERS, "Buy spray can", String, "Buy", "Close");
	}
	//Material
	if(IsPlayerInRangeOfPoint(playerid, 2.5, -258.54, -2189.92, 28.97))
	{
		if(pData[playerid][pMaterial] >= 500) return Error(playerid, "Anda sudah membawa 500 Material!");
		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah material:\nMaterial Stock: "GREEN_E"%d\n"WHITE_E"Material Price"GREEN_E"%s / item", Material, FormatMoney(MaterialPrice));
		ShowPlayerDialog(playerid, DIALOG_MATERIAL, DIALOG_STYLE_INPUT, "Buy Material", mstr, "Buy", "Cancel");
	}
	//Component
	if(IsPlayerInRangeOfPoint(playerid, 0.5, 315.07, 926.53, 20.46))
	{
	    {
			if(pData[playerid][pComponent] >= 500) return Error(playerid, "Anda sudah membawa 500 Component!");
			new mstr[128];
			format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah component:\nComponent Stock: "GREEN_E"%d\n"WHITE_E"Component Price"GREEN_E"%s / item", Component, FormatMoney(ComponentPrice));
			ShowPlayerDialog(playerid, DIALOG_COMPONENT, DIALOG_STYLE_INPUT, "Buy Component", mstr, "Buy", "Cancel");
		}
	}
	//Apotek
	if(IsPlayerInRangeOfPoint(playerid, 2.5, 1256.2795, -1281.5076, 1061.1492))
	{
		if(pData[playerid][pFaction] != 3)
			return Error(playerid, "Medical only!");

		new mstr[128];
		format(mstr, sizeof(mstr), "Product\tPrice\n\
		Medicine\t"GREEN_E"%s\n\
		Medkit\t"GREEN_E"%s\n\
		Bandage\t"GREEN_E"$100\n\
		", FormatMoney(MedicinePrice), FormatMoney(MedkitPrice));
		ShowPlayerDialog(playerid, DIALOG_APOTEK, DIALOG_STYLE_TABLIST_HEADERS, "Apotek", mstr, "Buy", "Cancel");
	}
	//Food and Seed
	if(IsPlayerInRangeOfPoint(playerid, 2.5, -381.44, -1426.13, 25.93))
	{
		new mstr[128];
		format(mstr, sizeof(mstr), "Product\tPrice\n\
		Food\t"GREEN_E"%s\n\
		Seed\t"GREEN_E"%s\n\
		", FormatMoney(FoodPrice), FormatMoney(SeedPrice));
		ShowPlayerDialog(playerid, DIALOG_FOOD, DIALOG_STYLE_TABLIST_HEADERS, "Food", mstr, "Buy", "Cancel");
	}
	//Drugs
	if(IsPlayerInRangeOfPoint(playerid, 2.5, -3811.65, 1313.72, 71.42))
	{
		if(pData[playerid][pMarijuana] >= 100) return Error(playerid, "Anda sudah membawa 100 kg Marijuana!");
		if(pData[playerid][pFamily] == -1) return Error(playerid, "Only for family member!");

		new mstr[128];
		format(mstr, sizeof(mstr), ""WHITE_E"Masukan jumlah marijuana:\nMarijuana Stock: "GREEN_E"%d\n"WHITE_E"Marijuana Price"GREEN_E"%s / item", Marijuana, FormatMoney(MarijuanaPrice));
		ShowPlayerDialog(playerid, DIALOG_DRUGS, DIALOG_STYLE_INPUT, "Buy Drugs", mstr, "Buy", "Cancel");
	}
	//Gym
	for(new a = 1; a < sizeof(GymPoint); a++)
	if(IsPlayerInRangeOfPoint(playerid, 5.0, GymPoint[a][bbPos][0], GymPoint[a][bbPos][1], GymPoint[a][bbPos][2]))
	{
		ShowPlayerDialog(playerid, DIALOG_GMENU, DIALOG_STYLE_LIST, "Gym Menu", "Gym Membership[16 Days]\nLearning Fight Style[$500,00]", "Select", "Back");
	}
	//Mods
	for(new aaa = 1; aaa < sizeof(ModsPoint); aaa++)
	if(IsPlayerInRangeOfPoint(playerid, 5.0, ModsPoint[aaa][ModsPos][0], ModsPoint[aaa][ModsPos][1], ModsPoint[aaa][ModsPos][2]))
	{
		ShowPlayerDialog(playerid, DIALOG_MMENU, DIALOG_STYLE_LIST, "Vehicle Modshop", "Purchase Vehicle Toys\nPurchase Vehicle Parachute", "Select", "Back");
	}
	//Buy House
	foreach(new hid : Houses)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
		{
			if(hData[hid][hPrice] > GetPlayerMoney(playerid)) return Error(playerid, "Not enough money, you can't afford this houses.");
			if(strcmp(hData[hid][hOwner], "-")) return Error(playerid, "Someone already owns this house.");
			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 2) return Error(playerid, "You can't buy any more houses.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 3) return Error(playerid, "You can't buy any more houses.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 4) return Error(playerid, "You can't buy any more houses.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(Player_HouseCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more houses.");
				#endif
			}
			GivePlayerMoneyEx(playerid, -hData[hid][hPrice]);
			Server_AddMoney(hData[hid][hPrice]);
			GetPlayerName(playerid, hData[hid][hOwner], MAX_PLAYER_NAME);
			hData[hid][hVisit] = gettime();

			House_Refresh(hid);
			House_Save(hid);
		}
	}
	//Buy Bisnis
	foreach(new bid : Bisnis)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
		{
			if(pData[playerid][pLicBiz] <= 0)
				return Error(playerid, "Anda tidak memiliki License Business.");

			if(bData[bid][bPrice] > GetPlayerMoney(playerid)) return Error(playerid, "Not enough money, you can't afford this bisnis.");
			if(strcmp(bData[bid][bOwner], "-")) return Error(playerid, "Someone already owns this bisnis.");
			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 2) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 3) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 4) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			GivePlayerMoneyEx(playerid, -bData[bid][bPrice]);
			Server_AddMoney(-bData[bid][bPrice]);
			GetPlayerName(playerid, bData[bid][bOwner], MAX_PLAYER_NAME);
			bData[bid][bVisit] = gettime();

			Bisnis_Refresh(bid);
			Bisnis_Save(bid);
		}
	}
	//Buy Vending menu
	foreach(new vid : Vending)
    {
        if(IsPlayerInRangeOfPoint(playerid, 2.8, VendingData[vid][VendingPosX], VendingData[vid][VendingPosY], VendingData[vid][VendingPosZ]) && strcmp(VendingData[vid][VendingOwner], "-"))
        {
            VendingBuyMenu(playerid, vid);
        }
    }
	//Buy Bisnis menu
	if(pData[playerid][pInBiz] >= 0 && IsPlayerInRangeOfPoint(playerid, 2.5, bData[pData[playerid][pInBiz]][bPointX], bData[pData[playerid][pInBiz]][bPointY], bData[pData[playerid][pInBiz]][bPointZ]))
	{
		Bisnis_BuyMenu(playerid, pData[playerid][pInBiz]);
	}
	//Buy Workshop
	foreach(new wid : Workshop)
	{
		if(IsPlayerInRangeOfPoint(playerid, 10, wsData[wid][W_X_POS], wsData[wid][W_X_POS], wsData[wid][W_X_POS]))
		{
			if(wsData[wid][W_PRICE] > GetPlayerMoney(playerid)) return Error(playerid, "Not enough money, you can't afford this workshop.");
			if(strcmp(wsData[wid][W_OWNER], "-")) return Error(playerid, "Someone already owns this workshop.");

			#if LIMIT_PER_PLAYER > 0
			if(Player_WorkshopCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more workshop.");
			#endif

			GivePlayerMoneyEx(playerid, -wsData[wid][W_PRICE]);
			Server_AddMoney(-wsData[wid][W_PRICE]);
			GetPlayerName(playerid, wsData[wid][W_OWNER], MAX_PLAYER_NAME);

			Workshop_Refresh(wid);
			Workshop_Save(wid);
		}
	}
	return 1;
}


CMD:settwname(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
		return PermissionError(playerid);

	new tname[128], otherid, query[128];
	if(sscanf(params, "us[128]", otherid, tname))
	{
	    Usage(playerid, "/settwname <ID/Name> <twit name>");
	    return true;
	}

	mysql_format(g_SQL, query, sizeof(query), "SELECT tnames FROM players WHERE tnames='%s'", tname);
	mysql_tquery(g_SQL, query, "ChangeTwitName", "iis", otherid, playerid, tname);
	return 1;
}

function ChangeTwitName(otherplayer, playerid, nname[])
{
	if(cache_num_rows() > 0)
	{
		// Name Exists
		Error(playerid, "The name "DARK_E"'%s' "GREY_E"already exists in the database, please use a different name!", nname);
	}
	else
	{
		new query[512];
	    format(query, sizeof(query), "UPDATE players SET tnames='%e' WHERE reg_id=%d", nname, pData[otherplayer][pID]);
		mysql_tquery(g_SQL, query);
		format(pData[otherplayer][pTname], MAX_PLAYER_NAME, "%s", nname);
		Servers(playerid, "You has set twitter name %s to %s", pData[otherplayer][pName], nname);
	}
    return true;
}
function ChangeTwitUserName(otherplayer, nname[])
{
	if(cache_num_rows() > 0)
	{
		// Name Exists
		Error(otherplayer, "This Username "DARK_E"'%s' "GREY_E"already exists, please use a different name!", nname);
	}
	else
	{
		new query[512];
	    format(query, sizeof(query), "UPDATE players SET tnames='%e' WHERE reg_id=%d", nname, pData[otherplayer][pID]);
		mysql_tquery(g_SQL, query);
		format(pData[otherplayer][pTname], MAX_PLAYER_NAME, "%s", nname);
		Servers(otherplayer, "Your username account has changed to %s", nname);
		pData[otherplayer][pTweet] = 1;
	}
    return true;
}

function OnVehStarterpack(playerid, pid, model, color1, color2, cost, Float:x, Float:y, Float:z, Float:a)
{
	new i = Iter_Free(PVehicles);
	pvData[i][cID] = cache_insert_id();
	pvData[i][cOwner] = pid;
	pvData[i][cModel] = model;
	pvData[i][cColor1] = color1;
	pvData[i][cColor2] = color2;
	pvData[i][cPaintJob] = -1;
	pvData[i][cNeon] = 0;
	pvData[i][cTogNeon] = 0;
	pvData[i][cLocked] = 0;
	pvData[i][cInsu] = 3;
	pvData[i][cClaim] = 0;
	pvData[i][cClaimTime] = 0;
	pvData[i][cTicket] = 0;
	pvData[i][cPrice] = cost;
	pvData[i][cHealth] = 2000;
	pvData[i][cFuel] = 1000;
	format(pvData[i][cPlate], 16, "NoHave");
	pvData[i][cPlateTime] = 0;
	pvData[i][cPosX] = x;
	pvData[i][cPosY] = y;
	pvData[i][cPosZ] = z;
	pvData[i][cPosA] = a;
	pvData[i][cInt] = 0;
	pvData[i][cVw] = 0;
	pvData[i][cLumber] = -1;
	pvData[i][cMetal] = 0;
	pvData[i][cCoal] = 0;
	pvData[i][cProduct] = 0;
	pvData[i][cGasOil] = 0;
	pvData[i][cRent] = 0;
	for(new j = 0; j < 17; j++)
		pvData[i][cMod][j] = 0;
	Iter_Add(PVehicles, i);
	OnPlayerVehicleRespawn(i);
	Servers(playerid, "Anda telah menggclaim starterpack");
	//SetPlayerPosition(playerid, 1800.99, -1800.90, 13.54, 6.14, 0);
	pData[playerid][pBuyPvModel] = 0;
	SetPlayerPos(playerid, 1642.9381, -2322.6069, 13.3828);
	pData[playerid][pSpack] = 1;
	return 1;
}

//Open Toll
CMD:paytoll(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 40.3993, -1522.9064, 5.1910))
	{
		SetDynamicObjectRot(Tflint[0], 0.000000, 0.000000, 270.67565917969);
		GivePlayerMoneyEx(playerid, -50);
		GameTextForPlayer(playerid, "~w~Good~Y~Bye", 2000, 1);
		SendClientMessageEx(playerid, COLOR_LOGS, "GUARD: {FFFFFF}You Has Paid "GREEN_E"$0.50"WHITE_E" To open toll"RED_E" - Good Bye");
		SetTimer("F1CloseToll", 5500, 0);
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, 62.3336, -1540.1075, 5.0645))
	{
		SetDynamicObjectRot(Tflint[1], 0.000000, 0.000000, 87.337799072266);
		GivePlayerMoneyEx(playerid, -50);
		GameTextForPlayer(playerid, "~w~Good~Y~Bye", 2000, 1);
		SendClientMessageEx(playerid, COLOR_LOGS, "GUARD: {FFFFFF}You Has Paid "GREEN_E"$0.50"WHITE_E" To open toll"RED_E" - Good Bye");
		SetTimer("F2CloseToll", 5500, 0);
	}
	//LV toll
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1795.9447, 704.2550, 15.0006))
	{
		SetDynamicObjectRot(TollLv[1], 0.000000, 0.000000, 169.43664550781);
		GivePlayerMoneyEx(playerid, -50);
		GameTextForPlayer(playerid, "~w~Good~Y~Bye", 2000, 1);
		SendClientMessageEx(playerid, COLOR_LOGS, "GUARD: {FFFFFF}You Has Paid "GREEN_E"$0.50"WHITE_E" To open toll"RED_E" - Good Bye");
		SetTimer("LV1CloseToll", 5500, 0);
	}
	else if(IsPlayerInRangeOfPoint(playerid,  3.0, 1778.9886, 702.6728, 15.2574))
	{
		SetDynamicObjectRot(TollLv[0], 0.000000, 0.000000, 348.10229492188);
		GivePlayerMoneyEx(playerid, -50);
		GameTextForPlayer(playerid, "~w~Good~Y~Bye", 2000, 1);
		SendClientMessageEx(playerid, COLOR_LOGS, "GUARD: {FFFFFF}You Has Paid "GREEN_E"$0.50"WHITE_E" To open toll"RED_E" - Good Bye");
		SetTimer("LV2CloseToll", 5500, 0);
	}
	return 1;
}

CMD:claimstarterpack(playerid, params[])
{
    DisablePlayerCheckpoint(playerid);
	if(pData[playerid][pSpack]) return Error(playerid, "Anda Sudah Mengclaim Starterpack");
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1642.3374,-2326.3716,13.5469)) return Error(playerid, "Anda Harus Ada Di Point Claim Starterpack!");
    new vehicleid, count = 0, limit = MAX_PLAYER_VEHICLE + pData[playerid][pVip];
	foreach(new ii : PVehicles)
	{
		if(pvData[ii][cOwner] == pData[playerid][pID])
		count++;
	}
	if(count >= limit)
	{
		Error(playerid, "Slot kendaraan anda sudah penuh!");
		RemovePlayerFromVehicle(playerid);
		SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
		return 1;
	}
	SendStaffMessage(COLOR_RED, "* %s telah mengclaim starterpack.", pData[playerid][pName]);
	GivePlayerMoneyEx(playerid, 5000);
	new cQuery[1024];
	new Float:x,Float:y,Float:z, Float:a;
	new model, color1, color2;
	new cost = 3000;
	color1 = 1;
	color2 = 1;
	model = 462;
	x = 1641.7891;
	y = -2317.0781;
	z = 13.3842;
	a = 93.7660;
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "INSERT INTO `vehicle` (`owner`, `model`, `color1`, `color2`, `price`, `x`, `y`, `z`, `a`) VALUES (%d, %d, %d, %d, %d, '%f', '%f', '%f', '%f')", pData[playerid][pID], model, color1, color2, cost, x, y, z, a);

	mysql_tquery(g_SQL, cQuery, "OnVehStarterpack", "ddddddffff", playerid, pData[playerid][pID], model, color1, color2, cost, x, y, z, a);

	return 1;
}
CMD:clearchat(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
		if(pData[playerid][pHelper] < 2)
			return SCM(playerid, COLOR_YELLOW, "Use /cc");

	for(new i = 0; i < 20; i++)
	{
		SendClientMessageToAll(-1, "");
	}
	return 1;
}

CMD:cc(playerid, params[])
{
	for(new i = 0; i < 20; i++)
	{
		SendClientMessage(playerid, -1, "");
	}
	return 1;
}

CMD:saverp(playerid, params[])
{
	new saverp[70];
	if(sscanf(params, "s[70]", saverp))
		return Usage(playerid, "/saverp [action]");

	Info(playerid, "AutoRp Save : %s", saverp);

	//format(pData[playerid][pSavedRp], 70, saverp);
	pData[playerid][pSavedRp] = saverp;
	return 1;
}

CMD:rp(playerid)
{
	SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s %s", ReturnName(playerid), pData[playerid][pSavedRp]);
    return 1;
}
CMD:changelogs(playerid, params[])
{
	new fmt_str[1208];
 	format(fmt_str, sizeof(fmt_str), "{42A2DD}Changelogs %s:\n\n", TEXT_GAMEMODE);
	format(fmt_str, sizeof(fmt_str), "%s{FFFFFF}1.[Added] Dynamic Dealership\n", fmt_str);
	format(fmt_str, sizeof(fmt_str), "%s{FFFFFF}2.[Added] Vending Restock\n", fmt_str);
	format(fmt_str, sizeof(fmt_str), "%s{FFFFFF}3.[Added] Dollar Cent\n", fmt_str);
	format(fmt_str, sizeof(fmt_str), "%s{FFFFFF}4.[Added] Some Message In Join And ETC\n", fmt_str);
	format(fmt_str, sizeof(fmt_str), "%s{FFFFFF}5.[Improved] Some Salary,Mapping,ETC\n", fmt_str);
	/*format(fmt_str, sizeof(fmt_str), "%s{FFFFFF}6.[ADDED] Commands 'unsealbisnis' For SAGS\n", fmt_str);
	format(fmt_str, sizeof(fmt_str), "%s{FFFFFF}7.[IMPROVE] Tow vehicle System\n", fmt_str);*/
	format(fmt_str, sizeof(fmt_str), "%s"LB_E"\nMore Information Indoluck Join: "RED_E"https://discord.gg/indoluck\n", fmt_str);

	ShowPlayerDialog(playerid,DIALOG_CHANGELOGS,DIALOG_STYLE_MSGBOX, "Changelogs", fmt_str,"F.A.Q", "Close");

	return 1;
}
stock ShowFAQChangelogs(playerid)
{
    new String[10280];
	format(String, sizeof String, "Q: Apa Saja Yang Kami Tambahkan(1)\nA: Dealership, Vending\nQ:Apakah Ada Bug?\nA:Kami Memastikan Bahwa Tidak ada bug\nQ: Apakah Fitur Ini Menarik\nA: Kami Jamin Menarik Untuk Anda\nQ: Apa Yang Di Ubah\nA: Textdraw Server\nQ: Mappingan Apa Saja Yang Di Tambahkan\nA: Bank,Asgh,DLL\n\n"LB_E"For more information: {FFF000}https://discord.gg/indoluck");
	ShowPlayerDialog(playerid, INVALID_DIALOG_ID, DIALOG_STYLE_MSGBOX, "F.A.Q", String, "OK", "");
}
CMD:togtd(playerid, params[])
{
	new fmt_str[128];

    if(togtextdraws[playerid] == 0)
    {
        format(fmt_str, sizeof fmt_str,"{F6FE00}SERVER: {FFFFFF}Succesfuly Hide Textdraw.");
        SendClientMessage(playerid, -1, fmt_str);
        togtextdraws[playerid] = 1;
        TextDrawHideForPlayer(playerid, ServerName);
	 	TextDrawHideForPlayer(playerid, Cent[0]);
     	TextDrawHideForPlayer(playerid, Cent[1]);
 	 	TextDrawHideForPlayer(playerid, TDTime[0]);
	 	TextDrawHideForPlayer(playerid, TDTime[1]);
    }
    else if(togtextdraws[playerid] == 1)
    {
        format(fmt_str, sizeof fmt_str,"{F6FE00}SERVER: {FFFFFF}Succesfuly Show Textdraw.");
        SendClientMessage(playerid, -1, fmt_str);
        togtextdraws[playerid] = 0;
        TextDrawShowForPlayer(playerid, ServerName);
	 	TextDrawShowForPlayer(playerid, Cent[0]);
     	TextDrawShowForPlayer(playerid, Cent[1]);
 	 	TextDrawShowForPlayer(playerid, TDTime[0]);
	 	TextDrawShowForPlayer(playerid, TDTime[1]);
    }
    return 1;
}
