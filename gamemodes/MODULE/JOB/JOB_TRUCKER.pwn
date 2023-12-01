CreateJoinTruckPoint()
{
	//JOBS
	new strings[128];
	CreateDynamicPickup(1239, 23, -77.38, -1136.52, 1.07, -1);
	format(strings, sizeof(strings), "[TRUCKER JOBS]\n{ffffff}Jadilah Pekerja Trucker disini\n{7fffd4}/getjob /accept job");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -77.38, -1136.52, 1.07, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // truck
}

//Container CheckPoint
#define containerpoint1 -1733.8103,187.5354,3.5547
#define containerpoint2 2869.1934,917.6111,10.7500

//Vending
GetRestockVending()
{
	new tmpcount;
	foreach(new vid : Vending)
	{
	    if(VendingData[vid][VendingRestock] == 1)
	    {
     		tmpcount++;
		}
	}
	return tmpcount;
}

ReturnRestockVendingID(slot)
{
	new tmpcount;
	if(slot < 1 && slot > MAX_VENDING) return -1;
	foreach(new id : Vending)
	{
		if(VendingData[id][VendingRestock] == 1)
		{
			tmpcount++;
			if(tmpcount == slot)
			{
				return id;
			}
		}
	}
	return -1;
}

//Mission
GetRestockBisnis()
{
	new tmpcount;
	foreach(new id : Bisnis)
	{
	    if(bData[id][bRestock] == 1)
	    {
     		tmpcount++;
		}
	}
	return tmpcount;
}

ReturnRestockBisnisID(slot)
{
	new tmpcount;
	if(slot < 1 && slot > MAX_BISNIS) return -1;
	foreach(new id : Bisnis)
	{
	    if(bData[id][bRestock] == 1)
	    {
     		tmpcount++;
       		if(tmpcount == slot)
       		{
        		return id;
  			}
	    }
	}
	return -1;
}

//Dealership Hauling
GetRestockDealer()
{
	new tmpcount;
	foreach(new id : Dealer)
	{
	    if(DealerData[id][dealerRestock] == 1)
	    {
     		tmpcount++;
		}
	}
	return tmpcount;
}

ReturnRestockDealerID(slot)
{
	new tmpcount;
	if(slot < 1 && slot > MAX_DEALERSHIP) return -1;
	foreach(new id : Dealer)
	{
	    if(DealerData[id][dealerRestock] == 1)
	    {
     		tmpcount++;
       		if(tmpcount == slot)
       		{
        		return id;
  			}
	    }
	}
	return -1;
}

//Hauling
GetRestockGStation()
{
	new tmpcount;
	foreach(new id : GStation)
	{
	    if(gsData[id][gsStock] < 7000)
	    {
     		tmpcount++;
		}
	}
	return tmpcount;
}

ReturnRestockGStationID(slot)
{
	new tmpcount;
	if(slot < 1 && slot > MAX_GSTATION) return -1;
	foreach(new id : GStation)
	{
	    if(gsData[id][gsStock] < 7000)
	    {
     		tmpcount++;
       		if(tmpcount == slot)
       		{
        		return id;
  			}
	    }
	}
	return -1;
}

//Mission Commands
CMD:mission(playerid, params[])
{
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		if(GetRestockBisnis() <= 0) return Error(playerid, "Mission sedang kosong.");
		new id, count = GetRestockBisnis(), mission[128], type[32], lstr[512];
		
		strcat(mission,"No\tBusID\tBusType\tBusName\n",sizeof(mission));
		Loop(itt, (count + 1), 1)
		{
			id = ReturnRestockBisnisID(itt);
			if(bData[id][bType] == 1)
			{
				type= "Fast Food";
			}
			else if(bData[id][bType] == 2)
			{
				type= "Market";
			}
			else if(bData[id][bType] == 3)
			{
				type= "Clothes";
			}
			else if(bData[id][bType] == 4)
			{
				type= "Ammunation";
			}
			else if(bData[id][bType] == 5)
			{
				type= "Bar";
			}
			else
			{
				type= "Unknow";
			}
			if(itt == count)
			{
				format(lstr,sizeof(lstr), "%d\t%d\t%s\t%s\n", itt, id, type, bData[id][bName]);	
			}
			else format(lstr,sizeof(lstr), "%d\t%d\t%s\t%s\n", itt, id, type, bData[id][bName]);
			strcat(mission,lstr,sizeof(mission));
		}
		ShowPlayerDialog(playerid, DIALOG_RESTOCK, DIALOG_STYLE_TABLIST_HEADERS,"Mission",mission,"Start","Cancel");
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}

