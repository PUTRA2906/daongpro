//COMING NJENG GUA LAGI NYARI IDE NGENTOT
CreateDepositorJobPoint()
{
	//JOBS
	new strings[128];
	CreateDynamicPickup(1239, 23, 1395.7670, -20.6278, 1000.9771, -1);
	format(strings, sizeof(strings), "[DEPOSITOR]\n{FFFFFF}/getjob to join job");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 1395.7670, -20.6278, 1000.9771, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //Depositor
}

CreateLoadMoneyJobPoint()
{
	//JOBS
	new strings[128];
	CreateDynamicPickup(1239, 23, 1395.7670, -20.6278, 1000.9771, -1);
	format(strings, sizeof(strings), "[DEPOSITOR]\n{FFFFFF}/loadbankmoney to take bankmoney");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 1426.2611,-961.3810,36.3510, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //Depositor
}

function Depositor(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
	    if(pData[playerid][pActivityTime] >= 100)
	    {
	    	InfoTD_MSG(playerid, 8000, "Load BankMoney Done!");
	    	TogglePlayerControllable(playerid, 1);
	    	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pEnergy] -= 8;
			pData[playerid][pActivityTime] = 0;
			ClearAnimations(playerid);
	    	SetPVarInt(playerid, "Depositor", gettime() + 3000);
		}
 		else if(pData[playerid][pActivityTime] < 100)
		{
	    	pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
	    	PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
		}
	}
	return 1;
}

CMD:loadbankmoney(playerid, params[])
{
    new vehicleid = GetPlayerVehicleID(playerid), carid = -1;
	if(pData[playerid][pJob] == 9 || pData[playerid][pJob2] == 9)
	{
	    if(modelid != 609 && modelid != 498)
			return Error(playerid, "You must be inside a boxville.");
		if(IsPlayerInRangeOfPoint(playerid, 5.0, 1426.2611,-961.3810,36.3510))
		if(VehDepositor[vehicleid] > 5) return Error(playerid, "Bank Money is full in this vehicle.");
		{
 			if(GetPVarInt(playerid, "Depositor") > gettime())
				return Error(playerid, "Delays Load BankMoney, please wait.");
					
        pData[playerid][pActivity] = SetTimerEx("Depositor", 30, true, "i", playerid);
        
        PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Loadbankmoney...");
		PlayerTextDrawShow(playerid, ActiveTD[playerid]);
		ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
		TogglePlayerControllable(playerid, 0);
		
        if((carid = Vehicle_Nearest2(playerid)) != -1)
		{
			pvData[carid][cDepositor] += 5;
		}
	}
	else return Error(playerid, "You are not depositor jobs.");
	return 1;
}

CMD:takebankmoney(playerid, params[])
{
    new carid = -1;
	if(pData[playerid][pJob] == 9 || pData[playerid][pJob2] == 9)
	{
		new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
		if(vehicleid == INVALID_VEHICLE_ID) return Error(playerid, "You not in near any vehicles.");
		if(modelid != 609 && modelid != 498)
			return Error(playerid, "You must be inside a boxville.");

		if(VehDepositor[vehicleid] < 1) return Error(playerid, "Kamu Tidak Punya Uang Bank di kendaraan anda");
		pData[playerid][pDepositor] += 1;
  		if((carid = Vehicle_Nearest(playerid)) != -1)
		{
			if(IsValidVehicle(pvData[carid][cVeh]))
			{
				pvData[carid][cLumber] -= 1;
			}
		}
	}
    pData[playerid][pDepositor] += 1;
	else return Error(playerid, "You are not depositor jobs.");
	return 1;
}

CMD:atmdeposit(playerid, params[])
{
    new id = -1;
	id = GetClosestATM(playerid);
	new Float:x, Float:y, Float:z, String[100];
	GetPlayerPos(playerid, x, y, z);
	if(pData[playerid][pJob] == 9 || pData[playerid][pJob2] == 9)
	{
		if(id > -1)
		{
		    if(pData[playerid][pDepositor] < 0)
				return Error(playerid, "Kamu tidak mempunyai BankMoney di tas mu!.");
			pData[playerid][pDepositor] -= 1;
			pData[playerid][pJobTime] += 380;
			Server_AddMoney(656000);
			AddPlayerSalary(playerid, "Jobs(Depositor)", 8000);
			Info(playerid, "Kamu Telah Mendepositkan Uang Bank Sebesar "GREEN_E"$6,560.00.");
		}
	}
	else return Error(playerid, "You are not depositor jobs.");
	return 1;
}
