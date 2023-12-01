//Garage system
#define MAX_GARAGES	500

enum garageinfo
{
	Float:gPosX,
	Float:gPosY,
	Float:gPosZ,
	Float:gPosA,
	//Not Saved
	gPickup,
	gCP,
	Text3D:gLabel
};

new garageData[MAX_GARAGES][garageinfo],
	Iterator: Garages<MAX_GARAGES>;

Garage_Save(garageid)
{
	new cQuery[512];
	format(cQuery, sizeof(cQuery), "UPDATE garage SET posx='%f', posy='%f', posz='%f', posa='%f' WHERE id='%d'",
	garageData[garageid][gPosX],
	garageData[garageid][gPosY],
	garageData[garageid][gPosZ],
	garageData[garageid][gPosA],
	garageid
	);
	return mysql_tquery(g_SQL, cQuery);
}

function LoadGarages()
{
    static garageid;
	
	new rows = cache_num_rows();
 	if(rows)
  	{
		for(new i; i < rows; i++)
		{
			cache_get_value_name_int(i, "id", garageid);
			cache_get_value_name_float(i, "posx", garageData[garageid][gPosX]);
			cache_get_value_name_float(i, "posy", garageData[garageid][gPosY]);
			cache_get_value_name_float(i, "posz", garageData[garageid][gPosZ]);
			cache_get_value_name_float(i, "posa", garageData[garageid][gPosA]);
			GStation_Refresh(garageid);
			Iter_Add(Garages, garageid);
		}
		printf("[Dynamic Gas Station] Number of Loaded: %d.", rows);
	}
}

Garage_Refresh(garageid)
{
    if(garageid != -1)
    {
        if(IsValidDynamic3DTextLabel(garageData[garageid][gLabel]))
            DestroyDynamic3DTextLabel(garageData[garageid][gLabel]);

        if(IsValidDynamicPickup(garageData[garageid][gPickup]))
            DestroyDynamicPickup(garageData[garageid][gPickup]);

        static
        string[255];

        format(string, sizeof(string), "[GARAGES: %d]\n"WHITE_E"Use {FFFFF00}/parkveh, /pickupveh "WHITE_E"To parking vehicle ", garageid);
		garageData[garageid][gPickup] = CreateDynamicPickup(19134, 23, garageData[garageid][gPosX], garageData[garageid][gPosY], garageData[garageid][gPosZ]+0.2, -1, -1, -1, 5.0);
		garageData[garageid][gLabel] = CreateDynamic3DTextLabel(string, COLOR_RIKO, garageData[garageid][gPosX], garageData[garageid][gPosY], garageData[garageid][gPosZ]+0.5, 4.5);
    }
    return 1;
}

//========[GARAGE COMMAND]========
CMD:creategarage(playerid, params[])
{
	if(pData[playerid][pAdmin] < 6)
		return PermissionError(playerid);
	
	new garageid = Iter_Free(Garages), query[128];
	if(garageid == -1) return Error(playerid, "You cant create more garage!");
	
	GetPlayerPos(playerid, garageData[garageid][gPosX], garageData[garageid][gPosY], garageData[garageid][gPosZ], garageData[garageid][gPosA]);
    Garage_Refresh(garageid);
	Iter_Add(Garages, garageid);

	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO garage SET posx='%f', posy='%f', posz='%f', posa='%f' WHERE id='%d", garageid, garageData[garageid][gsStock], garageData[garageid][gsPosX], garageData[garageid][gsPosY], garageData[garageid][gsPosZ]);
	mysql_tquery(g_SQL, query, "OnGarageCreated", "i", garageid);
	return 1;
}

function OnGarageCreated(garageid)
{
	Garage_Save(garageid);
	return 1;
}

CMD:gotogarage(playerid, params[])
{
	new garageid;
	if(pData[playerid][pAdmin] < 2)
        return PermissionError(playerid);
		
	if(sscanf(params, "d", garageid))
		return Usage(playerid, "/gotogarage [id]");
		
	if(!Iter_Contains(Garages, garageid)) return Error(playerid, "The gs you specified ID of doesn't exist.");
	SetPlayerPosition(playerid, garageData[garageid][gPosX], garageData[garageid][gPosY], garageData[garageid][gPosZ], garageData[garageid][gPosA], 2.0);
    SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	pData[playerid][pInBiz] = -1;
	pData[playerid][pInDoor] = -1;
	pData[playerid][pInHouse] = -1;
	Servers(playerid, "You has teleport to garage id %d", garageid);
	return 1;
}

CMD:editgarage(playerid, params[])
{
    static
        garageid,
        type[24],
        string[128];

    if(pData[playerid][pAdmin] < 4)
        return PermissionError(playerid);

    if(sscanf(params, "ds[24]S()[128]", garageid, type, string))
    {
        Usage(playerid, "/editgarage [id] [name]");
        SendClientMessage(playerid, COLOR_YELLOW, "[NAMES]:{FFFFFF} location, delete");
        return 1;
    }
    if((garageid < 0 || garageid >= MAX_GARAGES))
        return Error(playerid, "You have specified an invalid garageid ID.");
	if(!Iter_Contains(Garages, garageid)) return Error(playerid, "The doors you specified ID of doesn't exist.");

    if(!strcmp(type, "location", true))
    {
		GetPlayerPos(playerid, garageData[garageid][gPosX], garageData[garageid][gPosY], garageData[garageid][gPosZ], garageData[garageid][gPosA]);
        Garage_Save(garageid);
		Garage_Refresh(garageid);

        SendAdminMessage(COLOR_RED, "%s has adjusted the location of garage ID: %d.", pData[playerid][pAdminname], garageid);
    }
    else if(!strcmp(type, "delete", true))
    {
		new query[128];
		DestroyDynamic3DTextLabel(garageData[garageid][gLabel]);
		DestroyDynamicPickup(garageData[garageid][gPickup]);
		garageData[garageid][gPosX] = 0;
		garageData[garageid][gPosY] = 0;
		garageData[garageid][gPosY] = 0;
		garageData[garageid][gPosA] = 0;
		garageData[garageid][gLabel] = Text3D: INVALID_3DTEXT_ID;
		garageData[garageid][gPickup] = -1;
		Iter_Remove(Garages, garageid);
		mysql_format(g_SQL, query, sizeof(query), "DELETE FROM garage WHERE id=%d", garageid);
		mysql_tquery(g_SQL, query);
        SendAdminMessage(COLOR_RED, "%s has delete garage ID: %d.", pData[playerid][pAdminname], garageid);
    }
    return 1;
}