CMD:dealermission(playerid)
{
    if(pData[playerid][pLevel] < 5)
			return Error(playerid, "You must level 5 to use this!");
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
	    if(pData[playerid][pJobTime] > 0)
		{
	    	Error(playerid, "Anda harus menunggu "GREY2_E"%d "WHITE_E"detik lagi.", pData[playerid][pJobTime]);
	    	return 1;
		}
		if(GetRestockDealer() <= 0) return Error(playerid, "Dealership Mission sedang kosong.");
		new id, count = GetRestockDealer(), dealermission[128], type[32], lstr[512];

		strcat(dealermission,"No\tDealerID\tDealerType\tDealerName\n",sizeof(dealermission));
		Loop(itt, (count + 1), 1)
		{
			id = ReturnRestockDealerID(itt);
			if(DealerData[id][dealerType] == 1)
			{
				type= "Motorcycle";
			}
			else if(DealerData[id][dealerType] == 2)
			{
				type= "Cars";
			}
			else if(DealerData[id][dealerType] == 3)
			{
				type= "Unique Cars";
			}
			else if(DealerData[id][dealerType] == 4)
			{
				type= "Job Cars";
			}
			else if(DealerData[id][dealerType] == 5)
			{
				type= "Truck";
			}
			else
			{
				type= "Unknow";
			}
			if(itt == count)
			{
				format(lstr,sizeof(lstr), "%d\t%d\t%s\t%s\n", itt, id, type, DealerData[id][dealerName]);
			}
			else format(lstr,sizeof(lstr), "%d\t%d\t%s\t%s\n", itt, id, type, DealerData[id][dealerName]);
			strcat(dealermission,lstr,sizeof(dealermission));
		}
		ShowPlayerDialog(playerid, DIALOG_DEALER_RESTOCK, DIALOG_STYLE_TABLIST_HEADERS,"Dealer Mission",dealermission,"Start","Cancel");
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}

CMD:storestock(playerid, params[])
{
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		new vid = pData[playerid][pRestock], vehicleid = GetPlayerVehicleID(playerid), carid = -1, total, Float:percent, pay, convert;
		if(vid == -1) return Error(playerid, "You dont have restock mission.");
		if(IsPlayerInRangeOfPoint(playerid, 5.0, VendingData[vid][VendingPosX], VendingData[vid][VendingPosY], VendingData[vid][VendingPosZ]))
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && !IsATruck(vehicleid)) return Error(playerid, "Anda harus mengendarai truck.");
			if(VehProduct[vehicleid] < 1) return Error(playerid, "Product is empty in this vehicle.");
			total = VehProduct[vehicleid] * ProductPrice;
			percent = (total / 100) * 50;
			convert = floatround(percent, floatround_floor);
			pay = total + convert;
			VendingData[vid][VendingStock] += VehProduct[vehicleid];
			VendingData[vid][VendingMoney] -= pay;
			Info(playerid, "Anda menjual "RED_E"%d "WHITE_E"product dengan seharga "GREEN_E"%s", VehProduct[vehicleid], FormatMoney(pay));
			AddPlayerSalary(playerid, "Trucker(vending)", pay);
			if((carid = Vehicle_Nearest(playerid)) != -1)
			{
				pvData[carid][cProduct] = 0;
				Info(playerid, "Anda mendapatkan uang 20 percent dari hasil stock product anda.");
				VendingSave(vid);
				VendingRefresh(vid);
			}
			VehProduct[vehicleid] = 0;
			pData[playerid][pRestock] = -1;
		}
		else return Error(playerid, "Anda harus berada didekat dengan vending mission anda.");
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}

CMD:storeproduct(playerid, params[])
{
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		new bid = pData[playerid][pMission], vehicleid = GetPlayerVehicleID(playerid), carid = -1, total, Float:percent, pay, convert;
		if(bid == -1) return Error(playerid, "You dont have mission.");
		if(IsPlayerInRangeOfPoint(playerid, 4.8, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && !IsATruck(vehicleid)) return Error(playerid, "Anda harus mengendarai truck.");
			if(VehProduct[vehicleid] < 1) return Error(playerid, "Product is empty in this vehicle.");
			total = VehProduct[vehicleid] * ProductPrice;
			percent = (total / 100) * 250;
			convert = floatround(percent, floatround_floor);
			pay = total + convert;
			bData[bid][bProd] += VehProduct[vehicleid];
			bData[bid][bMoney] -= pay;
			Info(playerid, "Anda menjual "RED_E"%d "WHITE_E"product dengan seharga "GREEN_E"%s", VehProduct[vehicleid], FormatMoney(pay));
			AddPlayerSalary(playerid, "Trucker(Restock bisnis)", pay);
			if((carid = Vehicle_Nearest(playerid)) != -1)
			{
				pvData[carid][cProduct] = 0;
				Info(playerid, "Anda mendapatkan uang 20 percent dari hasil stock product anda.");
			}
			VehProduct[vehicleid] = 0;
			pData[playerid][pMission] = -1;
		}
		else return Error(playerid, "Anda harus berada didekat dengan bisnis mission anda.");
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}

