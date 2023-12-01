#define MAX_CAM 50
#define CamsLoop(%1) for(new %1 = 0; %1 < MAX_CAM; %1++)

enum    Cam
{
	Float: camX,
	Float: camY,
	Float: camZ,
	Float: camA,
	camID,
	AcSpeed,
	CamObj,
	Text3D: CamTul
};
new CamInfo[MAX_CAM][Cam],
	Iterator:Cem<MAX_CAM>;
new check[500];

function CheckPlayerMasukGak(playerid)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(IsPlayerInAnyVehicle(i))
	        {
	            format(check, sizeof check, "Speed Cam %.0f Mph", GetPlayerSpeed(i));
			}
		}
	}
	CamsLoop(p)
	{
		if(IsPlayerInRangeOfPoint(playerid, 15.0, CamInfo[p][camX], CamInfo[p][camY], CamInfo[p][camZ]))
		{
		    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		    {
			    new vehicleid = GetPlayerVehicleID(playerid);
	  			//new cok = GetPlayerSpeed(playerid);
	  			if(GetVehicleSpeed(vehicleid) > CamInfo[p][AcSpeed])
	  			{
	  			    //if(pData[playerid][pKenaTil] == 0)
	  			    {
						pData[playerid][pTicket] = 1;
						//pData[playerid][pKenaTil] = 1;
						SendClientMessage(playerid, -1, ""RED_E"[INFO]"BLUE_E" Anda Telah Melebihi Kecepatan Speed Camera, Anda Mendapatkan 1 Tilang");
						return 1;
					}
				}
			}
		}
	}
	return 1;
}
function LoadCem()
{
	new tid;
	
	new rows = cache_num_rows();
	if(rows)
	{
	    for(new i; i < rows; i++)
	    {
	        cache_get_value_name_int(i, "di", CamInfo[tid][ID]);
	        cache_get_value_name_int(i, "speed", CamInfo[tid][AcSpeed]);
	        cache_get_value_name_float(i, "camX", CamInfo[tid][camX]);
	        cache_get_value_name_float(i, "camY", CamInfo[tid][camY]);
	        cache_get_value_name_float(i, "camZ", CamInfo[tid][camZ]);
	        cache_get_value_name_float(i, "camA", CamInfo[tid][camA]);
	        
	        new label[64];
	        format(label, sizeof label, "SAPD {FFFFFF}Speedcam {FF0000}[ID %d]\n{FFFF00}Max Speed %d", tid, CamInfo[tid][AcSpeed]);
	        CamInfo[tid][CamObj] = CreateDynamicObject(18880, CamInfo[tid][camX], CamInfo[tid][camY], CamInfo[tid][camZ], 0.00000, 0.00000, CamInfo[tid][camA]);
	        CamInfo[tid][CamTul] = CreateDynamic3DTextLabel(label, COLOR_BLUE, CamInfo[tid][camX], CamInfo[tid][camY], CamInfo[tid][camZ] + 1.5, 5.0);
			Iter_Add(Cem, tid);
		}
		printf("SpeedCam : Loaded : %d", rows);
		print("p ah");
	}
}
Cem_Save(tid)
{
	new cQuery[5000];
	format(cQuery, sizeof cQuery, "UPDATE speedcam SET camX='%f', camY='%f', camZ='%f', camA='%f', speed='%d' WHERE di='%d'",
	CamInfo[tid][camX],
	CamInfo[tid][camY],
	CamInfo[tid][camZ],
	CamInfo[tid][camA],
	CamInfo[tid][AcSpeed],
	CamInfo[tid][ID]
	);
	return mysql_tquery(g_SQL, cQuery);
}
/*GetDeketCem(playerid, Float: range = 3.0)
{
	new id = -1, Float: dist = range, Float: tempdist;
	foreach(new i : Cem)
	{
	    tempdist = GetPlayerDistanceFromPoint(playerid, CamInfo[i][camX], CamInfo[i][camY], CamInfo[i][camZ]);
	    if(tempdist > range) continue;
		if(tempdist <= dist)
		{
			dist = tempdist;
			id = i;
		}
	}
	return id;
}*/
CMD:checkspeed(playerid, params[])
{
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "CheckSpeed", check, "", "Quit");
	return 1;
}
CMD:createspeedcam(playerid, params[])
{
	if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);

	new tid = Iter_Free(Cem), query[512];
	if(tid == -1) return Error(playerid, "Cams Has Reached The Max Number");
	new Float:x, Float:y, Float:z, Float:a;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);
	
	CamInfo[tid][camX] = x;
	CamInfo[tid][camY] = y;
	CamInfo[tid][camZ] = z;
	CamInfo[tid][camA] = a;
	CamInfo[tid][AcSpeed] = 1000;
	CamInfo[tid][ID] = tid;

	new label[96];
	format(label, sizeof label, "SAPD Speedcam ID %d\nMaks Speed %d", CamInfo[tid][ID], CamInfo[tid][AcSpeed]);
	CamInfo[tid][CamObj] = CreateDynamicObject(18880, CamInfo[tid][camX], CamInfo[tid][camY], CamInfo[tid][camZ]- 1.70, 0.00000, 0.00000, CamInfo[tid][camA]);
 	CamInfo[tid][CamTul] = CreateDynamic3DTextLabel(label, COLOR_BLUE, CamInfo[tid][camX], CamInfo[tid][camY], CamInfo[tid][camZ] + 1.5, 5.0);
	Iter_Add(Cem, tid);
	mysql_format(g_SQL, query, sizeof query, "INSERT INTO speedcam SET di='%d', camX='%f', camY='%f', camZ='%f', camA='%f', speed='%d'", CamInfo[tid][ID], CamInfo[tid][camX], CamInfo[tid][camY], CamInfo[tid][camZ], CamInfo[tid][camA], CamInfo[tid][AcSpeed]);
	mysql_tquery(g_SQL, query, "OnCreatedCams", "di", playerid, tid);
	return 1;
}
function OnCreatedCams(playerid, tid)
{
	Cem_Save(tid);
	Servers(playerid, "Cams Speed Created");
}
CMD:setspeedcam(playerid, params[])
{
    if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);
		
	new tid, speed, u[128];
	if(sscanf(params, "dd", tid, speed)) return Usage(playerid, "/setspeed [id cam] [speed]");
	
	DestroyDynamic3DTextLabel(CamInfo[tid][CamTul]);
	CamInfo[tid][AcSpeed] = speed;
	format(u, sizeof u, ""LB_E"INFO: "WHITE_E"Anda Merubah Limit Speed Camera ID %d Ke %d", tid, speed);
	SendClientMessage(playerid, -1, u);
	new label[96];
	format(label, sizeof label, "SAPD {FFFFFF}Speedcam {FF0000}[ID %d]\n{FFFF00}Max Speed %d", tid, CamInfo[tid][AcSpeed]);
	CamInfo[tid][CamTul] = CreateDynamic3DTextLabel(label, COLOR_BLUE, CamInfo[tid][camX], CamInfo[tid][camY], CamInfo[tid][camZ] + 1.5, 5.0);
    Cem_Save(tid);
	return 1;
}
CMD:deletespeedcam(playerid, params[])
{
    if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);

	new id, query[512];
	if(sscanf(params, "i", id)) return Usage(playerid, "/deletespeedcam [id]");
	if(!Iter_Contains(Cem, id)) return Error(playerid, "Invalid ID.");

	DestroyDynamicObject(CamInfo[id][CamObj]);
	DestroyDynamic3DTextLabel(CamInfo[id][CamTul]);

	CamInfo[id][camX] = CamInfo[id][camY] = CamInfo[id][camZ] = 0.0;
	CamInfo[id][CamObj] = -1;
	CamInfo[id][CamTul] = Text3D: -1;
	Iter_Remove(Cem, id);

	mysql_format(g_SQL, query, sizeof(query), "DELETE FROM speedcam WHERE id=%d", id);
	mysql_tquery(g_SQL, query);
	Servers(playerid, "Menghapus ID Speedcam %d.", id);
	return 1;
}
CMD:gotospeedcam(playerid, params[])
{
	new id;
	if(pData[playerid][pAdmin] < 3)
        return PermissionError(playerid);

	if(sscanf(params, "d", id))
		return Usage(playerid, "/gotospeedcam [id]");
	if(!Iter_Contains(Cem, id)) return Error(playerid, "SPEEDCAM ID tidak ada.");

	SetPlayerPosition(playerid, CamInfo[id][camX], CamInfo[id][camY], CamInfo[id][camZ], 2.0);
	Servers(playerid, "Teleport ke ID speedcam %d", id);
	return 1;
}
