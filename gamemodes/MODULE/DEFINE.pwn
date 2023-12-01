// Server Define
#define TEXT_GAMEMODE	"BremX"
#define SHOT_SERVER_NAME	"BremX"
#define TEXT_WEBURL		"discord.io/BremX"
#define TEXT_LANGUAGE	"Indonesia/English"

// MySQL configuration
#define		MYSQL_HOST 			"localhost"
#define		MYSQL_USER 			"root"
#define		MYSQL_PASSWORD 		""
#define		MYSQL_DATABASE 		"bremx"

// how many seconds until it kicks the player for taking too long to login
#define		SECONDS_TO_LOGIN 	200

// default spawn point: Las Venturas (The High Roller)
#define 	DEFAULT_POS_X 		1642.3384
#define 	DEFAULT_POS_Y 		-2333.7808
#define 	DEFAULT_POS_Z 		13.5469
#define 	DEFAULT_POS_A 		1.9585

//Android Client Check
//#define IsPlayerAndroid(%0)                 GetPVarInt(%0, "NotAndroid") == 0
//Movement Header
GetXYLeftOfPoint(Float:x,Float:y,&Float:x2,&Float:y2,Float:A,Float:distance)
{
	x2 = x - (distance * floatsin(-A-90.0,degrees));
	y2 = y - (distance * floatcos(-A-90.0,degrees));
}
GetXYRightOfPoint(Float:x,Float:y,&Float:x2,&Float:y2,Float:A,Float:distance)
{
	x2 = x - (distance * floatsin(-A+90.0,degrees));
	y2 = y - (distance * floatcos(-A+90.0,degrees));
}
GetXYInFrontOfPoint11(Float:x,Float:y,&Float:x2,&Float:y2,Float:A,Float:distance)
{
	x2 = x + (distance * floatsin(-A,degrees));
	y2 = y + (distance * floatcos(-A,degrees));
}
GetXYBehindPoint11(Float:x,Float:y,&Float:x2,&Float:y2,Float:A,Float:distance)
{
	x2 = x - (distance * floatsin(-A,degrees));
	y2 = y - (distance * floatcos(-A,degrees));
}

//Header tianmetal & Y_Less
#define SEM(%0,%1) SendClientMessage(%0,0xBFC0C200,%1) 					// SEM = Send Error Message by 	Myself
#define IsNull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))    // IsNull macro 			by 	Y_Less
//_________________________[ Variabel Define ]___________________________//

// Message
#define SCM SendClientMessage
#define function%0(%1) forward %0(%1); public %0(%1)
#define Servers(%1,%2) SendClientMessageEx(%1, -1, ""RIKO"SERVER: "WHITE_E""%2)
#define Info(%1,%2) SendClientMessageEx(%1, -1, ""RIKO"INFO: "WHITE_E""%2)
#define Usage(%1,%2) SendClientMessage(%1, -1, ""RIKO"USAGE: "WHITE_E""%2)
#define Error(%1,%2) SendClientMessageEx(%1, -1, ""RED_E"ERROR: "WHITE_E""%2)
#define PermissionError(%0) SendClientMessage(%0, COLOR_RED, "ERROR: "WHITE"You are not allowed to use this commands!")
#define SendMessage(%0,%1) \
	SendClientMessageEx(%0, COLOR_YELLOW, "»{FFFFFF} "%1)

#define PRESSED(%0) \
    (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

//Converter
#define minplus(%1) \
        (((%1) < 0) ? (-(%1)) : ((%1)))

// AntiCaps
#define UpperToLower(%1) for( new ToLowerChar; ToLowerChar < strlen( %1 ); ToLowerChar ++ ) if ( %1[ ToLowerChar ]> 64 && %1[ ToLowerChar ] < 91 ) %1[ ToLowerChar ] += 32

// Banneds
const BAN_MASK = (-1 << (32 - (/*this is the CIDR ip detection range [def: 26]*/26)));

//---------[ Define Faction ]-----
#define SAPD	1		//locker 1573.26, -1652.93, -40.59
#define	SAGS	2		// 1464.10, -1790.31, 2349.68
#define SAMD	3		// -1100.25, 1980.02, -58.91
#define SANEW	4		// 256.14, 1776.99, 701.08
//---------[ Define Job ]-----------
#define BOX_INDEX            9 // Index Box Barang
//mber
#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0) (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
