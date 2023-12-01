//======== DMV ===========
#define dmvpoint1 1147.0647,-1671.2949,13.7813 //6
#define dmvpoint2 1172.4202,-1784.3420,13.3984 //2
#define dmvpoint3 1298.0109,-1854.4442,13.3828 //3
#define dmvpoint4 1314.7808,-1643.6195,13.3828 //4
#define dmvpoint5 1355.0763,-1459.6536,13.3828 //5
#define dmvpoint6 1273.6854,-1394.2881,13.0970 //6
#define dmvpoint7 1193.8478,-1547.1124,13.3828 //6
#define dmvpoint8 1147.5975,-1605.9019,13.7813 //6
#define dmvpoint9 1148.2419,-1667.8373,13.7813

/*new DmvVeh;*/

AddDmvVehicle()
{
	DmvVeh[0] = AddStaticVehicleEx(426,1131.509,-1671.817,13.403,270.505, 1, 3, VEHICLE_RESPAWN);
	tmpobjid = CreateDynamicObject(19482,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(tmpobjid, 0, "{FF0000}DMV", 120, "Ariel", 50, 1, 0, 0, 1);
    AttachDynamicObjectToVehicle(tmpobjid, DmvVeh[0], 0.002, -1.732, 0.553, 0.000, -59.499, -88.300);
}
/*AddDmvVehicle()
{
	DmvVeh[0] = AddStaticVehicleEx(547, 1237.7479,-1835.3470,12.9585, 0.0000, 1, 1, VEHICLE_RESPAWN);
	DmvVeh[1] = AddStaticVehicleEx(547, 1242.8639,-1835.7610,12.9602, 0.0000, 1, 1, VEHICLE_RESPAWN);
	DmvVeh[2] = AddStaticVehicleEx(547, 1246.7274,-1835.7286,12.9598, 0.0000, 1, 1, VEHICLE_RESPAWN);
	DmvVeh[3] = AddStaticVehicleEx(574, 2029.251, -1824.943, 13.273, 0.0000, 1, 1, VEHICLE_RESPAWN);

}*/

IsADmvVeh(carid)
{
	for(new v = 0; v < sizeof(DmvVeh); v++) {
	    if(carid == DmvVeh[v]) return 1;
	}
	return 0;
}