CMD:storeveh(playerid, params[])
{
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		new bid = pData[playerid][pDealerMission], vehicleid = GetPlayerVehicleID(playerid);
		if(bid == -1) return Error(playerid, "You dont have dealermission.");
		if(IsPlayerInRangeOfPoint(playerid, 4.8, DealerData[bid][dealerPointX], DealerData[bid][dealerPointY], DealerData[bid][dealerPointZ]))
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && !IsATruck(vehicleid)) return Error(playerid, "Anda harus mengendarai truck.");
			DealerData[bid][dealerMoney] -= 500000;
			Info(playerid, "Anda merestock dealerhsip"WHITE_E"dan diberi imbalan uang "GREEN_E"$250.00");
			AddPlayerSalary(playerid, "Trucker(Restock Dealer)", 25000);
			pData[playerid][pDealerMission] = -1;
			DealerData[bid][dealerStock] += 5;
			pData[playerid][pJobTime] += 3600;
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
		}
		else return Error(playerid, "Anda harus berada didekat dengan point dealership.");
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}


//Hauling Commands
CMD:haulingmission(playerid)
{
    if(pData[playerid][pLevel] < 5)
			return Error(playerid, "You must level 5 to use this!");
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		if(pData[playerid][pJobTime] > 0)
		{
	    	Error(playerid, "Anda harus menunggu "GREY2_E"%d "WHITE_E"detik lagi.", pData[playerid][pJobTime]);
	    	return 1;
		}
		if(GetRestockGStation() <= 0) return Error(playerid, "Tidak ada gas station yang harus di restock.");
		new id, count = GetRestockGStation(), hauling[128], lstr[512];
		
		strcat(hauling,"No\tGas Station ID\tLocation\n",sizeof(hauling));
		Loop(itt, (count + 1), 1)
		{
			id = ReturnRestockGStationID(itt);
			if(itt == count)
			{
				format(lstr,sizeof(lstr), "%d\t%d\t%s\n", itt, id, GetLocation(gsData[id][gsPosX], gsData[id][gsPosY], gsData[id][gsPosZ]));	
			}
			else format(lstr,sizeof(lstr), "%d\t%d\t%s\n", itt, id, GetLocation(gsData[id][gsPosX], gsData[id][gsPosY], gsData[id][gsPosZ]));
			strcat(hauling,lstr,sizeof(hauling));
		}
		ShowPlayerDialog(playerid, DIALOG_HAULING, DIALOG_STYLE_TABLIST_HEADERS,"Hauling",hauling,"Start","Cancel");
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}

CMD:storegas(playerid, params[])
{
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		new id = pData[playerid][pHauling], vehicleid = GetPlayerVehicleID(playerid), carid = -1, total, Float:percent, pay, convert;
		if(id == -1) return Error(playerid, "You dont have hauling.");
		if(IsPlayerInRangeOfPoint(playerid, 3.5, gsData[id][gsPosX], gsData[id][gsPosY], gsData[id][gsPosZ]))
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && !IsATruck(vehicleid)) return Error(playerid, "Anda harus mengendarai truck.");
			if(VehGasOil[vehicleid] < 1) return Error(playerid, "GasOil is empty in this vehicle.");
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			total = VehGasOil[vehicleid] * GasOilPrice;
			percent = (total / 100) * 210;
			convert = floatround(percent, floatround_ceil);
			pay = total + convert;
			gsData[id][gsStock] += VehGasOil[vehicleid];
			Server_MinMoney(pay);
			Info(playerid, "Anda menjual "RED_E"%d "WHITE_E"liters gas oil dengan seharga "GREEN_E"%s", VehGasOil[vehicleid], FormatMoney(pay));
			AddPlayerSalary(playerid, "Trucker(Restock GasStation)", pay);
			pData[playerid][pJobTime] += 3600;
			if((carid = Vehicle_Nearest(playerid)) != -1)
			{
				pvData[carid][cGasOil] = 0;
				Info(playerid, "Anda mendapatkan uang 25 percent dari hasil stock liters gas oil anda.");
			}
			DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
			VehGasOil[vehicleid] = 0;
			pData[playerid][pHauling] = -1;
			GStation_Refresh(id);
			GStation_Save(id);
		}
		else return Error(playerid, "Anda harus berada didekat dengan Gas Oil hauling anda.");
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}
