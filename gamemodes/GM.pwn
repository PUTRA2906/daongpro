/*==========================================================================�        �===========================================================================================================
                                                                YOU NEVER KNOW IF YOU NEVER TRY!
                                                                 Fierro City Roleplay New Project
                                                                       fcrp2021�copyright!
                                                                           #COMEBACK!
===========================================================================�        �===========================================================================================================

											"CODING ITU BISA DI COPYPASTE TETAPI IDE TIDAK AKAN BISA." - Christian "Tianmetal" Malik.
Gamemode Author   	: SOIRP/Advanced Roleplay/Fierro
Team Scripting      : Radeetz & Aldick

Special Thanks To	:
					- Allah SWT (My God)
					- Families and Friends
					- Team Develover SOIRP
					- Team Develover Adv-Rp
*/

//---- [ Include ]----
#include <a_samp>
#include <sampvoice>
#undef MAX_PLAYERS
#define MAX_PLAYERS	500
#include <crashdetect.inc>
#include <gvar.inc>
#include <a_mysql.inc>
#include <a_actor.inc>
#include <a_zones.inc>
#include <CTime>
#include <discord-connector.inc>
#include <Dini>
#include <progress2.inc>
#include <Pawn.CMD.inc>
#include <mSelection.inc>
#include <TimestampToDate.inc>
#define ENABLE_3D_TRYG_YSI_SUPPORT
#include <streamer.inc>
#include <ColAndreas>
#include <3DTryg>
#include <VehPara>
#include <EVF2.inc>
#include <YSI\y_timers>
#include <YSI\y_iterate>
#include <sscanf2.inc>
#include <yom_buttons.inc>
#include <geoiplite.inc>
#include <garageblock.inc>
#include <timerfix.inc>
#include <discord-cmd>
#include <anti-cheat>

//-----[ Modular ]-----
#include "MODULE\DEFINE.pwn"
#include "MODULE\COLOR.pwn"
#include "MODULE\TEXTDRAW.pwn"
#define CONVERT_TIME_TO_SECONDS 	1
#define CONVERT_TIME_TO_MINUTES 	2
#define CONVERT_TIME_TO_HOURS 		3
#define CONVERT_TIME_TO_DAYS 		4
#define CONVERT_TIME_TO_MONTHS 		5
#define CONVERT_TIME_TO_YEARS 		6
//--- [ New Variable ] ----//
new DmvVeh[1];
//anti spam veh
new VehicleLastEnterTime[MAX_PLAYERS],
    Warning[MAX_PLAYERS];
//New GMX
new CurGMX;
//afk
new p_tick[MAX_PLAYERS],
    p_afktime[MAX_PLAYERS];
//Enum GMX
forward DoGMX();
//anti aimbot
new AimbotWarnings[MAX_PLAYERS];
//display online
new online;
//Mapping
//new tmpobjid;
new togtextdraws[MAX_PLAYERS];
new Text:txtAnimHelper;
// Player data
enum E_PLAYERS
{
	pID,
	pName[MAX_PLAYER_NAME],
	pAdminname[MAX_PLAYER_NAME],
	pIP[16],
	pPassword[65],
	pSalt[17],
	pEmail[40],
	pAdmin,
	pHelper,
	pLevel,
	pLevelUp,
	pVip,
	pVipTime,
	pGold,
	pRegDate[50],
	pLastLogin[50],
	pMoney,
	pBankMoney,
	pBankRek,
	//phone
	pContact,
	pPhone,
	pPhoneOff,
	pPhoneCredit,
	pPhoneBook,
	pSMS,
	pCall,
	pCallTime,
	//--
	pWT,
	pHours,
	pMinutes,
	pSeconds,
	pPaycheck,
	pSkin,
	pFacSkin,
	pGender,
	pAge[50],
	pInDoor,
	pInHouse,
	pInBiz,
	pInVending,
	pInDealer,
	Float: pPosX,
	Float: pPosY,
	Float: pPosZ,
	Float: pPosA,
	pInt,
	pWorld,
	Float:pHealth,
    Float:pArmour,
	pHunger,
	pBladder,
	pEnergy,
	pHungerTime,
	pEnergyTime,
	pBladderTime,
	pSick,
	pSickTime,
	pHospital,
	pHospitalTime,
	pInjured,
	pOnDuty,
	pOnDutyTime,
	pFaction,
	pFactionRank,
	pFactionLead,
	pTazer,
	pBroadcast,
	pNewsGuest,
	pFarm,
	pFarmRank,
	pFamily,
	pFamilyRank,
	pJail,
	pJailTime,
	pArrest,
	pArrestTime,
	pWarn,
	pJob,
	pJob2,
	pExitJob,
	pMedicine,
	pMedkit,
	pMask,
	pFightStyle,
	pGymVip,
	pFitnessTimer,
	pFitnessType,
	pSeatBelt,
	pHelmet,
	pSnack,
	pSprunk,
	pTrash,
	pBerry,
	pGas,
	pBandage,
	pGPS,
	pMaterial,
	pComponent,
	pFood,
	pFrozenPizza,
	pSeed,
	pPotato,
	pWheat,
	pOrange,
	pPrice1,
	pPrice2,
	pPrice3,
	pPrice4,
	pMarijuana,
	pPlant,
	pPlantTime,
	pFishTool,
	pWorm,
	pFish,
	pInFish,
	pIDCard,
	pIDCardTime,
	pLicBiz,
	pLicBizTime,
	pSkck,
	pSkckTime,
	pPenebangs,
	pPenebangsTime,
	pBpjs,
	pBpjsTime,
	pSpack,
	pDriveLic,
	pDriveLicTime,
	pSekolahSim,
	pBoatLic,
	pBoatLicTime,
	pFlyLic,
	pFlyLicTime,
	pGuns[13],
    pAmmo[13],
	pWeapon,
	pBoombox,
	//Not Save
	Cache:Cache_ID,
	bool: IsLoggedIn,
	LoginAttempts,
	LoginTimer,
	pSpawned,
	pAdminDuty,
	pFreezeTimer,
	pFreeze,
	pMaskID,
	pMaskOn,
	pSPY,
	pTname[MAX_PLAYER_NAME],
	pTweet,
	pTogTweet,
	pTogPM,
	pTogLog,
	pTogAds,
	pTogWT,
	pUsingWT,
	// Suspect
 	pSuspectTimer,
 	pSuspect,
	Text3D:pAdoTag,
	bool:pAdoActive,
	pFlare,
	bool:pFlareActive,
	pTrackCar,
	pBuyPvModel,
	pTrackHouse,
	pTrackBisnis,
	pFacInvite,
	pFacOffer,
	pFamInvite,
	pFamOffer,
	pFarmInvite,
	pFarmOffer,
	pFindEms,
	pCuffed,
	toySelected,
	TEditStatus,
	bool:PurchasedToy,
	pEditingItem,
	pProductModify,
	pEditingVendingItem,
	pVendingProductModify,
	pCurrSeconds,
	pCurrMinutes,
	pCurrHours,
	pSpec,
	playerSpectated,
	pInspectOffer,
	Float:pBodyCondition[6],
	pFriskOffer,
	pDragged,
	pDraggedBy,
	pDragTimer,
	pHBEMode,
	pTDMode,
	pHelmetOn,
	pReportTime,
	pAskTime,
	//Player Progress Bar
	PlayerBar:fuelbar,
	PlayerBar:damagebar,
	PlayerBar:hungrybar,
	PlayerBar:energybar,
	PlayerBar:BarHp,
	PlayerBar:BarArmour,
	PlayerBar:bladdybar,
	PlayerBar:spfuelbar,
	PlayerBar:spdamagebar,
	PlayerBar:sphungrybar,
	PlayerBar:spenergybar,
	PlayerBar:spbladdybar,
	PlayerBar:activitybar,
	pProducting,
	pCooking,
	pArmsDealer,
	pMechanic,
	pActivity,
	pActivityTime,
	//Delay sidejob
	pSweeperTime,
	pBusTime,
	pForkliftTime,
	pPizzaTime,
	//Jobs
	pSideJob,
	pSideJobTime,
	pJobTime,
	pGetJob,
	pGetJob2,
	pTaxiDuty,
	pTaxiTime,
	pFare,
	pFareTimer,
	pTotalFare,
	Float:pFareOldX,
	Float:pFareOldY,
	Float:pFareOldZ,
	Float:pFareNewX,
	Float:pFareNewY,
	Float:pFareNewZ,
	pMechDuty,
	pMechVeh,
	pMechColor1,
	pMechColor2,
	//ATM
	EditingATMID,
	//Graffity
	EditingGraffity,
	// Vending
	EditingVending,
	//Vehicle Toys
	EditingVtoys,
	//Limit Speed
	Float:pLimitSpeed,
	LimitSpeedTimer,
	pLsVehicle,
	//lumber job
	EditingTreeID,
	CuttingTreeID,
	bool:CarryingLumber,
	//Berry Farmers
	EditingBerryID,
	HarvestBerryID,
	//Miner job
	EditingOreID,
	MiningOreID,
	CarryingLog,
	LoadingPoint,
	//production
	CarryProduct,
	//trucker
	pMission,
	pDealerMission,
	pHauling,
	pRestock,
	//Farmer
	pHarvest,
	pHarvestID,
	pOffer,
	//Smuggler
	pSmugglerTimer,
	pPacket,
	//Bank
	pTransfer,
	pTransferRek,
	pTransferName[128],
	//Gas Station
	pFill,
	pFillTime,
	pFillPrice,
	//Gate
	gEditID,
	gEdit,
	//Workshop
	pWsEmplooye,
	pWsVeh,
	pWorkshop,
	//auto rp
	pSavedRp[70],
	//Skill
	pTruckSkill,
	pMechSkill,
	pSmuggSkill,
	//Vehicle Toys
	EditStatus,
	VehicleID
	//
};
new pData[MAX_PLAYERS][E_PLAYERS];

// MySQL connection handle
new MySQL: g_SQL;
new g_MysqlRaceCheck[MAX_PLAYERS];

enum    AsuKoe
{
	SKM
};
new Global[AsuKoe];

//DIALOG
enum
{
    //DEALER
	DIALOG_BUYJOBCARSVEHICLE,
	DIALOG_BUYDEALERCARS_CONFIRM,
	DIALOG_BUYTRUCKVEHICLE,
	DIALOG_BUYMOTORCYCLEVEHICLE,
	DIALOG_BUYUCARSVEHICLE,
	DIALOG_BUYCARSVEHICLE,
	DIALOG_DEALER_MANAGE,
	DIALOG_DEALER_VAULT,
	DIALOG_DEALER_WITHDRAW,
	DIALOG_DEALER_DEPOSIT,
	DIALOG_DEALER_NAME,
	DIALOG_DEALER_RESTOCK,
    //Vending
	DIALOG_VENDING_BUYPROD,
	DIALOG_VENDING_MANAGE,
	DIALOG_VENDING_NAME,
	DIALOG_VENDING_VAULT,
	DIALOG_VENDING_WITHDRAW,
	DIALOG_VENDING_DEPOSIT,
	DIALOG_VENDING_EDITPROD,
	DIALOG_VENDING_PRICESET,
	DIALOG_VENDING_RESTOCK,
	//workshop
	DIALOG_MY_WORKSHOP,
	WORKSHOP_INFO,
	//tes
	DIALOG_NGENTOD,
	DIALOG_CHANGELOGS,
	//---[ DIALOG PUBLIC ]---
	DIALOG_UNUSED,
    DIALOG_LOGIN,
    DIALOG_REGISTER,
    DIALOG_AGE,
	DIALOG_GENDER,
	DIALOG_EMAIL,
	DIALOG_PASSWORD,
	DIALOG_STATS,
	DIALOG_SETTINGS,
	DIALOG_HBEMODE,
	DIALOG_TDMODE,
	DIALOG_CHANGEAGE,
	//-----------------------
	DIALOG_GOLDSHOP,
	DIALOG_GOLDNAME,
	//---[ DIALOG BISNIS ]---
	DIALOG_SELL_BISNISS,
	DIALOG_SELL_BISNIS,
	DIALOG_SEALED,
	DIALOG_UNSEALED,
	DIALOG_MY_BISNIS,
	BISNIS_MENU,
	BISNIS_INFO,
	BISNIS_NAME,
	BISNIS_VAULT,
	BISNIS_WITHDRAW,
	BISNIS_DEPOSIT,
	BISNIS_BUYPROD,
	BISNIS_EDITPROD,
	BISNIS_PRICESET,
	BISNIS_SONG,
	BISNIS_PH,
	//--[Dialog Graffity]--
	DIALOG_WELCOME,
	DIALOG_SELECT,
	DIALOG_INPUTGRAFF,
	DIALOG_COLOR,
	DIALOG_HAPPY,
	DIALOG_LIST,
	BUY_SPRAYCAN,
	DIALOG_GOMENU,
	DIALOG_GDOBJECT,
	//---[ DIALOG HOUSE ]---
	DIALOG_SELL_HOUSES,
	DIALOG_SELL_HOUSE,
	DIALOG_MY_HOUSES,
	HOUSE_INFO,
	HOUSE_STORAGE,
	HOUSE_WEAPONS,
	HOUSE_MONEY,
	HOUSE_WITHDRAWMONEY,
	HOUSE_DEPOSITMONEY,
	//---[ DIALOG PRIVATE VEHICLE ]---
	DIALOG_FINDVEH,
	DIALOG_TRACKVEH,
	DIALOG_GOTOVEH,
	DIALOG_GETVEH,
	DIALOG_DELETEVEH,
	DIALOG_BUYPV,
	DIALOG_BUYVIPPV,
	DIALOG_BUYPLATE,
	DIALOG_BUYPVCP,
	DIALOG_BUYPVCP_BIKES,
	DIALOG_BUYPVCP_CARS,
	DIALOG_BUYPVCP_UCARS,
	DIALOG_BUYPVCP_JOBCARS,
	DIALOG_BUYPVCP_VIPCARS,
	DIALOG_BUYPVCP_CONFIRM,
	DIALOG_BUYPVS_CONFIRM,
	DIALOG_BUYBOAT_CONFIRM,
	DIALOG_BUYPVCP_VIPCONFIRM,
	DIALOG_RENT_JOBCARS,
	DIALOG_RENT_JOBCARSCONFIRM,
	//job
	LIST_JOB,
	//---[ DIALOG TOYS ]---
	//Vehicle Toys
	DIALOG_VTOY,
	DIALOG_VTOYBUY,
	DIALOG_VTOYEDIT,
	DIALOG_VTOYPOSX,
	DIALOG_VTOYPOSY,
	DIALOG_VTOYPOSZ,
	DIALOG_VTOYPOSRX,
	DIALOG_VTOYPOSRY,
	DIALOG_VTOYPOSRZ,
	VSELECT_POS,
	VTOYSET_VALUE,
	VTOYSET_COLOUR,
	VTOY_ACCEPT,
	//Player Toys
	DIALOG_TOY,
	DIALOG_TOYEDIT,
	DIALOG_TOYPOSISI,
	DIALOG_TOYPOSISIBUY,
	DIALOG_TOYBUY,
	DIALOG_TOYVIP,
	DIALOG_TOYPOSX,
	DIALOG_TOYPOSY,
	DIALOG_TOYPOSZ,
	DIALOG_TOYPOSRX,
	DIALOG_TOYPOSRY,
	DIALOG_TOYPOSRZ,
 	DIALOG_SCALEX,
 	DIALOG_SCALEY,
  	DIALOG_SCALEZ,
  	TSELECT_POS,
  	TOYSET_VALUE,
  	//butcher
  	D_WORK,
    D_WORK_INFO,
	//---[ DIALOG PLAYER ]---
	DIALOG_HELP,
	DIALOG_JOBHELP,
	DIALOG_GPS,
	DIALOG_GPS_FACTION,
	DIALOG_GPS_PROPERTY,
	DIALOG_GPS_PUBLIC,
	DIALOG_GPS_DEALERSHIP,
	DIALOG_FIND_DEALER,
	DIALOG_FIND_BISNIS,
	DIALOG_FIND_ATM,
	DIALOG_FIND_TREES,
	DIALOG_GPS_JOB,
	DIALOG_PAY,
	DIALOG_TAKEHAULING,
	DIALOG_DYNAMICLIST,
	//---[ DIALOG WEAPONS ]---
	DIALOG_EDITBONE,
	//---[ DIALOG FAMILY ]---
	FAMILY_SAFE,
	FAMILY_STORAGE,
	FAMILY_WEAPONS,
	FAMILY_MARIJUANA,
	FAMILY_WITHDRAWMARIJUANA,
	FAMILY_DEPOSITMARIJUANA,
	FAMILY_COMPONENT,
	FAMILY_WITHDRAWCOMPONENT,
	FAMILY_DEPOSITCOMPONENT,
	FAMILY_MATERIAL,
	FAMILY_WITHDRAWMATERIAL,
	FAMILY_DEPOSITMATERIAL,
	FAMILY_MONEY,
	FAMILY_WITHDRAWMONEY,
	FAMILY_DEPOSITMONEY,
	FAMILY_INFO,
	//---[ DIALOG OWN FARM ]---
	FARM_STORAGE,
	FARM_INFO,
	FARM_POTATO,
	FARM_WHEAT,
	FARM_ORANGE,
	FARM_MONEY,
	FARM_DEPOSITPOTATO,
	FARM_WITHDRAWPOTATO,
	FARM_DEPOSITWHEAT,
	FARM_WITHDRAWWHEAT,
	FARM_DEPOSITORANGE,
	FARM_WITHDRAWORANGE,
	FARM_DEPOSITMONEY,
	FARM_WITHDRAWMONEY,
	//---[ DIALOG FACTION ]---
	DIALOG_LOCKERSAPD,
	DIALOG_WEAPONSAPD,
	DIALOG_LOCKERSAGS,
	DIALOG_WEAPONSAGS,
	DIALOG_LOCKERSAMD,
	DIALOG_WEAPONSAMD,
	DIALOG_LOCKERSANEW,
	DIALOG_WEAPONSANEW,

	DIALOG_LOCKERVIP,
	//---[ DIALOG JOB ]---
	//MECH
	DIALOG_SERVICE,
	DIALOG_SERVICE_COLOR,
	DIALOG_SERVICE_COLOR2,
	DIALOG_SERVICE_PAINTJOB,
	DIALOG_SERVICE_WHEELS,
	DIALOG_SERVICE_SPOILER,
	DIALOG_SERVICE_HOODS,
	DIALOG_SERVICE_VENTS,
	DIALOG_SERVICE_LIGHTS,
	DIALOG_SERVICE_EXHAUSTS,
	DIALOG_SERVICE_FRONT_BUMPERS,
	DIALOG_SERVICE_REAR_BUMPERS,
	DIALOG_SERVICE_ROOFS,
	DIALOG_SERVICE_SIDE_SKIRTS,
	DIALOG_SERVICE_BULLBARS,
	DIALOG_SERVICE_NEON,
	//Trucker
	DIALOG_HAULING,
	DIALOG_RESTOCK,
	DIALOG_CONTAINER,

	//ARMS Dealer
	DIALOG_ARMS_GUN,

	//Farmer job
	DIALOG_PLANT,
	DIALOG_EDIT_PRICE,
	DIALOG_EDIT_PRICE1,
	DIALOG_EDIT_PRICE2,
	DIALOG_EDIT_PRICE3,
	DIALOG_EDIT_PRICE4,
	DIALOG_OFFER,
	//----[ Items ]-----
	DIALOG_MATERIAL,
	DIALOG_COMPONENT,
	DIALOG_DRUGS,
	DIALOG_FOOD,
	DIALOG_FOOD_BUY,
	DIALOG_SEED_BUY,
	DIALOG_PRODUCT,
	DIALOG_GASOIL,
	DIALOG_APOTEK,
	//Bank
	DIALOG_ATM,
	DIALOG_ATMWITHDRAW,
	DIALOG_BANK,
	DIALOG_BANKDEPOSIT,
	DIALOG_BANKWITHDRAW,
	DIALOG_BANKREKENING,
	DIALOG_BANKTRANSFER,
	DIALOG_BANKCONFIRM,
	DIALOG_BANKSUKSES,
	//ask
	DIALOG_ASKS,

	//reports
	DIALOG_REPORTS,
	DIALOG_SALARY,
	DIALOG_PAYCHECK,

	//Sidejob
	DIALOG_TRASH,
	DIALOG_PIZZA,
	DIALOG_SWEEPER,
	DIALOG_BUS,
	DIALOG_FORKLIFT,
	//hauling tr
	//DIALOG_CHAULINGTR,
	//DIALOG_BUYTRUCK_CONFIRM,
	//DIALOG_HAULINGTR,

	DIALOG_PB,

	//gym
	DIALOG_FSTYLE,
	DIALOG_GMENU,
	//mods
	DIALOG_MMENU,
	//box
	DIALOG_TDC,
	DIALOG_TDC_PLACE,

	//event
	DIALOG_TDM,

	//veh control
	DIALOG_VC,
	//startjob
	DIALOG_WORK,
	//Phone
	DIALOG_ENTERNUM,
	NEW_CONTACT,
	CONTACT_INFO,
	CONTACT,
	DIAL_NUMBER,
	TEXT_MESSAGE,
	SEND_TEXT,
	SHARE_LOC,
	MY_PHONE,
	TWEET_APP,
	WHATSAPP_APP,
	TWEET_SIGNUP,
	TWEET_CHANGENAME,
	TWEET_ACCEPT_CHANGENAME,
	DIALOG_TWEETMODE,
	PHONE_NOTIF,
	PHONE_APP,
	//trunk
	TRUNK_STORAGE,
	TRUNK_WEAPONS,
	TRUNK_MONEY,
	TRUNK_COMP,
	TRUNK_MATS,
	TRUNK_WITHDRAWMONEY,
	TRUNK_DEPOSITMONEY,
	TRUNK_WITHDRAWCOMP,
	TRUNK_DEPOSITCOMP,
	TRUNK_WITHDRAWMATS,
	TRUNK_DEPOSITMATS,
	//mech
	DIALOG_MECH_LEVEL,

	//MDC
	DIALOG_TRACK,
	DIALOG_TRACK_PH,

	DIALOG_INFO_BIS,
	DIALOG_INFO_HOUSE,

	//bb
	DIALOG_BOOMBOX,
	DIALOG_BOOMBOX1,
}
//---[New]---
//DISCORD BOT
new DCC_Channel:g_Discord_AndroVerifed;
new DCC_Channel:g_Discord_adslogs;
new DCC_Channel:g_Discord_PcVerived;
new DCC_Channel:g_Discord_Information;
new DCC_Channel:g_discord_botcmd;
new DCC_Channel:g_discord_twt;
new DCC_Channel:g_discord_logs;
new DCC_Channel:g_discord_admins;
new DCC_Channel:g_discord_ban;
new DCC_Channel:inchanel;
//TDM
new EventCreated = 0, EventStarted = 0, EventPrize = 500;
new Float: RedX, Float: RedY, Float: RedZ, EventInt, EventWorld;
new Float: BlueX, Float: BlueY, Float: BlueZ;
new EventHP = 100, EventArmour = 0, EventLocked = 0;
new EventWeapon1, EventWeapon2, EventWeapon3, EventWeapon4, EventWeapon5;
new BlueTeam = 0, RedTeam = 0;
new MaxRedTeam = 5, MaxBlueTeam = 5;
new IsAtEvent[MAX_PLAYERS];
//Digital Healt - Armour
new Text:DigiHP[MAX_PLAYERS];
new Text:DigiAP[MAX_PLAYERS];

new Text:Cent[2];

//OTHER
new kick_gTimer[MAX_PLAYERS];

//ROB
new InRob[MAX_PLAYERS];
//BUTCHER
new playerobject[MAX_PLAYERS][2];
new meatsp;
new StoreMeat[MAX_PLAYERS];

//PILOT
new WorkBucks = 5000;
//new Penality = -650;

#define PH_D        4834
new TakingPs[MAX_PLAYERS] = 2;
///////////////CHECKPOINTS || LANDING OR TAKING////////////
new Float:RandomCPs[][3] =
{
	{1678.4602,-2625.2407,13.1195},   //LS
	{-1275.9586,10.1346,15.5220},   //SF
	{1347.2815,1281.2484,12.1943}, //LV
	{394.8399,2509.7869,17.8583}  //Desert
};
new rands;
new rands2;

new cp[MAX_PLAYERS];

new Tflint[2];
new TollLv[2];
new pTollArea[4];
/////////VEHICLES || PLANES ////////////

new pilotvehs[9] =
{ 460, 511, 512, 513, 519, 553, 577, 592, 593 };

////////////////////////////////////////

//HAULING TRAILER
new bool:DialogHauling[10];
new TrailerHauling[MAX_PLAYERS];
new SedangHauling[MAX_PLAYERS];
new bool:DialogSaya[MAX_PLAYERS][10];

//[------ BACK FIRE ------]
enum ENUM_FIRE_INFO
{
	bool:fire_VALID,
	bool:fire_MIRROR,
	Float:fire_OFFSET_X,
	Float:fire_OFFSET_Y,
	Float:fire_OFFSET_Z,
	Float:fire_ROT_X,
	Float:fire_ROT_Y,
	Float:fire_ROT_Z
};
new FIRE_INFO[][ENUM_FIRE_INFO] =
{
	{true, false, 0.356599, -2.323499, -2.282700, 0.000000, 0.000000, 180.000000}, //400
	{true, false, 0.438600, -2.509499, -2.088700, 0.000000, 0.000000, 180.000000}, //401
	{true, true, 0.502600, -2.623499, -2.136700, 0.000000, 0.000000, 180.000000}, //402
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //403
	{true, false, 0.452600, -2.679299, -2.057499, 0.000000, 0.000000, 180.000000}, //404
	{true, false, 0.484899, -2.694099, -2.203500, 0.000000, 0.000000, 180.000000}, //405
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //406
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //407
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //408
	{true, false, 0.613099, -3.776700, -2.107199, 0.000000, 0.000000, 180.000000}, //409
	{true, false, 0.393799, -2.313999, -2.057199, 0.000000, 0.000000, 180.000000}, //410
	{true, true, 0.307799, -2.537999, -2.083199, 0.000000, 0.000000, 180.000000}, //411
	{true, false, 0.427300, -3.339999, -2.165199, 0.000000, 0.000000, 180.000000}, //412
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //413
	{true, false, 0.516099, -3.160899, -2.317199, 0.000000, 0.000000, 180.000000}, //414
	{true, true, 0.378100, -2.368799, -2.103199, 0.000000, 0.000000, 180.000000}, //415
	{true, false, 0.504199, -3.720499, -2.407199, 0.000000, 0.000000, 180.000000}, //416
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //417
	{true, false, 0.574599, -2.647899, -2.439199, 0.000000, 0.000000, 180.000000}, //418
	{true, false, 0.558099, -2.929099, -2.161200, 0.000000, 0.000000, 180.000000}, //419
	{true, false, 0.574100, -2.639099, -2.137199, 0.000000, 0.000000, 180.000000}, //420
	{true, false, 0.450100, -2.983999, -2.191200, 0.000000, 0.000000, 180.000000}, //421
	{true, false, 0.411700, -2.547899, -2.334000, 0.000000, 0.000000, 180.000000}, //422
	{true, false, -0.369800, -2.315999, -2.404000, 0.000000, 0.000000, 180.000000}, //423
	{true, true, 0.512099, -1.669300, -1.856099, 0.000000, 0.000000, 180.000000}, //424
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //425
	{true, false, 0.578000, -2.621899, -2.136100, 0.000000, 0.000000, 180.000000}, //426
	{true, false, 0.601499, -3.878599, -2.324200, 0.000000, 0.000000, 180.000000}, //427
	{true, false, 0.588999, -2.971599, -2.462199, 0.000000, 0.000000, 180.000000}, //428
	{true, true, 0.503000, -2.523599, -1.965199, 0.000000, 0.000000, 180.000000}, //429
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //430
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //431
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //432
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //433
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //434
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //435
	{true, false, 0.486999, -2.497599, -2.099299, 0.000000, 0.000000, 180.000000}, //436
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //437
	{true, false, 0.490399, -2.705899, -2.371700, 0.000000, 0.000000, 180.000000}, //438
	{true, true, 0.352400, -2.581899, -2.064399, 0.000000, 0.000000, 180.000000}, //439
	{true, false, 0.420700, -2.677599, -2.570899, 0.000000, 0.000000, 180.000000}, //440
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //441
	{true, false, 0.593100, -2.798699, -2.205100, 0.000000, 0.000000, 180.000000}, //442
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //443
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //444
	{true, false, 0.480199, -2.714699, -2.147099, 0.000000, 0.000000, 180.000000}, //445
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //446
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //447
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //448
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //449
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //450
	{true, false, 0.005400, -2.552699, -1.987100, 0.000000, 0.000000, 180.000000}, //451
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //452
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //453
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //454
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //455
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //456
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //457
	{true, false, 0.519200, -2.790499, -2.229899, 0.000000, 0.000000, 180.000000}, //458
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //459
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //460
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //461
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //462
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //463
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //464
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //465
	{true, false, 0.435200, -2.877399, -2.125900, 0.000000, 0.000000, 180.000000}, //466
	{true, false, 0.481200, -2.917399, -2.097899, 0.000000, 0.000000, 180.000000}, //467
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //468
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //469
	{true, false, -1.250200, -2.029500, -0.472800, 0.000000, 0.000000, 180.000000}, //470
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //471
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //472
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //473
	{true, true, 0.584999, -2.822599, -2.209800, 0.000000, 0.000000, 180.000000}, //474
	{true, false, 0.481000, -2.595699, -2.113800, 0.000000, 0.000000, 180.000000}, //475
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //476
	{true, false, 0.587000, -2.805699, -2.071799, 0.000000, 0.000000, 180.000000}, //477
	{true, false, 0.416700, -2.568699, -2.196799, 0.000000, 0.000000, 180.000000}, //478
	{true, false, 0.460799, -2.865999, -2.082799, 0.000000, 0.000000, 180.000000}, //479
	{true, false, 0.483300, -2.409999, -2.163700, 0.000000, 0.000000, 180.000000}, //480
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //481
	{true, false, 0.445899, -2.641699, -2.439800, 0.000000, 0.000000, 180.000000}, //482
	{true, false, -0.340600, -2.846899, -2.512400, 0.000000, 0.000000, 180.000000}, //483
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //484
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //485
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //486
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //487
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //488
	{true, false, 0.446500, -2.771499, -2.240900, 0.000000, 0.000000, 180.000000}, //489
	{true, false, 0.439999, -3.227299, -2.240900, 0.000000, 0.000000, 180.000000}, //490
	{true, false, 0.572200, -2.925899, -2.166899, 0.000000, 0.000000, 180.000000}, //491
	{true, false, 0.579599, -2.606400, -2.116899, 0.000000, 0.000000, 180.000000}, //492
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //493
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //494
	{true, false, 0.596599, -2.335199, -2.332799, 0.000000, 0.000000, 180.000000}, //495
	{true, false, 0.545400, -2.173599, -2.111700, 0.000000, 0.000000, 180.000000}, //496
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //497
	{true, false, -0.473800, -3.108199, -2.361400, 0.000000, 0.000000, 180.000000}, //498
	{true, false, 0.516200, -3.340600, -2.287400, 0.000000, 0.000000, 180.000000}, //499
	{true, false, 0.446900, -1.940299, -2.245399, 0.000000, 0.000000, 180.000000}, //500
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //501
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //502
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //503
	{true, false, 0.430299, -2.876699, -2.117300, 0.000000, 0.000000, 180.000000}, //504
	{true, false, 0.446299, -2.772699, -2.236900, 0.000000, 0.000000, 180.000000}, //505
	{true, true, 0.560599, -2.476300, -2.120100, 0.000000, 0.000000, 180.000000}, //506
	{true, false, 0.485199, -2.971699, -2.262000, 0.000000, 0.000000, 180.000000}, //507
	{true, false, 0.467400, -3.586999, -2.686900, 0.000000, 0.000000, 180.000000}, //508
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //509
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //510
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //511
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //512
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //513
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //514
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //515
	{true, false, 0.447800, -2.946699, -2.141499, 0.000000, 0.000000, 180.000000}, //516
	{true, false, 0.501800, -2.858699, -2.119499, 0.000000, 0.000000, 180.000000}, //517
	{true, false, -0.423400, -2.882499, -2.091500, 0.000000, 0.000000, 180.000000}, //518
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //519
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //520
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //521
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //522
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //523
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //524
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //525
	{true, false, 0.481799, -2.314099, -2.129499, 0.000000, 0.000000, 180.000000}, //526
	{true, false, 0.471799, -2.298099, -1.999199, 0.000000, 0.000000, 180.000000}, //527
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //528
	{true, false, -0.424699, -2.729899, -2.011199, 0.000000, 0.000000, 180.000000}, //529
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //530
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //531
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //532
	{true, true, 0.515100, -2.452399, -2.037100, 0.000000, 0.000000, 180.000000}, //533
	{true, true, 0.483099, -2.958400, -2.167099, 0.000000, 0.000000, 180.000000}, //534
	{true, true, 0.350600, -2.693499, -2.189100, 0.000000, 0.000000, 180.000000}, //535
	{true, true, 0.500000, -2.971299, -2.161099, 0.000000, 0.000000, 180.000000}, //536
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //537
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //538
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //539
	{true, false, -0.410600, -2.748699, -2.265599, 0.000000, 0.000000, 180.000000}, //540
	{true, true, 0.624000, -2.205999, -1.875100, 0.000000, 0.000000, 180.000000}, //541
	{true, false, 0.587400, -2.829499, -1.996899, 0.000000, 0.000000, 180.000000}, //542
	{true, false, -0.411000, -2.764599, -2.099200, 0.000000, 0.000000, 180.000000}, //543
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //544
	{true, true, 0.314900, -2.263700, -2.260600, 0.000000, 0.000000, 180.000000}, //545
	{true, false, 0.581200, -2.833499, -2.020299, 0.000000, 0.000000, 180.000000}, //546
	{true, false, 0.629199, -2.589499, -2.074300, 0.000000, 0.000000, 180.000000}, //547
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //548
	{true, false, 0.441300, -2.511600, -2.030299, 0.000000, 0.000000, 180.000000}, //549
	{true, false, -0.628300, -2.899799, -2.267199, 0.000000, 0.000000, 180.000000}, //550
	{true, false, 0.590799, -3.145499, -2.092799, 0.000000, 0.000000, 180.000000}, //551
	{true, false, 0.446900, -3.063399, -1.924800, 0.000000, 0.000000, 180.000000}, //552
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //553
	{true, false, 0.559300, -2.751999, -2.208499, 0.000000, 0.000000, 180.000000}, //554
	{true, true, 0.136000, -2.282899, -2.003200, 0.000000, 0.000000, 180.000000}, //555
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //556
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //557
	{true, true, 0.465799, -2.558699, -1.977200, 0.000000, 0.000000, 180.000000}, //558
	{true, true, 0.633099, -2.394599, -1.977200, 0.000000, 0.000000, 180.000000}, //559
	{true, true, 0.479999, -2.474699, -1.991199, 0.000000, 0.000000, 180.000000}, //560
	{true, true, 0.446200, -2.739599, -2.166300, 0.000000, 0.000000, 180.000000}, //561
	{true, true, 0.483300, -2.380199, -2.037100, 0.000000, 0.000000, 180.000000}, //562
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //563
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //564
	{true, false, 0.479299, -2.134199, -1.999099, 0.000000, 0.000000, 180.000000}, //565
	{true, false, 0.564700, -2.946699, -2.063100, 0.000000, 0.000000, 180.000000}, //566
	{true, false, 0.628700, -2.776700, -2.252900, 0.000000, 0.000000, 180.000000}, //567
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //568
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //569
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //570
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //571
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //572
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //573
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //574
	{true, false, 0.453399, -2.709800, -1.975300, 0.000000, 0.000000, 180.000000}, //575
	{true, false, 0.658100, -3.092499, -2.043299, 0.000000, 0.000000, 180.000000}, //576
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //577
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //578
	{true, false, -0.424600, -2.890699, -2.102699, 0.000000, 0.000000, 180.000000}, //579
	{true, false, -0.408600, -2.872699, -2.092700, 0.000000, 0.000000, 180.000000}, //580
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //581
	{true, false, 0.444999, -3.395499, -2.334199, 0.000000, 0.000000, 180.000000}, //582
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //583
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //584
	{true, false, -0.428999, -3.143299, -1.889299, 0.000000, 0.000000, 180.000000}, //585
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //586
	{true, true, 0.698000, -2.692600, -2.056400, 0.000000, 0.000000, 180.000000}, //587
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //588
	{true, false, 0.583999, -2.358599, -1.965899, 0.000000, 0.000000, 180.000000}, //589
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //590
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //591
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //592
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //593
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //594
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //595
	{true, false, 0.577000, -2.622299, -2.138499, 0.000000, 0.000000, 180.000000}, //596
	{true, false, 0.577000, -2.622299, -2.138499, 0.000000, 0.000000, 180.000000}, //597
	{true, false, 0.595000, -2.678299, -2.002500, 0.000000, 0.000000, 180.000000}, //598
	{true, false, 0.440600, -2.773699, -2.239099, 0.000000, 0.000000, 180.000000}, //599
	{true, false, 0.442600, -2.763700, -2.054199, 0.000000, 0.000000, 180.000000}, //600
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //601
	{true, true, 0.560999, -2.523999, -2.200700, 0.000000, 0.000000, 180.000000}, //602
	{true, true, 0.587000, -2.661999, -2.192699, 0.000000, 0.000000, 180.000000}, //603
	{true, false, 0.425700, -2.877099, -2.124700, 0.000000, 0.000000, 180.000000}, //604
	{true, false, -0.411900, -2.767699, -2.098700, 0.000000, 0.000000, 180.000000}, //605
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //606
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //607
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //608
	{true, false, -0.477699, -3.106199, -2.359499, 0.000000, 0.000000, 180.000000}, //609
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000}, //610
	{false, false, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000} //611
};

new
	bool:Player_Fire_Enabled[MAX_PLAYERS],
	Player_Key_Sprint_Time[MAX_PLAYERS];
// Countdown
new Count = -1;
new countTimer;
new showCD[MAX_PLAYERS];
new CountText[5][5] =
{
	"~r~1",
	"~g~2",
	"~y~3",
	"~g~4",
	"~b~5"
};

// Server Uptime
new up_days,
	up_hours,
	up_minutes,
	up_seconds,
	WorldTime = 10,
	WorldWeather = 24;

//Model Selection
new SpawnMale = mS_INVALID_LISTID,
	SpawnFemale = mS_INVALID_LISTID,
	MaleSkins = mS_INVALID_LISTID,
	FemaleSkins = mS_INVALID_LISTID,
	VIPMaleSkins = mS_INVALID_LISTID,
	VIPFemaleSkins = mS_INVALID_LISTID,
	SAPDMale = mS_INVALID_LISTID,
	SAPDFemale = mS_INVALID_LISTID,
	SAPDWar = mS_INVALID_LISTID,
	SAGSMale = mS_INVALID_LISTID,
	SAGSFemale = mS_INVALID_LISTID,
	SAMDMale = mS_INVALID_LISTID,
	SAMDFemale = mS_INVALID_LISTID,
	SANEWMale = mS_INVALID_LISTID,
	SANEWFemale = mS_INVALID_LISTID,
	toyslist = mS_INVALID_LISTID,
	rentjoblist = mS_INVALID_LISTID,
	sportcar = mS_INVALID_LISTID,
	boatlist = mS_INVALID_LISTID,
	viptoyslist = mS_INVALID_LISTID,
	vtoylist = mS_INVALID_LISTID;


// Faction Vehicle
#define VEHICLE_RESPAWN 7200

new SAPDVehicles[30],
	SAGSVehicles[30],
	SAMDVehicles[30],
	SANAVehicles[30];

//flash for pd
#define flashtime 115
new Flash[MAX_VEHICLES];
new FlashTime[MAX_VEHICLES];

// Faction Vehicle
IsSAPDCar(carid)
{
	for(new v = 0; v < sizeof(SAPDVehicles); v++)
	{
	    if(carid == SAPDVehicles[v]) return 1;
	}
	return 0;
}

IsGovCar(carid)
{
	for(new v = 0; v < sizeof(SAGSVehicles); v++)
	{
	    if(carid == SAGSVehicles[v]) return 1;
	}
	return 0;
}

IsSAMDCar(carid)
{
	for(new v = 0; v < sizeof(SAMDVehicles); v++)
	{
	    if(carid == SAMDVehicles[v]) return 1;
	}
	return 0;
}

IsSANACar(carid)
{
	for(new v = 0; v < sizeof(SANAVehicles); v++)
	{
	    if(carid == SANAVehicles[v]) return 1;
	}
	return 0;
}

//Showroom Checkpoint
new ShowRoomS,
	ShowRoomCPRent;

new BoatDealer;

// Yom Button
new SAGSLobbyBtn[2],
	SAGSLobbyDoor,
	SAPDLobbyBtn[4],
	SAPDLobbyDoor[4],
	LLFLobbyBtn[2],
	LLFLobbyDoor;

new TogOOC = 1;

//----------[ Lumber Object Vehicle Job ]------------
#define MAX_LUMBERS 50
#define LUMBER_LIFETIME 100
#define LUMBER_LIMIT 10

enum    E_LUMBER
{
	// temp
	lumberDroppedBy[MAX_PLAYER_NAME],
	lumberSeconds,
	lumberObjID,
	lumberTimer,
	Text3D: lumberLabel
}
new LumberData[MAX_LUMBERS][E_LUMBER],
	Iterator:Lumbers<MAX_LUMBERS>;

new
	LumberObjects[MAX_VEHICLES][LUMBER_LIMIT];

new
	Float: LumberAttachOffsets[LUMBER_LIMIT][4] = {
	    {-0.223, -1.089, -0.230, -90.399},
		{-0.056, -1.091, -0.230, 90.399},
		{0.116, -1.092, -0.230, -90.399},
		{0.293, -1.088, -0.230, 90.399},
		{-0.123, -1.089, -0.099, -90.399},
		{0.043, -1.090, -0.099, 90.399},
		{0.216, -1.092, -0.099, -90.399},
		{-0.033, -1.090, 0.029, -90.399},
		{0.153, -1.089, 0.029, 90.399},
		{0.066, -1.091, 0.150, -90.399}
	};
new hydr[6];
enum E_HYDR_DATA
{
	H_NAME[120],
	Float: H_BAWAH[6],
	Float: H_ATAS[6],
};
new h_hydr[6][E_HYDR_DATA] =
{
	{"Hydraulic 1\nType {34C924}/Hydraulic {ffffff}Or {34C924}/DHydraulic", {2193.24243, -2199.99780, 10.96290,   0.00000, 0.00000, 44.40000}, {2193.24243, -2199.99780, 11.52890,   0.33300, 0.00000, 44.40000}},
	{"Hydraulic 2\nType {34C924}/Hydraulic {ffffff}Or {34C924}/DHydraulic", {2199.55225, -2193.81885, 10.96290,   0.00000, 0.00000, 44.40000}, {2199.55225, -2193.81885, 11.52890,   0.00000, 0.00000, 44.40000}},
	{"Hydraulic 3\nType {34C924}/Hydraulic {ffffff}Or {34C924}/DHydraulic", {2186.67017, -2206.51807, 10.96290,   0.00000, 0.00000, 44.04000}, {2186.67017, -2206.51807, 11.52890,   0.00000, 0.00000, 44.04000}},
	{"Hydraulic 4\nType {34C924}/Hydraulic {ffffff}Or {34C924}/DHydraulic", {2201.54321, -2237.80566, 10.88290,   0.00000, 0.00000, -136.98000}, {2201.49927, -2237.76465, 11.46490,   0.00000, 0.00000, -136.98000}},
	{"Hydraulic 5\nType {34C924}/Hydraulic {ffffff}Or {34C924}/DHydraulic", {2208.19092, -2231.78809, 10.86690,   0.00000, 0.00000, -136.98000}, {2208.19092, -2231.78809, 11.43290,   0.00000, 0.00000, -136.98000}},
	{"Hydraulic 6\nType {34C924}/Hydraulic {ffffff}Or {34C924}/DHydraulic", {2214.58667, -2225.68530, 10.85890,   0.00000, 0.00000, -136.98000}, {2214.59106, -2225.65747, 11.42490,   0.00000, 0.00000, -136.98000}}
};

//---- [ Function ]----//
stock FIXES_valstr(dest[], value, bool:pack = false)
{
    // format can't handle cellmin properly
    static const cellmin_value[] = !"-2147483648";

    if (value == cellmin)
        pack && strpack(dest, cellmin_value, 12) || strunpack(dest, cellmin_value, 12);
    else
        format(dest, 12, "%d", value) && pack && strpack(dest, dest, 12);
}
stock number_format(number)
{
	new i, string[15];
	FIXES_valstr(string, number);
	if(strfind(string, "-") != -1) i = strlen(string) - 4;
	else i = strlen(string) - 3;
	while (i >= 1)
 	{
		if(strfind(string, "-") != -1) strins(string, ",", i + 1);
		else strins(string, ",", i);
		i -= 3;
	}
	return string;
}
stock PlayerFacePlayer( playerid, targetplayerid )
{
	new Float: Angle;
	GetPlayerFacingAngle( playerid, Angle );
	SetPlayerFacingAngle( targetplayerid, Angle+180 );
	return true;
}

stock AutoBan(playernya)
{
   new ban_time = gettime() + (5 * 86400), query[512], PlayerIP[16], giveplayer[24];
   GetPlayerIp(playernya, PlayerIP, sizeof(PlayerIP));
   GetPlayerName(playernya, giveplayer, sizeof(giveplayer));

   SendClientMessageToAllEx(COLOR_BAN, "BotCmd: Player %s Has Been Banned Permanently", giveplayer);
   SendClientMessageToAllEx(COLOR_BAN, "Reason: Cheating ");

   mysql_format(g_SQL, query, sizeof(query), "INSERT INTO banneds(name, ip, admin, reason, ban_date, ban_expire) VALUES ('%s', '%s', 'Server Ban', 'Using Cheat!', %i, %d)", giveplayer, PlayerIP, gettime(), ban_time);
   mysql_tquery(g_SQL, query);
   KickEx(playernya);
}
stock SendMessageInChat(playerid, text[])
{
	new Float: x, Float: y, Float: z;
	new lstr[1024];

	GetPlayerPos(playerid, x, y, z);

	//UpperToLower(text);
	format(lstr, sizeof(lstr), "%s says: %s", ReturnName(playerid), text);
	ProxDetector(10, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
	SetPlayerChatBubble(playerid, text, COLOR_WHITE, 10.0, 3000);
	text[0] = toupper(text[0]);

	// if(!IsPlayerInAnyVehicle(playerid))
	// {
	// 	ApplyAnimation(playerid, "PED", "IDLE_chat", 4.100, 0, 1, 1, 1, 1, 1);
	// 	SetTimerEx("ClearPlayerAnim", strlen(text) * 400, false, "i", playerid);
	// }
	return 1;
}

//Butcher
stock GoObject(playerid)
{
    playerobject[playerid][0] = CreateDynamicObject(2806, 942.3492, 2131.815185, 1011.226501, 0.000000, 0.000000, 0.000000, playerid+1, -1, -1, 300.00, 300.00);
	if(random(2))
	{
	    SetPVarInt(playerid,"BadMeat",1);
		SetDynamicObjectMaterial(playerobject[playerid][0], 0, 5421, "laesmokecnthus", "greenwall4", 0x00000000);
	}
	else DeletePVar(playerid,"BadMeat");
	MoveDynamicObject(playerobject[playerid][0],942.3492, 2123.890380, 1011.226501,2);
	Streamer_SetIntData(STREAMER_TYPE_OBJECT,playerobject[playerid][0],E_STREAMER_EXTRA_ID,playerid);
	Streamer_Update(playerid);

	return 1;
}

stock RefreshDigiHealt(playerid)
{
    new Float:Health;
	new HealthNum[15];
	GetPlayerHealth(playerid, Health);
	format(HealthNum, sizeof(HealthNum), "%.0f", Health);
	TextDrawSetString(DigiHP[playerid], HealthNum);
	TextDrawShowForPlayer(playerid, DigiHP[playerid]);

    new Float:Armour;
	GetPlayerArmour(playerid, Armour);
	new ArmourNum[15];
    format(ArmourNum, 15, "%.0f", Armour);
	TextDrawSetString(DigiAP[playerid], ArmourNum);
	TextDrawShowForPlayer(playerid, DigiAP[playerid]);

	return 1;
}
stock RefreshHbec(playerid)
{
	PlayerTextDrawSetPreviewModel(playerid, HBEC[playerid], GetVehicleModel(GetPlayerVehicleID(playerid)));
	PlayerTextDrawShow(playerid, HBEC[playerid]);
    return 1;
}
stock RefreshDGHbec(playerid)
{
	PlayerTextDrawSetPreviewModel(playerid, DGHBEC[playerid], GetVehicleModel(GetPlayerVehicleID(playerid)));
	PlayerTextDrawShow(playerid, DGHBEC[playerid]);
    return 1;
}
stock FixedKick(playerid)
{
    KillTimer(kick_gTimer[playerid]);
    kick_gTimer[playerid] = SetTimerEx("DelayedKick", 1000, false, "i", playerid);
    return 1;
}
stock GiveMoneyRob(playerid, small, big)
{
	new money;
	new moneys[100];
	money = small+random(big);
	GivePlayerMoneyEx(playerid, money);
	format(moneys, sizeof moneys, "You have succesfull Robery, Getting : {00FF7F}$%s", FormatMoney(money));
	SendClientMessage(playerid, 0xFFFFFF00, moneys);
}
stock SendTweetMessage(color, String[])
{
	foreach(new i : Player)
	{
		if(pData[i][pTogTweet] == 0)
		{
			SendClientMessageEx(i, color, String);
		}
	}
	return 1;
}
function FitnessTime(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
		if(pData[playerid][pActivityTime] >= 100)
		{
			InfoTD_MSG(playerid, 8000, "Done!");
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pActivityTime] = 0;
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			pData[playerid][pEnergy] -= 3;
			UpFitStats(playerid, playerid);
			ClearAnimations(playerid);
			return 1;
		}
		else if(pData[playerid][pActivityTime] < 100)
		{
			pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
		}
	}
	return 1;
}
function SpawnTimer(playerid)
{
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, pData[playerid][pMoney]);
	SetPlayerScore(playerid, pData[playerid][pLevel]);
	SetPlayerHealth(playerid, pData[playerid][pHealth]);
	SetPlayerArmour(playerid, pData[playerid][pArmour]);
	pData[playerid][pSpawned] = 1;
	TogglePlayerControllable(playerid, 1);
	SetCameraBehindPlayer(playerid);
	AttachPlayerToys(playerid);
	SetWeapons(playerid);
	if(pData[playerid][pJail] > 0)
	{
		JailPlayer(playerid);
	}
	if(pData[playerid][pArrestTime] > 0)
	{
		SetPlayerArrest(playerid, pData[playerid][pArrest]);
	}
	return 1;
}
function SAGSLobbyDoorClose()
{
	MoveDynamicObject(SAGSLobbyDoor, 1389.375000, -25.387500, 999.978210, 3);
	return 1;
}

function SAPDLobbyDoorClose()
{
	MoveDynamicObject(SAPDLobbyDoor[0], 253.10965, 107.61060, 1002.21368, 3);
	MoveDynamicObject(SAPDLobbyDoor[1], 253.12556, 110.49657, 1002.21460, 3);
	MoveDynamicObject(SAPDLobbyDoor[2], 239.69435, 116.15908, 1002.21411, 3);
	MoveDynamicObject(SAPDLobbyDoor[3], 239.64050, 119.08750, 1002.21332, 3);
	return 1;
}

function LLFLobbyDoorClose()
{
	MoveDynamicObject(LLFLobbyDoor, -2119.21509, 657.54187, 1060.73560, 3);
	return 1;
}
function ForkliftTake(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
		if(pData[playerid][pActivityTime] >= 100)
		{
			InfoTD_MSG(playerid, 8000, "Done!");
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pActivityTime] = 0;
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			pData[playerid][pEnergy] -= 3;
			TogglePlayerControllable(playerid, 1);

			SetPVarInt(playerid, "box", CreateDynamicObject(2912,0,0,0,0,0,0));
			AttachDynamicObjectToVehicle(GetPVarInt(playerid, "box"), GetPlayerVehicleID(playerid), -0.10851, 0.62915, 0.87082, 0.0, 0.0, 0.0);
			return 1;
		}
		else if(pData[playerid][pActivityTime] < 100)
		{
			pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
		}
	}
	return 1;
}
function ContainerTake(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
		if(pData[playerid][pActivityTime] >= 100)
		{
			InfoTD_MSG(playerid, 8000, "Done!");
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pActivityTime] = 0;
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			pData[playerid][pEnergy] -= 5;
			TogglePlayerControllable(playerid, 1);

			SetPVarInt(playerid, "container", CreateDynamicObject(2935,0,0,0,0,0,0));
			AttachDynamicObjectToVehicle(GetPVarInt(playerid, "container"), GetPlayerVehicleID(playerid), 0.000, -1.009, 1.090, 0.000, 0.000, 0.000);
			return 1;
		}
		else if(pData[playerid][pActivityTime] < 100)
		{
			pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
		}
	}
	return 1;
}
function FillElectric(playerid)
{
	if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
		if(pData[playerid][pActivityTime] >= 100)
		{
			InfoTD_MSG(playerid, 8000, "Done!");
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pActivityTime] = 0;
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			pData[playerid][pEnergy] -= 3;
			TogglePlayerControllable(playerid, 1);

			return 1;
		}
		else if(pData[playerid][pActivityTime] < 100)
		{
			pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
		}
	}
	return 1;
}
function ForkliftDown(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
		if(pData[playerid][pActivityTime] >= 100)
		{
			InfoTD_MSG(playerid, 8000, "Done!");
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pActivityTime] = 0;
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			pData[playerid][pEnergy] -= 3;
			TogglePlayerControllable(playerid, 1);
			DestroyDynamicObject(GetPVarInt(playerid, "box"));
			return 1;
		}
		else if(pData[playerid][pActivityTime] < 100)
		{
			pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
		}
	}
	return 1;
}
function ContainerDown(playerid)
{
    if(!IsValidTimer(pData[playerid][pActivity])) return 0;
	{
		if(pData[playerid][pActivityTime] >= 100)
		{
			InfoTD_MSG(playerid, 8000, "Done!");
			KillTimer(pData[playerid][pActivity]);
			pData[playerid][pActivityTime] = 0;
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			pData[playerid][pEnergy] -= 5;
			TogglePlayerControllable(playerid, 1);
			DestroyDynamicObject(GetPVarInt(playerid, "container"));
			return 1;
		}
		else if(pData[playerid][pActivityTime] < 100)
		{
			pData[playerid][pActivityTime] += 5;
			SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
		}
	}
	return 1;
}
ServerLabels()
{
	new strings[128];
	CreateDynamicPickup(1239, 23, 1252.8046,-1286.8199,1061.1492, -1);
	format(strings, sizeof(strings), "[TREATMENT]\n{FFFFFF}/treatment\nMenghilangkan Sakit atau Penglihatan Merah\nPrice: $250.00");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1252.8046,-1286.8199,1061.1492, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //Treatement

	CreateDynamicPickup(1239, 23, 2108.7407,-1785.5049,13.3868, -1);
	format(strings, sizeof(strings), "[PIZZA JOB]\n{FFFFFF}/getpizza\nAmbil pizza lalu Antarkan Kesetiap Rumah\nGunakan Motor Pizza");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 2108.7407,-1785.5049,13.3868, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //Pizza

	CreateDynamicPickup(1239, 23, 1642.3374,-2326.3716,13.5469, -1);
	format(strings, sizeof(strings), "[STARTERPACK]\n{FFFFFF}/claimsp\n Get starterpack");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1642.3374,-2326.3716,13.5469, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // ID Card

	CreateDynamicPickup(1239, 23, 1370.6390,717.5485,-15.7573, -1);
	format(strings, sizeof(strings), "[BPJS]\n{FFFFFF}/newbpjs\n mendapatkan BPJS");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1370.6390,717.5485,-15.7573, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bpjs

	CreateDynamicPickup(1239, 23, 1345.3302,-1763.2202,13.5992, -1);
	format(strings, sizeof(strings), "[Spray Tags]\n{FFFFFF}/buy");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1345.3302,-1763.2202,13.5992, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // tags

	CreateDynamicPickup(2912, 23, -383.0497,-1438.9336,26.3277, -1);
	format(strings, sizeof(strings), "[CARGO]\n{FFFFFF}/cargo sell\n sell cargo");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 2790.7275,-2417.8015,13.6329, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // ID Card

	CreateDynamicPickup(1239, 23, 1392.77, -22.25, 1000.97, -1);
	format(strings, sizeof(strings), "[City Hall]\n{FFFFFF}/newidcard - create new ID Card\n/newage - Change Birthday\n/sellhouse - sell your house\n/sellbisnis - sell your bisnis");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1392.77, -22.25, 1000.97, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // ID Card

	CreateDynamicPickup(1239, 23, -367.8806, 1635.2896, 999.2969, -1);
	format(strings, sizeof(strings), "[Veh Insurance]\n{FFFFFF}/buyinsu - buy insurance\n/claimpv - claim insurance\n/sellpv - sell vehicle");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -367.8806, 1635.2896, 999.2969, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Veh insurance

	CreateDynamicPickup(1239, 23, 1081.2939,-1696.7833,13.5469, -1);
	format(strings, sizeof(strings), "[License]\n{FFFFFF}/newdrivelic - create new license driving");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 1081.2939,-1696.7833,13.5469, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Driving Lic

	CreateDynamicPickup(1239, 23, 240.80, 112.95, 1003.21, -1);
	format(strings, sizeof(strings), "[Plate]\n{FFFFFF}/buyplate - create new plate");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 240.80, 112.95, 1003.21, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Plate

	CreateDynamicPickup(1239, 23, 246.45, 118.53, 1003.21, -1);
	format(strings, sizeof(strings), "[Ticket]\n{FFFFFF}/payticket - to pay ticket\n/paylimit - to payticket limitspeed");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 246.45, 118.53, 1003.21, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Ticket

	CreateDynamicPickup(1239, 23, 224.11, 118.50, 999.10, -1);
	format(strings, sizeof(strings), "[ARREST POINT]\n{FFFFFF}/arrest - arrest wanted player");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 224.11, 118.50, 999.10, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // arrest

	CreateDynamicPickup(1239, 23, 1142.38, -1330.74, 13.62, -1);
	format(strings, sizeof(strings), "[Hospital]\n{FFFFFF}/dropinjured");
	CreateDynamic3DTextLabel(strings, COLOR_PINK, 1142.38, -1330.74, 13.62, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // hospital

	CreateDynamicPickup(1239, 23, 2246.46, -1757.03, 1014.77, -1);
	format(strings, sizeof(strings), "[BANK]\n{FFFFFF}/newrek - create new rekening");
	CreateDynamic3DTextLabel(strings, COLOR_LOGS, 2246.46, -1757.03, 1014.77, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank

	CreateDynamicPickup(1239, 23, 2246.55, -1750.25, 1014.77, -1);
	format(strings, sizeof(strings), "[BANK]\n{FFFFFF}/bank - access rekening");
	CreateDynamic3DTextLabel(strings, COLOR_LOGS, 2246.55, -1750.25, 1014.77, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank

	CreateDynamicPickup(1239, 23, 2461.21, 2270.42, 91.67, -1);
	format(strings, sizeof(strings), "[Ads]\n{FFFFFF}/ads - public ads");
	CreateDynamic3DTextLabel(strings, COLOR_LOGS, 2461.21, 2270.42, 91.67, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // iklan

	CreateDynamicPickup(1239, 23, 1254.7303, -2059.5728, 59.5827, -1);
	format(strings, sizeof(strings), "[Payphone]\n{FFFFFF}/cu - $5");
	CreateDynamic3DTextLabel(strings, COLOR_LOGS, 1254.7303, -2059.5728,59.5827 , 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // cu

	CreateDynamicPickup(1239, 23, 1773.6583, -1015.3002, 23.9609, -1);
	format(strings, sizeof(strings), "[Payphone]\n{FFFFFF}/cu - $5");
	CreateDynamic3DTextLabel(strings, COLOR_LOGS, 1773.6583, -1015.3002, 23.9609 , 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // cu

	//meat
	CreateDynamicPickup(1239, 23, 942.3542, 2117.8999, 1011.0303, -1, -1, -1, 5.0);
	format(strings, sizeof(strings), "["YELLOW_E"Store Meat"WHITE_E"]\n"WHITE_E"You can store "LG_E"10"WHITE_E" meat\nand\nselect spoiled pieces\n\n"LB_E"/storemeat");
	CreateDynamic3DTextLabel(strings, COLOR_WHITE, 942.3542, 2117.8999, 1011.0303, 5.0);

	//Dynamic CP
	BoatDealer = CreateDynamicCP(131.4477,-1804.2656, 4.3699, 1.0, -1, -1, -1, 5.0);
	CreateDynamic3DTextLabel("Buy Boat", COLOR_GREEN, 131.4477,-1804.2656, 4.3699, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, -1);

	ShowRoomS = CreateDynamicCP(530.3839,-1292.3944,17.3201, 1.0, -1, -1, -1, 5.0);
	CreateDynamic3DTextLabel("Buy Vehicle", COLOR_GREEN, 530.3839,-1292.3944,17.3201, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, -1);

	ShowRoomCPRent = CreateDynamicCP(1259.1423, -1262.9587, 13.5234, 1.0, -1, -1, -1, 5.0);
	CreateDynamic3DTextLabel("Rental Vehicle\n"YELLOW_E"/unrentpv", COLOR_LBLUE, 1259.1423, -1262.9587, 13.5234, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, -1);
}

forward EnterDoor(playerid);
forward F1CloseToll(playerid);
forward F2CloseToll(playerid);
forward LV1CloseToll(playerid);
forward LV2CloseToll(playerid);
forward ClearPlayerAnim(playerid);
forward DCC_OnMessageCreate(DCC_Message:message);
forward DelayedKick(playerid);
forward FillTrash(id);

//Close Toll

public F1CloseToll(playerid)
{
	SetDynamicObjectRot(Tflint[0], 0.000000, -90.000000, 270.67565917969);
	return 1;
}
public F2CloseToll(playerid)
{
	SetDynamicObjectRot(Tflint[1], 0.000000, -90.000000, 87.337799072266);
	return 1;
}
public LV1CloseToll(playerid)
{
	SetDynamicObjectRot(TollLv[0], 0.000000, -90.000000, 348.10229492188);
	return 1;
}
public LV2CloseToll(playerid)
{
	SetDynamicObjectRot(TollLv[1], 0.000000, -90.000000, 169.43664550781);
	return 1;
}
public ClearPlayerAnim(playerid)
{
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
}
public DCC_OnMessageCreate(DCC_Message:message)
{
	new realMsg[100], msg[128];
    DCC_GetMessageContent(message, realMsg, 100);
    new bool:IsBot;
    new DCC_Channel:channel;
 	DCC_GetMessageChannel(message, channel);
    new DCC_User:author;
	DCC_GetMessageAuthor(message, author);
    DCC_IsUserBot(author, IsBot);
    if(channel == g_Discord_AndroVerifed && !IsBot)
    {
    	new player[200];
    	format(player,sizeof(player),"Whitelist/%s.txt",realMsg);
    	{
			if(!dini_Exists(player))
  			{
      			dini_Create(player);
    			format(msg, sizeof(msg), "**Account: %s Akun telah diverifikasi ke database**",realMsg);
    			DCC_SendChannelMessage(g_Discord_AndroVerifed, msg);
			}
  			else
    		{
    			format(msg, sizeof(msg), "Akun ini Sudah **diverifikasi tadi!**");
    			DCC_SendChannelMessage(g_Discord_AndroVerifed, msg);
      		}
   		}
    }
    if(channel == g_Discord_PcVerived && !IsBot)
    {
    	new player[200];
    	format(player,sizeof(player),"pc/%s.txt",realMsg);
    	{
			if(!dini_Exists(player))
  			{
      			dini_Create(player);
    			format(msg, sizeof(msg), "Account: %s **Akun telah diverifikasi ke database**", realMsg);
    			DCC_SendChannelMessage(g_Discord_PcVerived, msg);
			}
  			else
    		{
    			format(msg, sizeof(msg), "**Akun ini Sudah diverifikasi tadi!**");
    			DCC_SendChannelMessage(g_Discord_PcVerived, msg);
      		}
   		}
	}
	if(channel == g_discord_botcmd && !IsBot) //!IsBot will block BOT's message in game
	{
        if(!strcmp(realMsg, "/players", true))
        {
        	format(msg, sizeof(msg), ":white_check_mark: **Jumlah Pemain Online Saat Ini: %d**", online);
	    	DCC_SendChannelMessage(g_discord_botcmd, msg);
	    }
	}
    return 1;
}

public DelayedKick(playerid)
{
    if (!IsPlayerConnected(playerid)) return 1;
    Kick(playerid);
    return 1;
}

//---------[ Ores miner Job Log ]-------
#define LOG_LIFETIME 100
#define LOG_LIMIT 10
#define MAX_LOG 100

enum    E_LOG
{
	// temp
	bool:logExist,
	logType,
	logDroppedBy[MAX_PLAYER_NAME],
	logSeconds,
	logObjID,
	logTimer,
	Text3D:logLabel
}
new LogData[MAX_LOG][E_LOG];

new
	LogStorage[MAX_VEHICLES][2];

//------[ Trucker ]--------

new VehProduct[MAX_VEHICLES];
new VehGasOil[MAX_VEHICLES];

//-----[ Include Modular ]-----
main()
{
	SetTimer("onlineTimer", 1000, true);
	SetTimer("TDUpdates", 10000, true);
	SetTimer_("OnMinuteTimer", 60000,0,-1);
	SetTimer_("OnSecondTimer", 1000, 0, -1);
	//SetTimer("AutoGmx", 28800000, true);
	//SetTimer("reloadpacket", 10000, true);
}
#include "MODULE\MODULAR.pwn"
#include "MODULE\ANIMS.pwn"
#include "MODULE\VOTE.pwn"
#include "MODULE\BERRY.pwn"
#include "MODULE\ACTOR.pwn"
#include "MODULE\QUIZ.pwn"
#include "MODULE\PRIVATE_VEHICLE.pwn"
#include "MODULE\VEHICLE_TOYS.pwn"
#include "MODULE\REPORT.pwn"
#include "MODULE\ASK.pwn"
#include "MODULE\WEAPON_ATTH.pwn"
#include "MODULE\TOYS.pwn"
#include "MODULE\GRAFITY.pwn"
#include "MODULE\PB.pwn"
#include "MODULE\PHONE.pwn"
#include "MODULE\HELMET.pwn"
#include "MODULE\SERVER.pwn"
#include "MODULE\DOOR.pwn"
#include "MODULE\FAMILY.pwn"
#include "MODULE\HOUSE.pwn"
#include "MODULE\BISNIS.pwn"

#include "MODULE\AUCTION.pwn"
#include "MODULE\FARM.pwn"
#include "MODULE\WORKSHOP.pwn"
#include "MODULE\MAPPING.pwn"
#include "MODULE\COBJECT.pwn"
#include "MODULE\GAS_STATION.pwn"
#include "MODULE\DYNAMIC_LOCKER.pwn"
#include "MODULE\NATIVE.pwn"
#include "MODULE\JOB\JOB_SWEEPER.pwn"
#include "MODULE\JOB\JOB_BUS.pwn"
#include "MODULE\JOB\JOB_PIZZA.pwn"
#include "MODULE\GYM.pwn"
#include "MODULE\MODSHOP.pwn"
#include "MODULE\JOB\JOB_FORKLIFT.pwn"
//#include "MODULE\JOB\JOB_HAULING.pwn"
#include "MODULE\JOB\JOB_BOX.pwn"
#include "MODULE\JOB\JOB_COURIER.pwn"
#include "MODULE\JOB\JOB_TRASHMASTER.pwn"
#include "MODULE\VOUCHER.pwn"
#include "MODULE\SALARY.pwn"
#include "MODULE\ATM.pwn"
#include "MODULE\DMV.pwn"
#include "MODULE\VENDING.pwn"
#include "MODULE\DEALER.pwn"
#include "MODULE\ARMS_DEALER.pwn"
#include "MODULE\GATE.pwn"
#include "MODULE\EVENT.pwn"
#include "MODULE\MDC.pwn"
#include "MODULE\JOB\JOB_TAXI.pwn"
#include "MODULE\JOB\JOB_MECH.pwn"
#include "MODULE\JOB\JOB_LUMBER.pwn"
#include "MODULE\JOB\JOB_MINER.pwn"
#include "MODULE\JOB\JOB_PRODUCTION.pwn"
#include "MODULE\JOB\JOB_TRUCKER.pwn"
#include "MODULE\JOB\JOB_FISH.pwn"
#include "MODULE\JOB\JOB_FARMER.pwn"
#include "MODULE\JOB\JOB_ELECTRIC.pwn"
#include "MODULE\JOB\JOB_DRUG_SMUGGLER.pwn"
#include "MODULE\CMD\ADMIN.pwn"
#include "MODULE\CMD\FACTION.pwn"
#include "MODULE\CMD\PLAYER.pwn"
#include "MODULE\CMD\DISCORD.pwn"
#include "MODULE\SAPD_TASER.pwn"
#include "MODULE\SAPD_SPIKE.pwn"
#include "MODULE\CONTACT.pwn"
#include "MODULE\VSTORAGE.pwn"
#include "MODULE\DIALOG.pwn"
#include "MODULE\CMD\ALIAS\ALIAS_ADMIN.pwn"
#include "MODULE\CMD\ALIAS\ALIAS_PLAYER.pwn"
#include "MODULE\CMD\ALIAS\ALIAS_BISNIS.pwn"
#include "MODULE\CMD\ALIAS\ALIAS_HOUSE.pwn"
#include "MODULE\CMD\ALIAS\ALIAS_PRIVATE_VEHICLE.pwn"
#include "MODULE\FUNCTION.pwn"
#include "MODULE\ROBBERY.pwn"
#include "MODULE\ANTIAIMBOT.pwn"
//#include "MODULE\SPEEDO.pwn"

function AutoGmx()
{
	SetTimer("GmxNya", 60000, true);
	SendClientMessageToAll(COLOR_RED, "[Auto Gmx]"WHITE_E" - Server akan otomatis restar dalam "RED_E"60"WHITE_E" detik");
	DCC_SendChannelMessage(g_Discord_Information, "```Server akan otomatis __Restar__ Dalam 60 detik```.");
	return 1;
}
function GmxNya()
{
	SendRconCommand("gmx");
}
public EnterDoor(playerid)
{
	if(IsPlayerConnected(playerid))
	foreach(new did : Doors)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
		{
			return 1;
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
		{
			return 1;
		}
	}
	return 0;
}

new const RandomMessage[5][144] = {
	""YELLOW_E"<!> "WHITE_E"Beli Gps di toko terdekat anda dan cari lah pekerjaan sesuai selera mu!.",
    ""YELLOW_E"<!> "WHITE_E"Gunakan '/help' untuk melihat berbagai command server!",
    ""RED_E"<!> "WHITE_E"Menemukan Masalah? Gunakan '/report' untuk melaporkannya - Happy Roleplay",
    ""LB_E"<!> "WHITE_E"Ingin Bertanya sesuatu? Gunakan '/ask'",
    ""LB_E"<!> "WHITE_E" Dapat Kan Informasi Lengkap Dengan Join Discord https://discord.io/BremX Share GM"

};

ptask RandoMessages[180000](playerid) {
  new rand = random(5);
  SendClientMessageEx(playerid, -1, "%s", RandomMessage[rand], online);
}

public OnGameModeInit()
{
	//mysql_log(ALL);

	new MySQLOpt: option_id = mysql_init_options();

	mysql_set_option(option_id, AUTO_RECONNECT, true);

	g_SQL = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE, option_id);
	if (g_SQL == MYSQL_INVALID_HANDLE || mysql_errno(g_SQL) != 0)
	{
		print("MySQL connection failed. Server is shutting down.");
		SendRconCommand("");
		return 1;
	}
	print("MySQL connection is successful.");

	mysql_tquery(g_SQL, "SELECT * FROM `server`", "LoadServer");
	mysql_tquery(g_SQL, "SELECT * FROM `doors`", "LoadDoors");
	mysql_tquery(g_SQL, "SELECT * FROM `familys`", "LoadFamilys");
	mysql_tquery(g_SQL, "SELECT * FROM `farm`", "LoadFarm");
	mysql_tquery(g_SQL, "SELECT * FROM `houses`", "LoadHouses");
	mysql_tquery(g_SQL, "SELECT * FROM `bisnis`", "LoadBisnis");
	mysql_tquery(g_SQL, "SELECT * FROM `workshop`", "LoadWorkshop");
	mysql_tquery(g_SQL, "SELECT * FROM `lockers`", "LoadLockers");
	mysql_tquery(g_SQL, "SELECT * FROM `gstations`", "LoadGStations");
	mysql_tquery(g_SQL, "SELECT * FROM `atms`", "LoadATM");
	mysql_tquery(g_SQL, "SELECT * FROM `gates`", "LoadGates");
	mysql_tquery(g_SQL, "SELECT * FROM `vouchers`", "LoadVouchers");
	mysql_tquery(g_SQL, "SELECT * FROM `trees`", "LoadTrees");
	mysql_tquery(g_SQL, "SELECT * FROM `ores`", "LoadOres");
	mysql_tquery(g_SQL, "SELECT * FROM `plants`", "LoadPlants");
	mysql_tquery(g_SQL, "SELECT * FROM `vending`", "LoadVending");
	mysql_tquery(g_SQL, "SELECT * FROM `dealership`", "LoadDealership");
	mysql_tquery(g_SQL, "SELECT * FROM `berry`", "LoadBerry");
	//--------
	new gm[32];
	format(gm, sizeof(gm), "%s", TEXT_GAMEMODE);
	SetGameModeText(gm);
	format(gm, sizeof(gm), "weburl %s", TEXT_WEBURL);
	SendRconCommand(gm);
	format(gm, sizeof(gm), "language %s", TEXT_LANGUAGE);
	SendRconCommand(gm);
	//new statuz[100];
 	//format(statuz,sizeof(statuz),"%d Players | %d MaxPlayers", online, GetMaxPlayers());
	//DCC_SetBotActivity(statuz);
	//---- [ Function ]----
	CreateTextDraw();
	CreateServerPoint();
	CreateJoinLumberPoint();
	CreateJoinTaxiPoint();
	CreateJoinMechPoint();
	CreateJoinMinerPoint();
	CreateJoinProductionPoint();
	CreateJoinTruckPoint();
	CreateArmsPoint();
	CreateJoinFarmerPoint();
	CreateJoinSmugglerPoint();
	CreateJoinKurirPoint();
	LoadTazerSAPD();
	//server
	ServerLabels();
	ServerVehicle();
	LoadFarm();
	//Sidejob Vehicle
	AddSweeperVehicle();
	AddPizzaVehicle();
	AddBusVehicle();
	AddForVehicle();
	AddTrashVehicle();
	AddKurirVehicle();
	//DMV Veh
	AddDmvVehicle();
	//map
	ObjectMapping();
	LoadObjects();
	LoadGym();
	LoadGYMObject();
	LoadModsPoint();
	LoadActors();
	//---
	SendRconCommand("mapname San Andreas");
	ManualVehicleEngineAndLights();
	EnableStuntBonusForAll(0);
	AllowInteriorWeapons(1);
	DisableInteriorEnterExits();
	LimitPlayerMarkerRadius(15.0);
	SetNameTagDrawDistance(20.0);

	ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
	SetWorldTime(WorldTime);
	SetWeather(WorldWeather);
	BlockGarages(.text=".");

	//Timer
	SetTimer("settime",1000,true);
	//SetTimer("CheckPlayers",1000,true);
	//_____-txtAnimHelper___/
	txtAnimHelper = TextDrawCreate(630.0, 420.0,
	"~r~~k~~GROUP_CONTROL_BWD~ ~w~to stop the animation");
	TextDrawUseBox(txtAnimHelper, 0);
	TextDrawFont(txtAnimHelper, 2);
	TextDrawSetShadow(txtAnimHelper,0);
    TextDrawSetOutline(txtAnimHelper,1);
    TextDrawBackgroundColor(txtAnimHelper,0x000000FF);
    TextDrawColor(txtAnimHelper,0xFFFFFFFF);
    TextDrawAlignment(txtAnimHelper,3);
	// ____Ws Gerald____
	tmpobjid = CreateDynamicObject(12929, 2092.584960, -1573.171630, 12.226040, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(920, 2092.220214, -1575.846923, -111097.765625, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(943, 2089.220214, -1567.846923, 13.234201, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19817, 2092.162353, -1572.994140, 11.220484, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1075, 2089.621582, -1575.569702, -85.771438, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1084, 2088.712890, -1574.666137, 16.226448, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1084, 2090.314453, -1576.155517, -10986.768554, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1085, 2089.389160, -1577.509033, -87.764869, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1077, 2088.229248, -1576.319335, -9987.764648, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1083, 2088.229248, -1576.319335, -11098.764648, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1098, 2089.229248, -1576.319335, -85.764656, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1097, 2088.940673, -1577.002075, 15.231790, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1083, 2088.697998, -1576.428588, 16.232921, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1096, 2089.258789, -1575.997070, -9985.763671, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1085, 2089.225341, -1577.153076, -985.760620, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1084, 2088.728271, -1572.928344, 16.230133, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1263, 2095.988769, -1576.117675, 10.237686, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1039, 2096.776123, -1575.752441, -86.786956, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2063, 2095.776123, -1579.752441, 13.213044, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(935, 2094.326660, -1575.476318, -986.777099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1387, 2093.282714, -1575.079223, 17.226051, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1152, 2096.465820, -1573.407348, 15.212773, 0.000000, 0.000000, 450.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1155, 2096.351806, -1573.945678, 16.208110, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2917, 2094.152587, -1573.015869, -999981.937500, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1390, 2095.343505, -1573.321655, 17.199781, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19903, 2089.946289, -1573.225341, 8.836521, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19899, 2089.299804, -1579.344970, 12.223817, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1841, 2088.871093, -1578.868896, 12.232415, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1014, 2092.724121, -1565.742553, -84.779945, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1001, 2090.169921, -1565.158203, 16.176244, 95.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1002, 2093.426757, -1565.536010, -84.822181, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1003, 2093.376220, -1565.421020, 16.167739, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1023, 2092.496093, -1565.684448, -84.818511, 90.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2714, 2092.636230, -1565.123168, -985.806396, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19815, 2096.445068, -1576.849731, 14.180511, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(14679, 2095.174316, -1574.077270, -86.785758, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19899, 2091.355224, -1566.304443, -87.823013, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(10281, 2093.140380, -1582.019042, 17.287075, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1508, 2097.784423, -1567.528808, -987.614257, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(10149, 2096.138183, -1567.072387, -985.626464, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(11102, 2096.808349, -1567.817382, 14.365263, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1728, 2095.423339, -1581.625610, 12.181084, 0.000000, 0.000000, 360.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1720, 2096.639160, -1569.293090, -987.817321, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1722, 2095.887207, -1569.410278, 12.177585, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2395, 2098.571777, -1596.558837, -987.487243, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(987, 2104.371826, -1595.550292, 12.530209, 0.000000, 0.000000, 240.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(987, 2086.733154, -1605.324707, 12.380502, 0.000000, 0.000000, 140.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3749, 2092.746093, -1604.535888, 18.380950, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2990, 2083.163818, -1575.718017, 14.457827, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2909, 2084.290283, -1576.895751, -984.559082, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(3049, 2080.948974, -1582.124755, -984.523193, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2990, 2080.352539, -1587.271484, 15.473415, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(987, 2096.684814, -1575.934448, 12.408655, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(987, 2108.008789, -1575.967041, 12.464554, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(987, 2107.787353, -1582.233154, 12.533643, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(639, 2081.469238, -1581.283569, 15.448493, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(5299, 2084.709228, -1578.730346, 3.443974, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1281, 2084.301757, -1586.539916, 13.461508, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1281, 2083.843505, -1590.488159, 13.487107, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1281, 2099.350097, -1584.209228, 13.449150, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1281, 2099.178222, -1588.249267, 13.466442, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1415, 2101.018310, -1593.958618, 12.498926, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(7390, 2092.709472, -1612.020874, -87.624702, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(11500, 2079.338134, -1605.380249, 12.377853, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(10282, 2080.541259, -1611.679321, -85.620651, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(10282, 2092.455566, -1570.852661, 13.257238, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(10281, 2079.801757, -1606.715209, 19.380554, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(10281, 2077.801757, -1611.715209, -1000065.625000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(10281, 2079.572021, -1604.584228, 19.534896, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(7392, 2102.009521, -1593.561279, -99976.671875, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);

	//---- [ Other ]----//
	CreateDynamicObject(987, 831.75732, -519.75250, 15.43560,   0.00000, -2.00000, 90.00000);
	CreateDynamicObject(987, 831.66217, -507.75879, 15.86480,   2.00000, -2.00000, 90.00000);
	CreateDynamicObject(987, 831.74219, -495.97000, 16.26480,   2.00000, 0.00000, 90.00000);
	CreateDynamicObject(987, 831.74933, -494.54861, 16.26480,   2.00000, 0.00000, 90.00000);
	CreateDynamicObject(987, 811.41632, -519.99298, 15.26480,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(987, 819.87091, -482.68771, 16.22480,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(987, 818.60474, -482.67953, 16.22480,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(987, 806.74170, -482.66019, 16.22480,   0.00000, 0.00000, -89.00000);
	CreateDynamicObject(987, 806.91779, -494.57001, 16.22480,   0.00000, 0.00000, -91.00000);
	CreateDynamicObject(987, 806.74719, -507.94949, 16.08480,   0.00000, 4.00000, -89.00000);
	CreateDynamicObject(987, 806.70758, -506.13403, 16.20480,   0.00000, 4.00000, -89.00000);
	CreateDynamicObject(987, 831.85498, -482.68753, 16.24480,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(987, 806.91943, -519.98999, 15.26480,   0.00000, 0.00000, 0.00000);
	//int ms13
	CreateObject(19378, 2192.12988, -1243.15002, 1528.02002,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19378, 2202.62988, -1243.15002, 1528.02002,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19378, 2192.12988, -1252.78003, 1528.02002,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19365, 2189.04004, -1243.50000, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19394, 2192.25000, -1243.50000, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19394, 2194.92993, -1244.60999, 1529.87000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(19378, 2202.62988, -1252.78003, 1528.02002,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19365, 2187.54004, -1246.19995, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19394, 2190.75000, -1246.19995, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19438, 2192.86011, -1246.73999, 1529.87000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(19365, 2193.39990, -1252.05005, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19394, 2193.39990, -1255.23999, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19365, 2187.37012, -1244.63000, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19365, 2196.04004, -1247.29004, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19459, 2193.80005, -1238.64001, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19456, 2188.62012, -1253.65002, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19395, 2190.73999, -1246.20996, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19367, 2187.54004, -1246.20996, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19440, 2192.85010, -1246.75000, 1529.87000,   0.00000, 0.00000, 45.00000);
	CreateDynamicObject(19367, 2193.38989, -1252.05005, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19459, 2187.20996, -1248.87000, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(17969, 2190.30005, -1253.53003, 1530.12000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1502, 2189.96997, -1246.22998, 1528.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1502, 2194.36011, -1244.06995, 1528.09998,   0.00000, 0.00000, -45.00000);
	CreateDynamicObject(1502, 2191.45996, -1243.52002, 1528.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2236, 2190.14990, -1251.20996, 1528.09998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1756, 2187.86011, -1251.44995, 1528.10999,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1711, 2189.13989, -1248.58997, 1528.09998,   0.00000, 0.00000, 7.00000);
	CreateDynamicObject(1712, 2191.42993, -1249.81006, 1528.09998,   0.00000, 0.00000, -94.00000);
	CreateDynamicObject(2313, 2190.13989, -1253.21997, 1528.09998,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2648, 2189.12988, -1253.23999, 1528.85999,   0.00000, 0.00000, 176.00000);
	CreateDynamicObject(1719, 2189.85010, -1253.18005, 1528.62000,   0.00000, 0.00000, 183.00000);
	CreateDynamicObject(1510, 2189.85010, -1251.06006, 1528.62000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2959, 2193.45996, -1255.97998, 1528.10999,   0.00000, 0.00000, 80.00000);
	CreateDynamicObject(2104, 2188.79004, -1246.21997, 1528.07996,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2229, 2189.78003, -1246.30005, 1528.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2229, 2187.97998, -1246.30005, 1528.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14840, 2189.73999, -1243.58997, 1529.76001,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(18661, 2195.93994, -1247.09998, 1530.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19365, 2194.81006, -1256.77002, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19365, 2196.04004, -1256.91003, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19394, 2196.04004, -1250.50000, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19354, 2197.72998, -1249.40002, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19354, 2197.72998, -1251.54004, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19384, 2200.93994, -1249.40002, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19354, 2200.93994, -1251.54004, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19354, 2204.14990, -1251.54004, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19354, 2204.14990, -1249.40002, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19354, 2204.27002, -1250.27002, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19384, 2196.05005, -1250.51001, 1529.85999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19365, 2197.56006, -1245.67004, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19457, 2198.65991, -1238.41003, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19397, 2200.92993, -1249.39001, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, 2197.72998, -1249.39001, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, 2204.13989, -1249.39001, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, 2196.06006, -1247.69995, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19369, 2197.72998, -1246.01001, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19369, 2199.25000, -1244.48999, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19461, 2203.98999, -1242.89001, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19461, 2204.26001, -1244.52002, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1502, 2200.13989, -1249.42004, 1528.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19459, 2187.39990, -1238.64001, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19456, 2189.05005, -1238.39001, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(4227, 2198.12012, -1251.54004, 1529.85999,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(18663, 2193.50000, -1250.91003, 1529.76001,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19393, 2193.38989, -1255.22998, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19456, 2188.62012, -1256.76001, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19364, 2187.20996, -1255.30005, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19457, 2199.06006, -1240.91003, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19457, 2193.81006, -1238.64001, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19367, 2189.03003, -1243.48999, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19395, 2192.23999, -1243.48999, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(4227, 2201.61011, -1238.39001, 1529.85999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14880, 2197.67993, -1244.09998, 1528.50000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14556, 2197.76001, -1239.53003, 1529.62000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2394, 2197.93994, -1238.92004, 1529.48999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2372, 2198.60010, -1239.12000, 1530.98999,   0.00000, 180.00000, 90.00000);
	CreateDynamicObject(2323, 2194.86011, -1239.98999, 1528.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2835, 2195.82007, -1242.01001, 1528.09998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2845, 2197.76001, -1242.07996, 1528.10999,   0.00000, 0.00000, 20.00000);
	CreateDynamicObject(2659, 2198.97998, -1243.70996, 1530.07996,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2693, 2197.19995, -1245.76001, 1530.29004,   10.00000, 4.00000, 180.00000);
	CreateDynamicObject(2695, 2193.91992, -1241.08997, 1530.19995,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1529, 2193.89990, -1240.33997, 1530.12000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2691, 2193.32007, -1251.47998, 1529.90002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2270, 2192.45996, -1247.18005, 1530.39001,   0.00000, 0.00000, -45.00000);
	CreateDynamicObject(2069, 2192.76001, -1253.01001, 1528.14001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3034, 2187.30005, -1249.91003, 1530.12000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3034, 2187.48999, -1240.76001, 1530.12000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3034, 2196.92993, -1238.50000, 1530.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19394, 2196.04004, -1253.70996, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19459, 2200.90991, -1255.59998, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19367, 2196.05005, -1256.90002, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19395, 2196.05005, -1253.69995, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19459, 2200.90991, -1252.03003, 1529.87000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19459, 2200.37988, -1256.58997, 1529.87000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2201.30005, -1256.80005, 1528.03003,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(1502, 2196.02002, -1252.92004, 1528.09998,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3034, 2198.15991, -1255.51001, 1530.12000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2525, 2196.84009, -1254.96997, 1528.12000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2526, 2199.87988, -1255.05005, 1528.10999,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2518, 2198.35010, -1252.63000, 1528.22998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2836, 2198.71997, -1254.44995, 1528.10999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2846, 2197.41992, -1254.20996, 1528.13000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2414, 2196.61011, -1252.43005, 1528.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2306, 2199.73999, -1253.62000, 1528.12000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14840, 2199.39990, -1257.06995, 1530.18005,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2135, 2201.69995, -1243.47998, 1528.08997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2138, 2202.68994, -1243.48999, 1528.08997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2303, 2200.69995, -1243.47998, 1528.08997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2305, 2203.66992, -1243.48999, 1528.08997,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2305, 2199.75000, -1243.48999, 1528.08997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2136, 2199.75000, -1245.47998, 1528.08997,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2138, 2203.66992, -1244.45996, 1528.08997,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2138, 2203.66992, -1245.43994, 1528.08997,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(5375, 1993.91003, -2064.35010, 18.53000,   356.85999, 0.00000, 3.14000);
	CreateDynamicObject(5375, 2121.32007, -1272.81995, 1534.87000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1575, 2187.60010, -1253.94995, 1528.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1575, 2188.14990, -1253.94995, 1528.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1575, 2187.50000, -1254.40002, 1528.09998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1575, 2187.50000, -1254.93994, 1528.09998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1575, 2188.68994, -1253.94995, 1528.09998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1575, 2187.90991, -1253.94995, 1528.23999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1575, 2188.46997, -1253.94995, 1528.23999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1575, 2187.50000, -1254.16003, 1528.23999,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1575, 2187.50000, -1254.71997, 1528.23999,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1575, 2187.94995, -1254.80005, 1528.09998,   0.00000, 0.00000, 50.00000);
	CreateDynamicObject(1575, 2188.08008, -1254.34998, 1528.09998,   0.00000, 0.00000, 5.00000);
	CreateDynamicObject(1829, 2190.12988, -1256.13000, 1528.57996,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2332, 2189.31006, -1256.43994, 1528.58997,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(355, 2188.70996, -1256.38000, 1528.33997,   10.00000, -90.00000, 90.00000);
	CreateDynamicObject(372, 2189.17993, -1256.38000, 1529.05005,   90.00000, 0.00000, -20.00000);
	CreateDynamicObject(2836, 2190.98999, -1247.78003, 1528.10999,   0.00000, 0.00000, -42.00000);
	CreateDynamicObject(2109, 2198.31006, -1247.66003, 1528.48999,   0.00000, 0.00000, 40.00000);
	CreateDynamicObject(2121, 2199.21997, -1246.65002, 1528.60999,   0.00000, 0.00000, -30.00000);
	CreateDynamicObject(2121, 2199.53003, -1248.43005, 1528.60999,   0.00000, 0.00000, -120.00000);
	CreateDynamicObject(2121, 2197.60010, -1248.81995, 1528.60999,   0.00000, 0.00000, 1230.00000);
	CreateDynamicObject(2121, 2196.78003, -1247.87000, 1528.60999,   0.00000, 0.00000, 94.00000);
	CreateDynamicObject(2121, 2196.97998, -1246.59998, 1528.60999,   0.00000, 0.00000, 50.00000);
	CreateDynamicObject(2103, 2203.93994, -1245.35999, 1529.14001,   0.00000, 0.00000, -86.00000);
	CreateDynamicObject(2829, 2199.75000, -1243.67004, 1529.14001,   0.00000, 0.00000, 80.00000);
	CreateDynamicObject(2830, 2199.62988, -1245.53003, 1529.15002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2831, 2203.71997, -1243.46997, 1529.15002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2254, 2196.15991, -1247.80005, 1530.31006,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18665, 2198.41992, -1249.29004, 1529.95996,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2189, 2198.31006, -1247.66003, 1528.93005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1510, 2199.04004, -1247.56006, 1528.93005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1510, 2197.62012, -1248.10999, 1528.93005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1510, 2197.61011, -1247.25000, 1528.93005,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1485, 2199.08008, -1247.38000, 1529.02002,   0.00000, 30.00000, -90.00000);
	CreateDynamicObject(3027, 2199.08008, -1247.60999, 1528.97998,   0.00000, 120.00000, 120.00000);
	CreateDynamicObject(3034, 2204.16992, -1247.59998, 1530.12000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2131, 2203.69995, -1248.80005, 1528.09998,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2627, 2189.22998, -1239.83997, 1528.07996,   0.00000, 0.00000, -120.00000);
	CreateDynamicObject(2628, 2189.42993, -1242.06006, 1528.09998,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1985, 2192.42993, -1240.30005, 1531.23999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19377, 2202.62988, -1252.78003, 1531.47998,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19377, 2202.62988, -1243.15002, 1531.47998,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19377, 2192.12988, -1243.15002, 1531.47998,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(19377, 2192.12988, -1252.78003, 1531.47998,   0.00000, 90.00000, 0.00000);
	CreateDynamicObject(1485, 2190.03003, -1251.05005, 1528.69995,   0.00000, 30.00000, 180.00000);
	CreateDynamicObject(1486, 2189.87012, -1250.41003, 1528.75000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1486, 2189.39990, -1250.87000, 1528.75000,   0.00000, 0.00000, 134.00000);
	CreateDynamicObject(1543, 2189.38989, -1250.35999, 1528.59998,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1543, 2189.54004, -1250.21997, 1528.59998,   0.00000, 0.00000, 40.00000);
	CreateDynamicObject(1544, 2189.84009, -1250.79004, 1528.59998,   0.00000, 0.00000, 30.00000);
	CreateDynamicObject(1544, 2189.78003, -1250.18005, 1528.59998,   0.00000, 0.00000, 30.00000);
	CreateDynamicObject(2074, 2189.59009, -1250.62000, 1531.16003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, 2190.12988, -1244.92004, 1531.16003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, 2194.66992, -1250.47998, 1531.16003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, 2200.61011, -1250.47998, 1531.16003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, 2201.69995, -1244.84998, 1531.16003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2073, 2198.25000, -1247.66003, 1530.68994,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, 2190.85010, -1240.85999, 1531.16003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, 2198.12012, -1253.75000, 1531.16003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2074, 2196.36011, -1242.71997, 1531.16003,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1498, 2187.41992, -1245.60999, 1528.02002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1498, 2204.23999, -1251.23999, 1528.02002,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1502, 2196.02002, -1249.71997, 1528.09998,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19365, 2193.39990, -1248.83997, 1529.87000,   0.00000, 0.00000, 0.00000);

	//HooverWs
	CreateDynamicObject(12943, 2431.23047, -1676.50684, 12.57740,   0.00000, 0.00000, -0.06000);
	CreateDynamicObject(19899, 2429.23755, -1679.94885, 12.74588,   0.00000, 0.00000, 90.84004);
	CreateDynamicObject(19898, 2435.18555, -1677.78308, 12.78284,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19903, 2432.15942, -1679.49451, 12.69765,   0.00000, 0.00000, 48.36000);
	CreateDynamicObject(19898, 2433.69360, -1673.89563, 12.68972,   0.00000, 0.00000, -201.00000);
	CreateDynamicObject(19893, 2428.28711, -1680.00671, 13.99196,   0.00000, 0.00000, 156.11996);
	CreateDynamicObject(19914, 2438.93188, -1672.70605, 13.38365,   2.04002, 99.89994, 8.28000);
	CreateDynamicObject(1098, 2431.34180, -1680.31750, 16.51908,   0.00000, 0.00000, 89.63995);
	CreateDynamicObject(1010, 2430.01074, -1679.71680, 13.99561,   0.00000, 0.00000, 0.72000);
	CreateDynamicObject(1080, 2430.17920, -1680.32764, 16.53509,   0.00000, 0.00000, 89.28003);
	CreateDynamicObject(1097, 2428.93652, -1680.35339, 16.49226,   0.00000, 0.00000, 89.75999);
	CreateDynamicObject(1025, 2427.71826, -1680.22705, 16.50154,   0.00000, 0.00000, -89.21999);
	CreateDynamicObject(1025, 2422.58911, -1671.63708, 12.73736,   0.53994, 85.43981, -89.21999);
	CreateDynamicObject(1025, 2422.48755, -1671.67200, 13.02090,   0.53994, 85.43981, -89.21999);
	CreateDynamicObject(1025, 2422.60596, -1671.69812, 13.29708,   0.53994, 85.43981, -89.21999);
	CreateDynamicObject(1025, 2423.41724, -1672.03687, 12.85602,   -42.00006, 74.39975, -89.21999);
	CreateDynamicObject(1840, 2427.82153, -1680.27026, 12.73660,   0.00000, 0.00000, -80.09996);
	CreateDynamicObject(19878, 2425.95337, -1680.43054, 16.46169,   -176.63965, 266.15991, -93.95997);
	CreateDynamicObject(19817, 2437.31006, -1676.33923, 10.83282,   0.00000, 0.00000, 90.06005);
	CreateDynamicObject(19817, 2425.74219, -1674.32141, 10.90082,   0.00000, 0.00000, -179.15985);
	CreateDynamicObject(1080, 2427.41748, -1680.25830, 13.13623,   141.53978, 26.22001, 89.28003);
	CreateDynamicObject(19815, 2423.23633, -1676.70337, 14.40101,   0.00000, 0.00000, 90.72010);
	CreateDynamicObject(19898, 2427.00586, -1676.58789, 12.72707,   0.00000, 0.00000, -201.00000);
	CreateDynamicObject(19898, 2426.65918, -1675.62622, 12.72707,   0.00000, 0.00000, -201.00000);
	CreateDynamicObject(19898, 2430.25244, -1679.50940, 12.76510,   0.00000, 0.00000, -201.00000);
	CreateDynamicObject(366, 2437.87988, -1680.46863, 15.08769,   -2.04000, 46.01997, -1.62000);
	CreateDynamicObject(19425, 2439.10449, -1676.46643, 12.64300,   0.00000, 1.00000, 91.00000);
	CreateDynamicObject(19425, 2425.84229, -1672.72192, 12.58870,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(365, 2429.43921, -1679.66736, 14.16478,   0.72000, -4.68000, 5.52000);
	CreateDynamicObject(365, 2429.35840, -1679.65613, 14.16478,   0.72000, -4.68000, 5.52000);
	CreateDynamicObject(365, 2429.27734, -1679.66516, 14.16478,   0.72000, -4.68000, 5.52000);
	CreateDynamicObject(1728, 2425.76563, -1679.92090, 12.74192,   0.00000, 0.00000, 181.20007);
	CreateDynamicObject(19900, 2430.86914, -1680.16699, 12.73923,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1468, 2430.26953, -1629.19421, 13.65110,   3.14159, 0.00000, 0.55080);
	CreateDynamicObject(1468, 2432.70459, -1629.16711, 13.65110,   3.14159, 0.00000, 0.55080);
	CreateDynamicObject(365, 2430.77759, -1677.62292, 12.72300,   -24.66001, -90.48000, 5.52000);
	CreateDynamicObject(19898, 2430.90625, -1677.88440, 12.76511,   0.00000, 0.00000, -201.00000);
	CreateDynamicObject(1251, 2425.30249, -1633.08472, 12.41390,   0.00000, 0.00000, 90.29992);
	CreateDynamicObject(1251, 2425.44116, -1636.91492, 12.41390,   0.00000, 0.00000, 90.29992);
	CreateDynamicObject(1251, 2425.46362, -1640.47510, 12.47182,   0.00000, 0.00000, 90.29992);
	CreateDynamicObject(1251, 2425.32739, -1644.17883, 12.53270,   0.00000, 0.00000, 90.29992);
	CreateDynamicObject(4640, 2434.78125, -1647.19238, 14.24032,   0.00000, 0.00000, 92.51984);
	CreateDynamicObject(968, 2433.51196, -1648.54724, 12.51267,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 2424.27148, -1648.83264, 13.00126,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 2426.38428, -1648.85547, 13.00126,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 2429.72339, -1629.27197, 13.00126,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 2433.15015, -1629.29822, 13.00126,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 2437.45117, -1648.84802, 13.00126,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1711, 2434.33984, -1670.90417, 12.53362,   0.00000, 0.00000, 92.22001);
	CreateDynamicObject(1728, 2437.57153, -1671.96594, 12.74192,   0.00000, 0.00000, 181.20007);
	CreateDynamicObject(2115, 2436.13281, -1670.58374, 12.19641,   0.00000, 0.00000, -0.60000);
	CreateDynamicObject(1544, 2437.10889, -1670.88196, 12.98391,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1544, 2437.01001, -1670.86572, 12.98391,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1486, 2437.08252, -1670.78613, 13.08972,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1543, 2436.04761, -1670.64526, 13.08177,   -9.96000, 93.12009, 0.00000);
	CreateDynamicObject(2860, 2436.56421, -1670.61938, 12.99549,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18961, 2437.39648, -1670.39844, 13.01478,   0.00000, 0.00000, 43.74002);
	CreateDynamicObject(349, 2437.40918, -1671.72717, 13.30068,   -72.95995, -192.53999, 4.26000);
	CreateDynamicObject(1025, 2438.53320, -1670.45520, 12.65078,   -6.78000, 87.90002, 0.00000);
	CreateDynamicObject(1025, 2438.53198, -1670.43506, 12.87711,   -6.78000, 87.90002, 0.00000);
	CreateDynamicObject(1010, 2430.01074, -1679.71680, 14.38192,   0.00000, 0.00000, 0.72000);
	CreateDynamicObject(1776, 2432.70093, -1672.05151, 13.61396,   0.00000, 0.00000, 179.40002);
	CreateDynamicObject(1209, 2431.47144, -1672.04614, 12.53911,   0.00000, 0.00000, 179.87990);
	CreateDynamicObject(19893, 2430.77515, -1680.18823, 13.58896,   0.00000, 0.00000, 156.11996);
	CreateDynamicObject(2840, 2436.57153, -1670.28357, 12.52435,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2840, 2436.27100, -1670.16321, 12.52435,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1665, 2435.91528, -1670.33374, 13.01732,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2674, 2437.80591, -1670.29602, 12.58086,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2673, 2435.15527, -1669.47913, 12.54819,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2674, 2435.31421, -1671.53821, 12.61308,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19878, 2434.37354, -1672.31396, 13.03013,   -181.91949, 242.76004, -93.95997);
	CreateDynamicObject(1256, 2434.28174, -1672.95679, 13.18150,   0.00000, 0.00000, 91.92000);
	CreateDynamicObject(2209, 2430.90088, -1673.06873, 12.65139,   0.00000, 0.00000, 1.19998);
	CreateDynamicObject(19899, 2434.95044, -1679.83032, 12.74588,   0.00000, 0.00000, 90.84004);
	CreateDynamicObject(1468, 2460.67578, -1668.55212, 13.81250,   3.14159, 0.00000, 172.37369);
	CreateDynamicObject(1468, 2455.42627, -1668.13208, 13.81250,   3.14159, 0.00000, 178.07362);
	CreateDynamicObject(1468, 2451.18579, -1670.09424, 13.81250,   3.14159, 0.00000, 230.39357);
	CreateDynamicObject(1468, 2447.86743, -1674.08008, 13.81250,   3.14159, 0.00000, 230.39357);
	CreateDynamicObject(1468, 2444.55908, -1678.08057, 13.81250,   3.14159, 0.00000, 230.39357);
	CreateDynamicObject(1468, 2440.67993, -1680.82104, 13.81250,   3.14159, 0.00000, 199.43346);
	CreateDynamicObject(1468, 2420.60059, -1673.10486, 13.81250,   3.14159, 0.00000, 178.73361);
	CreateDynamicObject(1468, 2418.71265, -1673.10486, 13.81250,   3.14160, 0.00000, 178.73360);
	CreateDynamicObject(17065, 2448.82227, -1639.25708, 16.54782,   0.00000, 0.00000, 89.76004);
	CreateDynamicObject(1676, 2446.10229, -1645.65417, 14.12318,   0.00000, 0.00000, -89.10004);
	CreateDynamicObject(1676, 2453.52222, -1645.99023, 14.14492,   0.00000, 0.00000, -91.67999);
	CreateDynamicObject(1676, 2446.20703, -1633.21570, 13.99584,   0.00000, 0.00000, -91.67999);
	CreateDynamicObject(1676, 2453.53320, -1633.18945, 14.23027,   0.00000, 0.00000, -88.26002);
	CreateDynamicObject(1230, 2440.47754, -1629.84802, 12.73002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1230, 2441.13330, -1629.90051, 12.73002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1230, 2440.43066, -1630.44727, 12.73002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1230, 2440.45435, -1629.86584, 13.31945,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1370, 2441.03052, -1630.40906, 12.73707,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1328, 2440.02563, -1649.37817, 12.92102,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1328, 2440.55396, -1649.25330, 12.62241,   82.32000, 26.27999, 0.00000);
	CreateDynamicObject(2840, 2440.18921, -1650.01758, 12.52435,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19556, 2440.37061, -1649.92798, 12.55469,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1438, 2457.14185, -1630.68469, 12.33126,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 2445.63843, -1645.23645, 12.99737,   0.00000, 0.00000, 90.41998);
	CreateDynamicObject(970, 2446.61987, -1645.25586, 12.99737,   0.00000, 0.00000, 90.41998);
	CreateDynamicObject(970, 2453.04004, -1645.22998, 13.15630,   0.00000, 0.00000, 90.41998);
	CreateDynamicObject(970, 2454.04419, -1645.18872, 13.11709,   0.00000, 0.00000, 90.41998);
	CreateDynamicObject(970, 2454.12012, -1633.59509, 13.21688,   0.00000, 0.00000, 90.41998);
	CreateDynamicObject(970, 2453.10645, -1633.60913, 13.21688,   0.00000, 0.00000, 90.41998);
	CreateDynamicObject(970, 2446.81543, -1633.50073, 13.11866,   0.00000, 0.00000, 90.41998);
	CreateDynamicObject(970, 2445.67578, -1633.53223, 12.96467,   0.00000, 0.00000, 90.41998);
	//Ms13 ws
	CreateDynamicObject(19905, 1103.81360, -1244.35168, 14.93130,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(18981, 1102.49023, -1234.91455, 14.35100,   0.00000, -90.00000, 0.00000);
	CreateDynamicObject(18981, 1093.97021, -1234.91455, 14.35100,   0.00000, -90.00000, 0.00000);
	CreateDynamicObject(18981, 1093.97021, -1241.19458, 14.35100,   0.00000, -90.00000, 0.00000);
	CreateDynamicObject(3361, 1084.67163, -1245.51184, 19.05340,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3361, 1084.67163, -1237.29175, 14.99340,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2395, 1084.15515, -1250.91687, 21.18630,   -90.00000, 0.00000, 0.00000);
	CreateDynamicObject(19899, 1118.63318, -1251.23975, 15.13220,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19899, 1109.01318, -1251.23975, 15.13220,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19899, 1100.15295, -1251.23975, 15.13220,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19899, 1090.93323, -1251.23975, 15.13220,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19900, 1107.38684, -1251.29260, 15.15610,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19900, 1098.44678, -1251.29260, 15.15610,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19900, 1089.24683, -1251.29260, 15.15610,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19815, 1094.86780, -1251.85803, 17.25630,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19815, 1095.53345, -1251.68823, 17.26000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19815, 1104.33337, -1251.68823, 17.26000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19817, 1099.37805, -1241.29700, 13.28060,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19817, 1090.47815, -1241.29700, 13.28060,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19817, 1108.23816, -1241.29700, 13.28060,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19817, 1117.33813, -1241.29700, 13.28060,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19903, 1106.44995, -1251.28760, 15.14810,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 1118.83130, -1235.90112, 15.04440,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 1115.71130, -1235.90112, 15.04440,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 1109.75134, -1235.90112, 15.04440,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 1106.63135, -1235.90112, 15.04440,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 1100.71130, -1235.90112, 15.04440,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 1097.59131, -1235.90112, 15.04440,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 1091.63135, -1235.90112, 15.04440,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 1088.35132, -1235.90112, 15.04440,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(10281, 1121.00330, -1213.92029, 23.52220,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(984, 1106.32959, -1222.44678, 18.06010,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(984, 1093.52954, -1222.44678, 18.06010,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(984, 1087.20959, -1222.44678, 18.06010,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(18981, 1110.15015, -1209.53455, 16.63100,   0.00000, -90.00000, 0.00000);
	CreateDynamicObject(18981, 1090.71021, -1209.53455, 16.63100,   0.00000, -90.00000, 0.00000);
	CreateDynamicObject(984, 1115.92957, -1197.20679, 17.98010,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(984, 1103.12964, -1197.20679, 17.98010,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(984, 1090.32959, -1197.20679, 17.98010,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(984, 1088.70959, -1197.20679, 17.98010,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1075, 1086.44934, -1245.02283, 15.62370,   4.00000, -14.00000, 0.00000);
	CreateDynamicObject(1083, 1086.45923, -1243.98865, 15.60060,   0.00000, -18.00000, 0.00000);
	CreateDynamicObject(1084, 1086.29919, -1244.58862, 16.42060,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1076, 1095.25171, -1251.43567, 15.57310,   0.00000, -16.00000, 90.00000);
	CreateDynamicObject(1077, 1096.21252, -1251.53564, 15.56170,   0.00000, -23.00000, 91.00000);
	CreateDynamicObject(1078, 1086.44275, -1247.99890, 15.53810,   0.00000, -14.00000, 0.00000);
	CreateDynamicObject(1097, 1086.44287, -1248.96130, 15.52720,   0.00000, -14.00000, 0.00000);
	CreateDynamicObject(1082, 1086.40259, -1248.44556, 16.34690,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1085, 1120.94263, -1248.36804, 15.58180,   0.00000, -14.00000, 180.00000);
	CreateDynamicObject(1096, 1120.92236, -1247.33350, 15.54370,   0.00000, -14.00000, 180.00000);
	CreateDynamicObject(1080, 1121.19763, -1247.78088, 16.32380,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1079, 1120.91931, -1239.31335, 15.58230,   0.00000, -14.00000, 180.00000);
	CreateDynamicObject(1073, 1120.91846, -1240.32434, 15.56430,   0.00000, -14.00000, 180.00000);
	CreateDynamicObject(1074, 1121.19873, -1239.84363, 16.34250,   0.00000, 0.00000, 178.00000);
	CreateDynamicObject(1081, 1086.52014, -1239.99890, 15.62210,   0.00000, -14.00000, 0.00000);
	CreateDynamicObject(1025, 1086.46021, -1238.92114, 15.59910,   0.00000, -14.00000, 0.00000);
	CreateDynamicObject(1010, 1091.84229, -1251.69727, 17.43470,   270.00000, 0.00000, 0.00000);
	CreateDynamicObject(1010, 1091.84229, -1251.69727, 16.53470,   270.00000, 0.00000, 0.00000);
	CreateDynamicObject(1010, 1101.04236, -1251.69727, 16.91470,   270.00000, 0.00000, 0.00000);
	CreateDynamicObject(1008, 1119.49304, -1251.07495, 16.83910,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(1008, 1108.81311, -1251.07495, 16.49910,   90.00000, 0.00000, 0.00000);
	CreateDynamicObject(2808, 1083.08240, -1229.47668, 15.48010,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2808, 1083.08240, -1231.51672, 15.48010,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2808, 1083.08240, -1223.65674, 15.48010,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2808, 1083.08240, -1233.25671, 15.48010,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(19245, 1118.28967, -1235.54993, 14.97896,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 1112.49133, -1220.42114, 17.12440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 1112.49133, -1217.32104, 17.12440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 1107.17126, -1217.32104, 17.12440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 1107.17126, -1220.42114, 17.12440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 1102.03125, -1220.42114, 17.12440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 1102.01135, -1217.32104, 17.12440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 1097.15125, -1217.32104, 17.12440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 1097.15125, -1220.42114, 17.12440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 1091.91125, -1220.42114, 17.12440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 1091.91125, -1217.32104, 17.12440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 1087.13135, -1217.32104, 17.12440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19425, 1087.13135, -1220.42114, 17.12440,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2614, 1103.77271, -1236.13464, 19.09360,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2770, 1112.37964, -1223.05872, 15.44460,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(988, 1078.47217, -1208.11523, 16.27760,   0.00000, 0.00000, -91.98000);
	CreateDynamicObject(988, 1078.47217, -1206.45715, 16.27760,   0.00000, 0.00000, -91.98000);

	//Pesawat terjun
	CreateObject(14548, 1387.15552, -2543.55566, 1200.22058,   14.00000, 0.00000, -90.00000);
	//ws midnight
	CreateDynamicObject(19905, 211.16409, -1431.52808, 12.13730,   0.00000, 0.00000, 403.97989);
	CreateDynamicObject(7096, 227.94170, -1417.48206, 16.77308,   0.00000, 0.00000, -136.02005);
	CreateDynamicObject(19435, 222.64783, -1417.96521, 18.43851,   -0.78003, 91.80012, 44.09998);
	CreateDynamicObject(19435, 221.54391, -1416.82874, 18.43851,   -0.78003, 91.80012, 44.09998);
	CreateDynamicObject(19817, 222.71448, -1424.00073, 10.44718,   0.00000, 0.00000, 44.10000);
	CreateDynamicObject(19817, 216.35826, -1430.12415, 10.44718,   0.00000, 0.00000, 44.10000);
	CreateDynamicObject(19817, 209.98334, -1436.49438, 10.44718,   0.00000, 0.00000, 44.10000);
	CreateDynamicObject(19817, 203.48112, -1442.93286, 10.44718,   0.00000, 0.00000, 44.10000);
	CreateDynamicObject(19815, 201.77306, -1430.50244, 13.95991,   0.00000, 0.00000, 43.67999);
	CreateDynamicObject(19815, 195.30943, -1436.69519, 13.95991,   0.00000, 0.00000, 43.67999);
	CreateDynamicObject(19815, 207.85474, -1424.61743, 13.95991,   0.00000, 0.00000, 43.67999);
	CreateDynamicObject(19815, 213.97017, -1418.69714, 13.95991,   0.00000, 0.00000, 43.67999);
	CreateDynamicObject(19903, 197.07668, -1435.53296, 12.36379,   0.00000, 0.00000, -47.64000);
	CreateDynamicObject(19903, 203.36363, -1429.42847, 12.36379,   0.00000, 0.00000, -47.64000);
	CreateDynamicObject(19903, 209.03764, -1424.17749, 12.36379,   0.00000, 0.00000, -53.70000);
	CreateDynamicObject(19903, 215.22189, -1417.99841, 12.36379,   0.00000, 0.00000, -52.01998);
	CreateDynamicObject(1728, 203.75591, -1447.87231, 12.32510,   0.00000, 0.00000, 138.30002);
	CreateDynamicObject(1728, 223.03360, -1432.13977, 12.16020,   0.00000, 0.00000, 406.01990);
	CreateDynamicObject(19899, 216.49443, -1417.01160, 12.32879,   0.00000, 0.00000, -49.32000);
	CreateDynamicObject(19900, 217.69714, -1415.97266, 12.36234,   0.00000, 0.00000, -406.13940);
	CreateDynamicObject(19899, 210.35365, -1423.03955, 12.32879,   0.00000, 0.00000, -49.32000);
	CreateDynamicObject(19900, 211.72696, -1422.09888, 12.36234,   0.00000, 0.00000, -406.13940);
	CreateDynamicObject(19899, 204.58383, -1428.49512, 12.32879,   0.00000, 0.00000, -49.32000);
	CreateDynamicObject(19900, 205.87875, -1427.56189, 12.36234,   0.00000, 0.00000, -406.13940);
	CreateDynamicObject(19899, 195.68224, -1439.66663, 12.32879,   0.00000, 0.00000, 43.43998);
	CreateDynamicObject(19900, 194.80351, -1437.75415, 12.36234,   0.00000, 0.00000, -371.75946);
	CreateDynamicObject(1080, 195.26192, -1436.82813, 16.17355,   0.00000, 0.00000, -46.50000);
	CreateDynamicObject(1080, 196.52390, -1435.65295, 16.17360,   0.00000, 0.00000, -46.50000);
	CreateDynamicObject(1098, 198.02103, -1434.39478, 16.17550,   0.00000, 0.00000, -48.24000);
	CreateDynamicObject(1098, 199.32231, -1432.88647, 16.17550,   0.00000, 0.00000, -48.24000);
	CreateDynamicObject(1074, 200.87488, -1431.59314, 16.14603,   0.00000, 0.00000, -55.79996);
	CreateDynamicObject(1074, 202.26967, -1430.24109, 16.14603,   0.00000, 0.00000, -55.79996);
	CreateDynamicObject(1082, 203.79521, -1428.69824, 16.12476,   0.00000, 0.00000, -56.76000);
	CreateDynamicObject(1082, 205.34239, -1427.21936, 16.12476,   0.00000, 0.00000, -56.76000);
	CreateDynamicObject(11435, 203.67943, -1457.73633, 16.63546,   0.00000, 0.00000, 75.96003);
	CreateDynamicObject(19898, 209.19774, -1429.63586, 12.37320,   0.00000, 0.00000, 1.08000);
	CreateDynamicObject(19898, 203.11263, -1438.26929, 12.37320,   0.00000, 0.00000, -207.83998);
	CreateDynamicObject(19898, 202.15294, -1434.63513, 12.37320,   0.00000, 0.00000, 26.28000);
	CreateDynamicObject(19898, 210.02425, -1433.49463, 12.37320,   0.00000, 0.00000, -157.08005);
	CreateDynamicObject(19898, 226.40782, -1423.40991, 12.37320,   0.00000, 0.00000, 1.08000);
	CreateDynamicObject(19898, 224.12001, -1423.54065, 12.37320,   0.00000, 0.00000, 1.08000);
	CreateDynamicObject(1080, 208.37180, -1424.92517, 12.74148,   -304.62009, -37.25998, -76.91998);
	CreateDynamicObject(1080, 205.87061, -1428.25793, 12.74148,   -304.62009, -37.25998, 0.66000);
	CreateDynamicObject(11706, 199.31128, -1433.35754, 12.36359,   0.00000, 0.00000, 40.38002);
	//ws lshc
	CreateDynamicObject(18766, 1945.19409, -1801.57642, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1935.23877, -1801.54199, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1945.18384, -1806.48328, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1945.14331, -1811.48096, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1935.24316, -1806.52295, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1935.15564, -1811.41260, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1945.03870, -1816.45093, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1935.16833, -1816.39587, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1945.09668, -1821.36841, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1936.59473, -1819.49939, 12.05978,   -89.93999, 335.82010, -49.13995);
	CreateDynamicObject(18766, 1925.27136, -1801.51343, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1915.30176, -1801.49402, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1925.26990, -1806.47986, 12.06589,   -90.06003, 328.80026, -31.25999);
	CreateDynamicObject(18766, 1925.19458, -1811.45081, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1925.20508, -1816.44666, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1931.53967, -1817.13135, 12.05978,   -89.93997, 334.98013, -49.13995);
	CreateDynamicObject(18766, 1915.30347, -1806.48792, 12.00725,   -90.06003, 328.80026, -31.25999);
	CreateDynamicObject(18766, 1915.21692, -1811.44006, 12.06589,   -90.06003, 328.80026, -31.25999);
	CreateDynamicObject(18766, 1915.26794, -1816.40918, 12.06589,   -90.06003, 328.80026, -31.31999);
	CreateDynamicObject(12943, 1945.25342, -1814.90894, 12.51113,   0.00000, 0.00000, 89.52000);
	CreateDynamicObject(1412, 1951.73804, -1826.79370, 13.81250,   3.14159, 0.00000, -87.70920);
	CreateDynamicObject(1482, 1925.87988, -1817.41553, 13.97959,   0.00000, 0.00000, 88.86004);
	CreateDynamicObject(1482, 1919.14258, -1817.26917, 13.97959,   0.00000, 0.00000, 88.86004);
	CreateDynamicObject(1482, 1914.26880, -1817.10706, 13.97959,   0.00000, 0.00000, 88.86004);
	CreateDynamicObject(18766, 1926.97046, -1799.78821, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1918.80530, -1799.76697, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(19815, 1949.25085, -1809.79944, 14.35483,   0.00000, 0.00000, -90.30003);
	CreateDynamicObject(19815, 1945.50293, -1822.85217, 14.35483,   0.00000, 0.00000, -180.41998);
	CreateDynamicObject(19817, 1945.39746, -1808.36072, 10.65220,   0.00000, 0.00000, -180.11992);
	CreateDynamicObject(19817, 1942.33057, -1820.32910, 10.65802,   0.00000, 0.00000, -90.77992);
	CreateDynamicObject(19425, 1945.44946, -1806.98450, 12.56830,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19425, 1941.23303, -1820.16113, 12.56830,   0.00000, 0.00000, -90.65997);
	CreateDynamicObject(19903, 1948.63879, -1814.07410, 12.55697,   0.00000, 0.00000, 172.14011);
	CreateDynamicObject(1728, 1948.65576, -1820.40845, 12.55701,   0.00000, 0.00000, -89.81998);
	CreateDynamicObject(19900, 1948.85303, -1817.60339, 12.56110,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19899, 1948.72742, -1815.99365, 12.52433,   0.00000, 0.00000, 179.21999);
	CreateDynamicObject(2115, 1948.68433, -1819.48218, 12.18249,   0.00000, 0.00000, 90.48000);
	CreateDynamicObject(19898, 1946.02673, -1822.12463, 12.57843,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19898, 1945.69580, -1815.05774, 12.57843,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19898, 1947.00134, -1811.46106, 12.57843,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19898, 1943.35999, -1818.65759, 12.57843,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19898, 1943.31555, -1812.85645, 12.57843,   0.00000, 0.00000, -86.09997);
	CreateDynamicObject(11435, 1930.97498, -1795.98206, 16.96585,   0.00000, 0.00000, -91.43998);
	CreateDynamicObject(970, 1904.08704, -1801.07117, 13.02890,   0.00000, 0.00000, 89.94001);
	CreateDynamicObject(970, 1904.04248, -1805.24597, 13.02890,   0.00000, 0.00000, 89.94001);
	CreateDynamicObject(970, 1904.05627, -1809.35876, 13.02890,   0.00000, 0.00000, 89.94001);
	CreateDynamicObject(970, 1904.02954, -1813.33374, 13.02890,   0.00000, 0.00000, 89.94001);
	CreateDynamicObject(970, 1903.98462, -1816.78870, 13.02890,   0.00000, 0.00000, 88.92003);
	CreateDynamicObject(970, 1931.29382, -1819.66724, 13.04294,   0.00000, 0.00000, -25.44000);
	CreateDynamicObject(970, 1935.02222, -1821.43872, 13.04294,   0.00000, 0.00000, -25.44000);
	CreateDynamicObject(970, 1938.11609, -1822.90039, 13.04294,   0.00000, 0.00000, -25.44000);
	CreateDynamicObject(970, 1942.08032, -1823.78564, 13.04294,   0.00000, 0.00000, -0.24000);
	CreateDynamicObject(970, 1908.22021, -1799.01880, 13.02890,   0.00000, 0.00000, -0.95998);
	CreateDynamicObject(970, 1914.46338, -1798.50647, 11.46793,   -0.17997, 87.54011, 89.10004);
	CreateDynamicObject(970, 1914.45740, -1797.82434, 11.46793,   -0.17997, 87.54011, 89.10004);
	CreateDynamicObject(970, 1946.15918, -1823.79907, 13.04294,   0.00000, 0.00000, -0.24000);
	CreateDynamicObject(970, 1947.98547, -1823.77637, 13.04294,   0.00000, 0.00000, -0.24000);
	CreateDynamicObject(1482, 1939.44800, -1811.81665, 13.88452,   0.00000, 0.00000, -0.89995);
	CreateDynamicObject(934, 1939.93311, -1811.90430, 13.66568,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1939.64600, -1816.57678, 13.04294,   3.06000, -0.96000, -43.80000);
	CreateDynamicObject(970, 1940.03845, -1807.75134, 13.04294,   0.00000, 0.00000, 22.79999);
	CreateDynamicObject(970, 1938.09436, -1810.50891, 13.04294,   0.00000, 0.00000, -90.12000);
	CreateDynamicObject(970, 1938.11511, -1813.08826, 13.04294,   0.00000, 0.00000, -90.12000);
	CreateDynamicObject(1080, 1941.43005, -1814.92029, 14.65186,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1074, 1941.42932, -1813.72437, 14.60938,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1098, 1941.47021, -1812.50305, 14.59600,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1080, 1941.74841, -1807.29187, 12.97066,   -146.45996, 21.42004, -49.07998);
	CreateDynamicObject(1046, 1941.66846, -1811.13464, 16.01213,   81.18001, 0.72001, 88.37998);
	CreateDynamicObject(18766, 1909.06177, -1801.52808, 12.05815,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1909.04712, -1806.48584, 12.06589,   -90.12003, 328.92026, -31.19999);
	CreateDynamicObject(18766, 1908.86633, -1811.49060, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(18766, 1908.88159, -1816.39014, 12.06589,   -90.12003, 328.92026, -31.25999);
	CreateDynamicObject(970, 1912.33679, -1799.06079, 13.02890,   0.00000, 0.00000, -0.95998);
	CreateDynamicObject(970, 1906.14600, -1799.01379, 13.02890,   0.00000, 0.00000, -0.95998);
	CreateDynamicObject(16151, 1908.54785, -1807.46338, 12.89802,   0.00000, 0.00000, 179.45984);
	CreateDynamicObject(3171, 1906.09985, -1807.60217, 12.49284,   0.00000, 0.00000, 359.39996);
	CreateDynamicObject(1482, 1907.81506, -1807.48523, 11.13187,   0.00000, 0.00000, 358.13962);
	CreateDynamicObject(18766, 1918.93286, -1806.44495, 12.06589,   -90.06003, 328.80026, -31.25999);
	CreateDynamicObject(1482, 1908.45544, -1807.36438, 15.53886,   0.00000, 0.00000, 358.13962);
	CreateDynamicObject(1482, 1905.92590, -1807.33948, 12.74391,   1.74000, 179.69858, 361.91946);
	CreateDynamicObject(2682, 1909.37415, -1808.33142, 13.68351,   0.00000, 0.00000, -8.51999);
	CreateDynamicObject(1486, 1909.57190, -1807.74524, 13.66307,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1486, 1909.44800, -1809.18237, 13.66307,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1486, 1909.40930, -1810.16650, 13.66307,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2453, 1908.66443, -1810.82007, 13.87153,   0.00000, 0.00000, 2.04000);
	CreateDynamicObject(2860, 1909.55640, -1809.83850, 13.55027,   0.00000, 0.00000, 73.26000);
	CreateDynamicObject(19425, 1929.15161, -1816.78162, 12.47540,   0.00000, 0.00000, -90.66000);
	CreateDynamicObject(19425, 1929.17786, -1813.99817, 12.47540,   0.00000, 0.00000, -90.66000);
	CreateDynamicObject(19425, 1925.22668, -1816.59875, 12.47540,   0.00000, 0.00000, -90.66000);
	CreateDynamicObject(19425, 1925.24377, -1813.71179, 12.47540,   0.00000, 0.00000, -90.66000);
	CreateDynamicObject(19425, 1921.72607, -1816.43323, 12.47540,   0.00000, 0.00000, -90.66000);
	CreateDynamicObject(19425, 1921.73938, -1813.61743, 12.47540,   0.00000, 0.00000, -90.66000);
	CreateDynamicObject(2840, 1916.56067, -1808.46399, 12.50835,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2840, 1910.57141, -1807.33301, 12.50835,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11706, 1910.17444, -1805.65564, 12.51406,   0.00000, 0.00000, 84.96000);
	CreateDynamicObject(11706, 1922.80688, -1800.53369, 12.51406,   0.00000, 0.00000, 89.57999);
	CreateDynamicObject(970, 1906.00537, -1818.66797, 13.02890,   0.00000, 0.00000, 180.12012);
	CreateDynamicObject(970, 1908.92761, -1818.65076, 13.02890,   0.00000, 0.00000, 180.12012);
	CreateDynamicObject(625, 1911.43201, -1801.04370, 13.34750,   0.00000, 0.00000, 1.14000);
	CreateDynamicObject(1280, 1920.93311, -1802.26746, 13.48436,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1280, 1921.60315, -1802.23572, 13.48436,   0.00000, 0.00000, 179.64012);
	CreateDynamicObject(968, 1920.32202, -1797.56787, 12.55920,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(968, 1923.12646, -1797.56177, 12.55920,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(4642, 1921.67651, -1799.12036, 14.02787,   0.00000, 0.00000, -90.71996);
	CreateDynamicObject(19425, 1918.47339, -1813.61743, 12.47540,   0.00000, 0.00000, -90.66000);
	CreateDynamicObject(19425, 1918.46008, -1816.43323, 12.47540,   0.00000, 0.00000, -90.66000);

	//Hardcor Gang
	//ext
	CreateDynamicObject(18980, -8.57880, -268.51450, -1.53790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18980, 3.92030, -268.53720, -1.53790,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18980, -75.62430, -346.66879, -6.25150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18980, -75.51630, -359.86221, -6.53550,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18980, -75.62430, -345.68179, -6.25150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18980, -75.51630, -358.92221, -6.53550,   0.00000, 0.00000, 0.00000);

	//int
	new streetgang;
	streetgang = CreateDynamicObjectEx(19377, 883.938720, 1913.583984, -90.078689, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 883.938537, 1923.212768, -90.078697, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(14411, 876.425048, 1918.392944, -93.183601, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 10806, "airfence_sfse", "ws_oldpainted", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 872.116088, 1929.994384, -85.084701, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 870.527038, 1895.874511, -90.350799, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 915, "airconext", "CJ_plating", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 877.767272, 1920.379516, -88.508590, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 10351, "beach_sfs", "rocktb128", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 878.195800, 1920.386596, -88.508590, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 10351, "beach_sfs", "rocktb128", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 877.770019, 1915.878051, -88.508590, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 10351, "beach_sfs", "rocktb128", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 878.196960, 1915.875854, -88.508590, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 10351, "beach_sfs", "rocktb128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 878.606872, 1910.585327, -89.993026, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14577, "casinovault01", "cof_wood1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 878.607666, 1925.694213, -89.893028, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14577, "casinovault01", "cof_wood1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 883.508605, 1908.991210, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14577, "casinovault01", "cof_wood1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 883.511474, 1927.801757, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14577, "casinovault01", "cof_wood1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 888.230224, 1913.897583, -94.476509, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 888.233825, 1923.527221, -89.993026, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14577, "casinovault01", "cof_wood1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 861.943786, 1923.103027, -90.891799, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14756, "smallsfhs", "AH_flroortiledirt1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 861.943725, 1913.468383, -90.891799, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14756, "smallsfhs", "AH_flroortiledirt1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 877.358337, 1910.565795, -89.993026, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 18056, "mp_diner1", "mp_CJ_CARDBOARD128", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 878.197326, 1917.876464, -85.511001, 0.000000, 90.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 10351, "beach_sfs", "rocktb128", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 878.196472, 1922.856567, -85.521003, 0.000000, 90.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 10351, "beach_sfs", "rocktb128", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 877.771911, 1917.867187, -85.521003, 0.000000, 90.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 10351, "beach_sfs", "rocktb128", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 877.772766, 1922.848632, -85.521003, 0.000000, 90.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 10351, "beach_sfs", "rocktb128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 877.356384, 1925.694335, -89.993026, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 18056, "mp_diner1", "mp_CJ_CARDBOARD128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19360, 870.232055, 1908.741455, -85.278297, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 18056, "mp_diner1", "mp_CJ_CARDBOARD128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 876.650390, 1908.740844, -86.473014, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 18056, "mp_diner1", "mp_CJ_CARDBOARD128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 863.812927, 1908.742187, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 18056, "mp_diner1", "mp_CJ_CARDBOARD128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 872.488952, 1927.632324, -79.788597, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14735, "newcrak", "carp21S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19360, 870.198730, 1927.833007, -85.280296, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 18056, "mp_diner1", "mp_CJ_CARDBOARD128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 863.783325, 1927.831787, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 18056, "mp_diner1", "mp_CJ_CARDBOARD128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 872.444458, 1923.093627, -90.891799, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14756, "smallsfhs", "AH_flroortiledirt1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 861.616882, 1929.995727, -85.084701, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 876.619567, 1927.832885, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 18056, "mp_diner1", "mp_CJ_CARDBOARD128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19360, 856.767211, 1918.123168, -85.280097, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 18056, "mp_diner1", "mp_CJ_CARDBOARD128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 854.157592, 1927.830932, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 18056, "mp_diner1", "mp_CJ_CARDBOARD128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 856.765441, 1924.546264, -89.993026, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 18056, "mp_diner1", "mp_CJ_CARDBOARD128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 856.769470, 1911.703247, -95.261192, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "bank_wall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 854.185241, 1908.744750, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 18056, "mp_diner1", "mp_CJ_CARDBOARD128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 854.817382, 1920.367431, -85.084663, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 854.816833, 1910.804199, -85.082702, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 861.969909, 1906.630981, -85.084701, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 872.467346, 1906.629150, -85.084701, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 862.857116, 1927.654174, -79.788597, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14735, "newcrak", "carp21S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 872.479553, 1908.849365, -79.788597, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14735, "newcrak", "carp21S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 862.852050, 1908.848144, -79.788597, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14735, "newcrak", "carp21S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 853.219421, 1908.848266, -79.788597, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14735, "newcrak", "carp21S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 853.225524, 1927.655395, -79.788597, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14735, "newcrak", "carp21S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 856.848571, 1922.810180, -79.788597, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14735, "newcrak", "carp21S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 856.849548, 1913.177978, -79.788597, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14735, "newcrak", "carp21S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 877.322998, 1922.735229, -79.788597, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14735, "newcrak", "carp21S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 883.880371, 1927.698120, -85.084701, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3979, "civic01_lan", "sl_laglasswall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(18980, 877.492553, 1916.270141, -84.732452, 0.000000, 90.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 10351, "beach_sfs", "rocktb128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 877.323608, 1913.102050, -79.788597, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14735, "newcrak", "carp21S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 875.580627, 1911.348754, -84.361503, 90.000000, 0.006300, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 872.085327, 1911.348510, -84.361503, 90.000000, 0.006300, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 868.586608, 1911.348876, -84.361503, 90.000000, 0.006300, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 865.088439, 1911.348754, -84.361503, 90.000000, 0.006300, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 861.591979, 1911.349121, -84.361503, 90.000000, 0.006300, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 859.967407, 1913.126586, -84.361503, 90.000000, 0.006300, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 859.966796, 1916.624511, -84.361503, 90.000000, 0.006300, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 859.966003, 1920.121337, -84.361503, 90.000000, 0.006300, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 859.965515, 1923.546264, -84.361503, 90.000000, 0.006300, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 861.773315, 1925.289916, -84.361503, 90.000000, 0.006300, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 865.273620, 1925.291259, -84.361503, 90.000000, 0.006300, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 868.767578, 1925.292236, -84.361503, 90.000000, 0.006300, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 872.259216, 1925.293212, -84.361503, 90.000000, 0.006300, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 875.754150, 1925.293212, -84.361503, 90.000000, 0.006300, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19378, 872.078247, 1913.761718, -79.585372, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19378, 872.077209, 1923.396118, -79.585372, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19378, 861.581176, 1923.391967, -79.585372, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19378, 861.579895, 1913.760131, -79.585372, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 856.354370, 1920.227783, -89.420646, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3676, "lawnxref", "lasthoose6", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 856.355712, 1916.022338, -89.420646, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3676, "lawnxref", "lasthoose6", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 856.354370, 1918.179687, -91.299797, 90.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14415, "carter_block_2", "walp29S", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 872.331115, 1908.326904, -89.420646, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3676, "lawnxref", "lasthoose6", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 868.133300, 1908.329223, -89.420646, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3676, "lawnxref", "lasthoose6", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 868.101562, 1928.243774, -89.420646, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3676, "lawnxref", "lasthoose6", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 870.461914, 1928.244506, -86.532600, 90.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3676, "lawnxref", "lasthoose6", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 872.301879, 1928.245361, -89.420646, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3676, "lawnxref", "lasthoose6", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 856.354370, 1918.179687, -86.530601, 90.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3676, "lawnxref", "lasthoose6", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 870.461914, 1928.244506, -91.299797, 90.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14415, "carter_block_2", "walp29S", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 870.134826, 1908.334472, -91.299797, 90.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14415, "carter_block_2", "walp29S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 850.782287, 1918.157470, -90.891799, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "woodfloor1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 855.941345, 1924.546020, -89.993026, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 5040, "shopliquor_las", "lasjmliq1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 855.942993, 1911.703247, -89.993026, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 5040, "shopliquor_las", "lasjmliq1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19360, 855.941284, 1918.124633, -83.804100, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 851.084472, 1922.981567, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 5040, "shopliquor_las", "lasjmliq1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 843.128784, 1922.984985, -90.622993, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_gs_wall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 851.047973, 1913.256591, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 5040, "shopliquor_las", "lasjmliq1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 841.418273, 1913.256591, -80.306388, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 836.585815, 1918.095214, -93.805557, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 5040, "shopliquor_las", "lasjmliq1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 870.471008, 1939.123413, -94.395202, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 883.808349, 1908.670043, -85.084701, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3979, "civic01_lan", "sl_laglasswall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 883.004333, 1918.103759, -84.963699, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3979, "civic01_lan", "sl_laglasswall2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 883.404907, 1913.426269, -79.926200, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 883.387084, 1922.825439, -79.926200, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(14411, 870.112976, 1905.357788, -94.016853, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 10806, "airfence_sfse", "ws_oldpainted", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 872.250915, 1932.624877, -89.992996, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 4550, "skyscr1_lan2", "sl_librarycolmn2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 868.082092, 1932.573486, -89.992996, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 4550, "skyscr1_lan2", "sl_librarycolmn2", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 872.658020, 1936.959472, -91.814651, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14415, "carter_block_2", "walp29S", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 867.674072, 1936.960571, -91.814651, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14415, "carter_block_2", "walp29S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 869.474182, 1932.507568, -86.808578, -34.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3979, "civic01_lan", "sl_laglasswall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 872.056579, 1928.656982, -81.311630, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 4550, "skyscr1_lan2", "sl_librarycolmn2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 870.466430, 1947.658447, -85.019203, 70.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3979, "civic01_lan", "sl_laglasswall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 870.377075, 1954.475952, -86.135757, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 876.976440, 1937.372924, -92.572990, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14533, "pleas_dome", "club_zeb_SFW2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 863.356262, 1937.371948, -92.592948, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14533, "pleas_dome", "club_zeb_SFW2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 875.794189, 1941.295043, -92.572959, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14533, "pleas_dome", "club_zeb_SFW2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 865.140930, 1941.294799, -92.582977, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14533, "pleas_dome", "club_zeb_SFW2", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 870.578674, 1936.957885, -89.080497, 0.000000, 90.000000, -180.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14415, "carter_block_2", "walp29S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 875.692016, 1950.232421, -94.360702, 0.000000, 90.000000, 50.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 876.890930, 1952.115966, -94.362701, 0.000000, 90.000000, 70.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 877.444885, 1954.501953, -94.360702, 0.000000, 90.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 877.172729, 1956.861206, -94.362701, 0.000000, 90.000000, 110.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 875.778808, 1959.354492, -94.360702, 0.000000, 90.000000, 130.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 873.850952, 1960.975708, -94.362701, 0.000000, 90.000000, 150.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 866.746276, 1960.786010, -94.360702, 0.000000, 90.000000, 210.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 864.959838, 1959.166503, -94.362701, 0.000000, 90.000000, 230.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 863.778625, 1956.889404, -94.360702, 0.000000, 90.000000, 250.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 863.478881, 1954.286499, -94.362701, 0.000000, 90.000000, 270.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 864.225524, 1951.725830, -94.360702, 0.000000, 90.000000, 290.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 865.705566, 1949.746948, -94.362701, 0.000000, 90.000000, 310.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 867.637817, 1948.438354, -94.360702, 0.000000, 90.000000, 330.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 869.885009, 1947.877197, -94.362701, 0.000000, 90.000000, 350.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 871.969482, 1948.042968, -94.360702, 0.000000, 90.000000, 370.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19370, 874.029785, 1948.953735, -94.362701, 0.000000, 90.000000, 390.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "scratchedmetal", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 865.139892, 1944.064819, -89.992996, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 4550, "skyscr1_lan2", "sl_librarycolmn2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 862.222717, 1952.645385, -89.992996, 0.000000, 0.000000, 37.554321, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 6866, "vgncnstrct1", "Circus_gls_05", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 862.370544, 1956.755371, -89.992996, 0.000000, 0.000000, 358.902587, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 6866, "vgncnstrct1", "Circus_gls_05", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 864.130310, 1960.204467, -89.992996, 0.000000, 0.000000, 332.902679, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 6866, "vgncnstrct1", "Circus_gls_05", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 866.477478, 1962.040161, -89.992996, 0.000000, 0.000000, 314.474731, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 6866, "vgncnstrct1", "Circus_gls_05", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 872.341125, 1954.408691, -96.067947, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3922, "bistro", "Marble", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 862.011108, 1959.064086, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 6866, "vgncnstrct1", "Circus_gls_05", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 878.867919, 1959.069213, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 6866, "vgncnstrct1", "Circus_gls_05", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 878.714050, 1952.622070, -89.992996, 0.000000, 0.000000, -37.554298, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 6866, "vgncnstrct1", "Circus_gls_05", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 875.804382, 1944.042846, -89.992996, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 4550, "skyscr1_lan2", "sl_librarycolmn2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 878.724182, 1957.400390, -89.992996, 0.000000, 0.000000, -358.902587, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 6866, "vgncnstrct1", "Circus_gls_05", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 877.123840, 1959.497070, -89.992996, 0.000000, 0.000000, -332.902709, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 6866, "vgncnstrct1", "Circus_gls_05", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 870.458923, 1959.187011, -91.285873, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3922, "bistro", "Marble", 0x00000000);
	streetgang = CreateDynamicObjectEx(19381, 870.350830, 1959.102905, -82.429916, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 1414, "break_street1", "CJ_TV_SCREEN", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 870.470520, 1944.951660, -94.397201, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 880.874633, 1954.467773, -86.135757, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 859.885314, 1954.476806, -86.135757, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 870.382202, 1944.840820, -86.135757, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 880.867797, 1944.832763, -86.135757, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16639, "a51_labs", "ws_trainstationwin1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 870.467773, 1941.275756, -89.487998, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3979, "civic01_lan", "sl_laglasswall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 870.134826, 1908.328613, -86.530601, 90.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3676, "lawnxref", "lasthoose6", 0x00000000);
	streetgang = CreateDynamicObjectEx(18809, 870.432922, 1954.866088, -119.140869, 0.000000, 0.000000, 10.338688, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3922, "bistro", "Marble", 0x00000000);
	streetgang = CreateDynamicObjectEx(14411, 870.234436, 1931.825317, -94.016868, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 10806, "airfence_sfse", "ws_oldpainted", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 868.106018, 1903.885253, -89.992996, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 872.248291, 1903.961059, -89.992996, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 872.444396, 1913.465820, -90.891799, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14756, "smallsfhs", "AH_flroortiledirt1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 868.105224, 1894.255615, -89.992996, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 879.694702, 1888.511352, -92.276298, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "sl_metalwalk", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 876.976562, 1899.232910, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 872.989807, 1891.868164, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 882.621887, 1891.868041, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 879.166809, 1899.234619, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 885.025451, 1894.908447, -89.992996, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(1649, 836.624633, 1920.291625, -86.935699, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 15046, "svcunthoose", "csGarageTrolley01psd", 0xFA000000);
	streetgang = CreateDynamicObjectEx(19377, 831.377014, 1918.122314, -88.642196, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "woodfloor1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 850.662536, 1918.098876, -85.184646, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3979, "civic01_lan", "sl_laglasswall2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 840.160095, 1918.099121, -85.184646, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3979, "civic01_lan", "sl_laglasswall2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 840.281127, 1918.160522, -90.891799, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "woodfloor1", 0x00000000);
	streetgang = CreateDynamicObjectEx(1649, 836.628540, 1920.291748, -86.935699, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 15046, "svcunthoose", "csGarageTrolley01psd", 0xB4000000);
	streetgang = CreateDynamicObjectEx(1649, 836.624206, 1915.916137, -86.935699, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 15046, "svcunthoose", "csGarageTrolley01psd", 0xFA000000);
	streetgang = CreateDynamicObjectEx(14411, 835.439208, 1924.827148, -91.784126, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14476, "carlslounge", "AH_cheapredcarpet", 0x00000000);
	SetDynamicObjectMaterial(streetgang, 1, 9507, "boxybld2_sfw", "boxybox_sf3z", 0x00000000);
	streetgang = CreateDynamicObjectEx(18980, 836.318176, 1922.762817, -90.807792, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3676, "lawnxref", "lasthoose6", 0x00000000);
	SetDynamicObjectMaterial(streetgang, 1, 18835, "mickytextures", "wood051", 0x00000000);
	streetgang = CreateDynamicObjectEx(18980, 836.319030, 1913.590698, -90.807792, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3676, "lawnxref", "lasthoose6", 0x00000000);
	streetgang = CreateDynamicObjectEx(1649, 836.628723, 1915.854614, -86.935699, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 15046, "svcunthoose", "csGarageTrolley01psd", 0xB4000000);
	streetgang = CreateDynamicObjectEx(18980, 836.317749, 1910.377929, -84.857200, 0.000000, 90.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3676, "lawnxref", "lasthoose6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 839.483276, 1927.794677, -90.891799, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "woodfloor1", 0x00000000);
	streetgang = CreateDynamicObjectEx(1499, 838.317810, 1922.977539, -90.805702, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterial(streetgang, 1, 14650, "ab_trukstpc", "sa_wood08_128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 838.842041, 1927.780395, -87.122962, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_gs_wall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 834.068847, 1925.260131, -90.622978, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_gs_wall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 841.549255, 1922.988647, -83.051498, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_gs_wall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 831.681762, 1927.585327, -90.622993, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_gs_wall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 826.952392, 1922.855957, -90.632972, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_gs_wall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 831.216064, 1922.857788, -93.802803, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 9507, "boxybld2_sfw", "hospital3_sfw", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 831.196716, 1913.293334, -90.662971, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_gs_wall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 826.335876, 1918.029418, -90.642974, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_gs_wall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 829.659240, 1918.100097, -85.184646, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3979, "civic01_lan", "sl_laglasswall2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 834.330078, 1927.732788, -85.184646, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3979, "civic01_lan", "sl_laglasswall2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 843.126831, 1922.982910, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 5040, "shopliquor_las", "lasjmliq1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 841.551391, 1922.984863, -80.303298, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(1569, 888.144409, 1919.679931, -89.990798, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 8391, "ballys01", "vgncorpdoor1_512", 0x00000000);
	streetgang = CreateDynamicObjectEx(18075, 846.980895, 1918.067871, -85.259300, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 19595, "lsappartments1", "ceilingtiles3-128x128", 0x00000000);
	streetgang = CreateDynamicObjectEx(2370, 882.979370, 1913.127563, -90.194206, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	SetDynamicObjectMaterial(streetgang, 1, 14652, "ab_trukstpa", "CJ_WOOD6", 0x00000000);
	streetgang = CreateDynamicObjectEx(2370, 883.468017, 1922.822021, -90.194206, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	streetgang = CreateDynamicObjectEx(631, 879.211853, 1927.179687, -89.090171, 0.000000, 0.000000, 56.893260, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 17958, "burnsalpha", "plantb256", 0xFFCCFF33);
	streetgang = CreateDynamicObjectEx(631, 879.104736, 1909.546264, -89.090171, 0.000000, 0.000000, 56.893260, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 17958, "burnsalpha", "plantb256", 0xFFCCFF33);
	streetgang = CreateDynamicObjectEx(19443, 876.708679, 1919.769409, -90.888496, 0.000000, 90.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14415, "carter_block_2", "walp29S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19458, 883.493713, 1918.130493, -90.076599, 0.000000, 90.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14415, "carter_block_2", "walp29S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 887.696655, 1917.461547, -90.062301, 0.000000, 90.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14415, "carter_block_2", "walp29S", 0x00000000);
	streetgang = CreateDynamicObjectEx(638, 879.117919, 1914.015136, -89.385971, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	streetgang = CreateDynamicObjectEx(638, 879.135009, 1922.234619, -89.385971, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13691, "bevcunto2_lahills", "adeta", 0x00000000);
	streetgang = CreateDynamicObjectEx(19172, 888.147155, 1923.530883, -87.271766, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14489, "carlspics", "AH_picture3", 0x00000000);
	streetgang = CreateDynamicObjectEx(2262, 887.664245, 1921.426391, -86.801803, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14489, "carlspics", "AH_picture2", 0x00000000);
	streetgang = CreateDynamicObjectEx(2266, 887.630432, 1911.380493, -88.248008, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14489, "carlspics", "AH_picture4", 0x00000000);
	streetgang = CreateDynamicObjectEx(631, 887.647399, 1921.109863, -89.090171, 0.000000, 0.000000, 56.893260, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 4830, "airport2", "kbplanter_plants1", 0xFFCCFF33);
	streetgang = CreateDynamicObjectEx(631, 887.751342, 1915.322265, -89.090171, 0.000000, 0.000000, 56.893260, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 4830, "airport2", "kbplanter_plants1", 0xFFCCFF33);
	streetgang = CreateDynamicObjectEx(19089, 864.200073, 1918.067504, -76.544853, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19089, 870.590270, 1918.035278, -76.544853, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19929, 866.466918, 1940.129028, -93.959800, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	streetgang = CreateDynamicObjectEx(19929, 866.466857, 1937.269531, -94.765823, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 4835, "airoads_las", "aarprt8LAS", 0x00000000);
	streetgang = CreateDynamicObjectEx(19929, 866.464904, 1937.269165, -93.959800, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14581, "ab_mafiasuitea", "ab_wood01", 0x00000000);
	streetgang = CreateDynamicObjectEx(19929, 866.468383, 1940.130737, -94.765800, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 4835, "airoads_las", "aarprt8LAS", 0x00000000);
	streetgang = CreateDynamicObjectEx(14793, 870.623107, 1953.542358, -86.314201, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14634, "blindinglite", "ws_volumetriclight", 0x00000000);
	streetgang = CreateDynamicObjectEx(18809, 870.432922, 1954.866088, -119.150901, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3922, "bistro", "Marble", 0x00000000);
	streetgang = CreateDynamicObjectEx(1762, 826.999328, 1917.626342, -88.554702, 0.000000, 0.000000, 90.916130, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	SetDynamicObjectMaterial(streetgang, 1, 1730, "cj_furniture", "CJ-COUCHL2", 0x00000000);
	streetgang = CreateDynamicObjectEx(631, 836.023437, 1921.642089, -87.661300, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, -1, "none", "none", 0xFFCCFF33);
	streetgang = CreateDynamicObjectEx(631, 836.057067, 1914.610229, -87.661300, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, -1, "none", "none", 0xFFCCFF33);
	streetgang = CreateDynamicObjectEx(19376, 827.340515, 1909.616577, -90.662933, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_gs_wall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 822.496765, 1914.342285, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 9507, "boxybld2_sfw", "hospital3_sfw", 0x00000000);
	streetgang = CreateDynamicObjectEx(631, 827.840942, 1913.820922, -87.661300, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 1597, "centralresac1", "fuzzyplant256", 0xFFCCFF33);
	streetgang = CreateDynamicObjectEx(638, 855.366577, 1914.898559, -90.196998, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 4835, "airoads_las", "aarprt8LAS", 0x00000000);
	streetgang = CreateDynamicObjectEx(638, 855.430725, 1921.339599, -90.196998, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 4835, "airoads_las", "aarprt8LAS", 0x00000000);
	streetgang = CreateDynamicObjectEx(1704, 851.926025, 1916.222534, -90.804702, 0.000000, 0.000000, 177.552810, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(1704, 851.094543, 1920.005249, -90.804702, 0.000000, 0.000000, 2.201900, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(1704, 849.742858, 1916.184692, -90.804702, 0.000000, 0.000000, 177.302627, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(1704, 847.604125, 1916.287475, -90.804702, 0.000000, 0.000000, 181.268264, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(1704, 845.403259, 1916.239990, -90.804702, 0.000000, 0.000000, 178.953765, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(1704, 843.163879, 1916.270874, -90.804702, 0.000000, 0.000000, 182.697372, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(1704, 841.023376, 1916.303344, -90.804702, 0.000000, 0.000000, 182.201919, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(1704, 838.378417, 1917.702270, -90.804702, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(1704, 848.762817, 1920.002197, -90.804702, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(1704, 846.728515, 1920.065551, -90.804702, 0.000000, 0.000000, 2.323920, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(1704, 844.535827, 1920.031005, -90.804702, 0.000000, 0.000000, 358.038513, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(1704, 842.260742, 1920.030395, -90.804702, 0.000000, 0.000000, 2.081089, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(1704, 840.102783, 1920.002563, -90.804702, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14789, "ab_sfgymmain", "ab_wood02", 0x00000000);
	streetgang = CreateDynamicObjectEx(9093, 846.699096, 1913.332641, -87.774543, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2266, "picture_frame", "CJ_PAINTING30", 0x00000000);
	streetgang = CreateDynamicObjectEx(9093, 846.643676, 1922.902343, -87.774497, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14489, "carlspics", "AH_landscap1", 0x00000000);
	streetgang = CreateDynamicObjectEx(14793, 863.237243, 1918.238403, -79.884498, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14634, "blindinglite", "ws_volumetriclight", 0x00000000);
	streetgang = CreateDynamicObjectEx(14793, 831.018310, 1917.947143, -85.359497, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14634, "blindinglite", "ws_volumetriclight", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 883.731201, 1894.907714, -94.984649, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13724, "docg01_lahills", "marbletile8b", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 874.486206, 1888.520141, -97.425827, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "sl_metalwalk", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 884.858825, 1888.510986, -97.425827, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16640, "a51", "sl_metalwalk", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 879.740844, 1891.870727, -97.072570, 90.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 16093, "a51_ext", "BLOCK2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19360, 870.746337, 1907.915039, -85.278297, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19360, 867.540466, 1907.915161, -85.278297, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(925, 878.017272, 1898.195312, -93.869766, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 873.231750, 1894.910156, -94.984649, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13724, "docg01_lahills", "marbletile8b", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 870.176757, 1904.611083, -87.636306, 34.500000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 915, "airconext", "CJ_plating", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 881.024902, 1895.873535, -90.350799, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 915, "airconext", "CJ_plating", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 883.895874, 1903.963989, -94.007499, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 889.755187, 1899.636718, -94.007499, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 885.070312, 1900.910034, -94.007553, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 895.079467, 1904.090209, -95.076286, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14584, "ab_abbatoir01", "ab_tiles", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 873.233642, 1904.543945, -94.984649, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13724, "docg01_lahills", "marbletile8b", 0x00000000);
	streetgang = CreateDynamicObjectEx(19360, 885.581604, 1899.236450, -91.095397, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 889.799133, 1905.640625, -94.007499, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 893.492309, 1904.311523, -94.007499, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14387, "dr_gsnew", "mp_stonefloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 895.822570, 1905.199096, -93.297500, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 17504, "eastlstr_lae2", "compfence4_LAe", 0x00000000);
	streetgang = CreateDynamicObjectEx(19406, 891.642761, 1908.858764, -96.503112, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 12850, "cunte_block1", "ws_redbrickold", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 889.589294, 1909.226562, -95.857498, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 915, "airconext", "cj_sheet2", 0x00000000);
	streetgang = CreateDynamicObjectEx(18762, 893.685180, 1909.242309, -95.857498, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 915, "airconext", "cj_sheet2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19428, 891.758911, 1909.690673, -95.526397, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3355, "cxref_savhus", "des_brick1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19428, 891.758850, 1909.690673, -97.168403, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3355, "cxref_savhus", "des_brick1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19428, 891.756713, 1911.294067, -95.526397, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3355, "cxref_savhus", "des_brick1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19428, 891.759338, 1911.294433, -97.168403, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3355, "cxref_savhus", "des_brick1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19428, 892.680297, 1910.694458, -96.358352, 90.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3355, "cxref_savhus", "des_brick1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19428, 890.651672, 1910.674438, -96.358352, 90.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3355, "cxref_savhus", "des_brick1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19428, 891.487182, 1912.108276, -96.358398, 90.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3355, "cxref_savhus", "des_brick1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 836.594421, 1917.479003, -95.235076, 0.000000, 0.000000, 179.999954, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 831.196716, 1913.303344, -80.212989, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 835.366760, 1925.253540, -80.212989, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 826.966979, 1922.853149, -80.212989, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 826.352844, 1919.150634, -80.212989, 0.000000, 0.000000, 0.000007, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 831.722656, 1927.580566, -80.212989, 0.000000, 0.000000, 0.000007, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 888.480102, 1904.086181, -92.663566, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14584, "ab_abbatoir01", "ab_tiles", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 885.578125, 1904.088378, -92.076698, 0.000000, 55.000000, 180.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14584, "ab_abbatoir01", "ab_tiles", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 890.248107, 1904.130004, -98.110687, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13724, "docg01_lahills", "marbletile8b", 0x00000000);
	streetgang = CreateDynamicObjectEx(638, 876.807617, 1925.221435, -90.100852, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	streetgang = CreateDynamicObjectEx(631, 876.638427, 1927.138549, -89.898628, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 17958, "burnsalpha", "plantb256", 0xFFCCFF33);
	streetgang = CreateDynamicObjectEx(638, 874.770080, 1927.231933, -90.100799, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	streetgang = CreateDynamicObjectEx(631, 876.790832, 1909.391235, -89.898628, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 17958, "burnsalpha", "plantb256", 0xFFCCFF33);
	streetgang = CreateDynamicObjectEx(638, 876.775390, 1911.393554, -90.100852, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	streetgang = CreateDynamicObjectEx(638, 874.755859, 1909.302490, -90.100799, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 6282, "beafron2_law2", "boardwalk2_la", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 887.688232, 1918.942138, -90.060302, 0.000000, 90.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14415, "carter_block_2", "walp29S", 0x00000000);
	streetgang = CreateDynamicObjectEx(19443, 876.710021, 1916.568359, -90.890502, 0.000000, 90.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14415, "carter_block_2", "walp29S", 0x00000000);
	streetgang = CreateDynamicObjectEx(1761, 857.404113, 1910.803466, -90.807800, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	SetDynamicObjectMaterial(streetgang, 1, 1730, "cj_furniture", "CJ-COUCHL2", 0x00000000);
	streetgang = CreateDynamicObjectEx(1761, 857.426513, 1923.807006, -90.807800, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	SetDynamicObjectMaterial(streetgang, 1, 1730, "cj_furniture", "CJ-COUCHL2", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 888.233947, 1913.894775, -89.993026, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14577, "casinovault01", "cof_wood1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 888.231933, 1923.527221, -94.476501, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 883.508850, 1908.993164, -94.476501, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 878.608703, 1910.560791, -94.476501, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 878.609619, 1925.693603, -80.262283, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 883.511047, 1927.799804, -94.476501, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 878.609619, 1925.693603, -94.476501, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 883.512817, 1927.800292, -80.262298, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 888.231872, 1923.527221, -80.262298, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 888.230224, 1913.897583, -80.262298, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 883.508911, 1908.993164, -80.262298, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 878.608703, 1910.560791, -80.262298, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3998, "civic04_lan", "twintconc_LAn", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 856.768432, 1911.704467, -89.993026, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 18056, "mp_diner1", "mp_CJ_CARDBOARD128", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 856.767333, 1924.545898, -95.261199, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "bank_wall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 863.783813, 1927.829833, -95.261199, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "bank_wall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 854.158081, 1927.828979, -95.261199, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "bank_wall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 876.621032, 1927.830444, -95.261199, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "bank_wall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 877.354431, 1925.693969, -95.261199, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "bank_wall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 877.356323, 1910.566162, -95.261199, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "bank_wall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 876.649536, 1908.742675, -95.261199, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "bank_wall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 841.418273, 1913.254638, -89.992996, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 5040, "shopliquor_las", "lasjmliq1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 851.047180, 1913.258422, -80.306396, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 855.941101, 1911.703857, -80.306396, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 855.939270, 1924.546020, -80.306396, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19360, 855.943298, 1918.124755, -85.280097, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 5040, "shopliquor_las", "lasjmliq1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 851.083618, 1922.979736, -80.306396, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 843.127807, 1922.981201, -80.306396, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 841.549316, 1922.986694, -83.051498, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 5040, "shopliquor_las", "lasjmliq1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 841.418945, 1913.256469, -95.235076, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 851.047180, 1913.258422, -95.235099, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 855.941101, 1911.703857, -95.235099, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 855.939270, 1924.546020, -95.235099, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 851.083618, 1922.979736, -95.235099, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 843.127807, 1922.981201, -95.235099, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14709, "lamidint2", "mp_apt1_roomwall", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 861.831420, 1954.409545, -96.067947, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3922, "bistro", "Marble", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 860.979125, 1959.187011, -99.645812, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3922, "bistro", "Marble", 0x00000000);
	streetgang = CreateDynamicObjectEx(14793, 892.099914, 1967.751342, -89.775711, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14634, "blindinglite", "ws_volumetriclight", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 879.988464, 1959.187011, -99.645812, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3922, "bistro", "Marble", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 869.239440, 1944.689208, -96.067947, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3922, "bistro", "Marble", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 879.639343, 1944.687377, -96.067947, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3922, "bistro", "Marble", 0x00000000);
	streetgang = CreateDynamicObjectEx(19377, 869.475830, 1933.523071, -85.104705, 0.000000, 90.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 3979, "civic01_lan", "sl_laglasswall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 838.822814, 1927.800781, -80.212989, 0.000000, 0.000000, 0.000007, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 827.343444, 1909.620483, -80.212989, 0.000000, 0.000000, 0.000007, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 822.606262, 1914.352905, -80.212989, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 840.817077, 1923.003417, -80.212989, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19329, 890.385375, 1902.603027, -97.241989, -89.999984, 97.599945, 1.700000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14612, "ab_abattoir_box", "ab_bloodfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19406, 891.642761, 1909.008911, -96.503112, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 12850, "cunte_block1", "ws_redbrickold", 0x00000000);
	streetgang = CreateDynamicObjectEx(19329, 892.524658, 1906.039306, -98.011024, 89.699996, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14612, "ab_abattoir_box", "ab_bloodfloor", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 863.809814, 1908.742675, -95.261199, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "bank_wall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 854.259582, 1908.752685, -95.261199, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 13007, "sw_bankint", "bank_wall1", 0x00000000);
	streetgang = CreateDynamicObjectEx(14793, 874.147583, 1918.238403, -79.884498, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14634, "blindinglite", "ws_volumetriclight", 0x00000000);
	streetgang = CreateDynamicObjectEx(9093, 877.221862, 1918.211303, -82.184547, 0.000000, 0.000000, 0.000014, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 5719, "sunrise10_lawn", "eld_box_law", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 872.523498, 1927.621582, -74.892982, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 862.943664, 1927.621582, -74.892982, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 853.364074, 1927.621582, -74.892982, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 856.864379, 1922.797485, -74.892982, 0.000000, 0.000000, 179.899993, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 856.857666, 1913.218017, -74.892982, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 861.583496, 1908.852172, -74.892982, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 871.113342, 1908.852172, -74.892982, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 880.723144, 1908.852172, -74.892982, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 877.304443, 1922.761718, -74.892982, 0.000000, 0.000000, 179.899993, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19376, 877.287963, 1913.182250, -74.892982, 0.000000, 0.000000, 179.899993, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 14789, "ab_sfgymmain", "gym_floor6", 0x00000000);
	streetgang = CreateDynamicObjectEx(19172, 856.857604, 1913.134277, -88.195861, 0.000000, 0.000000, 89.999946, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2266, "picture_frame", "CJ_PAINTING11", 0x00000000);
	streetgang = CreateDynamicObjectEx(19172, 856.857604, 1923.024780, -88.195861, 0.000000, 0.000000, 89.999946, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 0, 2266, "picture_frame", "CJ_PAINTING28", 0x00000000);
	streetgang = CreateDynamicObjectEx(2266, 858.822753, 1927.228515, -89.415863, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14489, "carlspics", "AH_picture2", 0x00000000);
	streetgang = CreateDynamicObjectEx(2266, 859.652893, 1927.228515, -88.645866, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 7088, "casinoshops1", "GB_nastybar19", 0x00000000);
	streetgang = CreateDynamicObjectEx(2266, 859.842895, 1909.341918, -89.135856, 0.000000, 0.000000, 179.199981, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14489, "carlspics", "AH_landscap1", 0x00000000);
	streetgang = CreateDynamicObjectEx(2266, 858.852661, 1909.355224, -88.265869, 0.000000, 0.000000, 179.199981, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14489, "carlspics", "AH_picture3", 0x00000000);
	streetgang = CreateDynamicObjectEx(2266, 831.892944, 1913.887329, -86.866279, 0.000000, 0.000000, -179.999969, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14489, "carlspics", "AH_picture3", 0x00000000);
	streetgang = CreateDynamicObjectEx(19329, 831.903076, 1913.405273, -86.756271, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14489, "carlspics", "AH_picture3", 0x00000000);
	SetDynamicObjectMaterialText(streetgang, 0, "{000000} KOVA", 130, "Ariel", 40, 1, 0x00000000, 0x00000000, 1);
	streetgang = CreateDynamicObjectEx(19329, 831.913085, 1913.405273, -86.676292, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	SetDynamicObjectMaterial(streetgang, 1, 14489, "carlspics", "AH_picture3", 0x00000000);
	SetDynamicObjectMaterialText(streetgang, 0, "{000000} created by", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	streetgang = CreateDynamicObjectEx(19329, 858.853454, 1908.880859, -88.140342, 0.000000, 0.000000, -0.699999, 150.00, 150.00);
	SetDynamicObjectMaterialText(streetgang, 0, "{000000} KOVA", 130, "Ariel", 40, 1, 0x00000000, 0x00000000, 1);
	streetgang = CreateDynamicObjectEx(19329, 858.853454, 1908.880859, -88.050338, 0.000000, 0.000000, -0.699999, 150.00, 150.00);
	SetDynamicObjectMaterialText(streetgang, 0, "{000000} created by", 130, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
	streetgang = CreateDynamicObjectEx(19777, 883.061462, 1913.095458, -89.231330, 0.000000, 0.000000, -45.600013, 150.00, 150.00);
	SetDynamicObjectMaterialText(streetgang, 0, "{ffffff} by KOVA", 140, "Ariel", 80, 1, 0x00000000, 0x00000000, 1);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	streetgang = CreateDynamicObjectEx(4206, 872.586181, 1958.017211, -94.904640, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19370, 871.646789, 1961.746704, -94.360702, 0.000000, 90.000000, 170.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19370, 868.946838, 1961.702758, -94.362701, 0.000000, 90.000000, 190.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19604, 870.414672, 1959.056396, -89.923736, -90.000000, 90.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19377, 859.972839, 1944.843383, -86.135757, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 866.572753, 1947.374755, -96.020698, 0.000000, 0.000000, 60.077301, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 869.515747, 1946.382934, -96.020698, 0.000000, 0.000000, 82.636909, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 872.490905, 1946.565795, -96.020698, 0.000000, 0.000000, 283.673767, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 875.163146, 1947.851562, -96.020698, 0.000000, 0.000000, 306.488311, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 869.473999, 1945.946166, -96.020698, 0.000000, 0.000000, 82.636909, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 872.593322, 1946.120605, -96.020698, 0.000000, 0.000000, 283.673767, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 875.411254, 1947.439453, -96.020698, 0.000000, 0.000000, 306.488311, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 866.527770, 1946.942749, -96.020698, 0.000000, 0.000000, 60.077301, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 872.560058, 1946.272827, -96.020698, 0.000000, 0.000000, 283.673767, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 875.334350, 1947.569580, -96.020698, 0.000000, 0.000000, 306.488311, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 875.251342, 1947.706298, -96.020698, 0.000000, 0.000000, 306.488311, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 872.522521, 1946.429077, -96.020698, 0.000000, 0.000000, 283.673767, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 869.482299, 1946.116577, -96.020698, 0.000000, 0.000000, 82.636909, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 866.609130, 1947.091796, -96.020698, 0.000000, 0.000000, 60.077301, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 869.518432, 1946.272827, -96.020698, 0.000000, 0.000000, 82.636909, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19373, 866.582458, 1947.260620, -96.020698, 0.000000, 0.000000, 60.077301, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19377, 860.685302, 1902.469970, -90.891799, 0.000000, 90.000000, -0.009100, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1569, 888.148193, 1916.680664, -89.990798, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2290, 884.343750, 1911.428466, -89.992599, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2292, 885.833801, 1923.784057, -89.992599, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18075, 883.574768, 1929.447265, -85.172996, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18075, 883.512268, 1906.758300, -85.172996, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(14455, 880.262512, 1909.340332, -88.360603, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(14455, 885.985839, 1909.347167, -88.360603, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2292, 885.842468, 1922.800659, -89.992599, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2292, 881.684570, 1922.687133, -89.994598, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2292, 881.670532, 1923.641845, -89.992599, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(14455, 884.552490, 1927.466674, -88.360603, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(14455, 890.294494, 1927.467895, -88.360603, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2290, 882.775634, 1925.450317, -89.992599, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2292, 881.307983, 1913.844970, -89.992599, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2292, 881.320617, 1912.920288, -89.994598, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2292, 885.283630, 1913.859619, -89.992599, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2292, 885.299011, 1912.955322, -89.992599, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2245, 883.300537, 1913.454589, -89.109397, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2245, 883.802124, 1923.168823, -89.109397, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(14562, 866.280761, 1960.322998, -93.090980, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(14562, 874.633544, 1960.336791, -93.091003, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19172, 888.138122, 1913.359619, -87.271766, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2262, 887.634643, 1925.631347, -88.429199, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2266, 887.639526, 1915.321777, -86.678596, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1897, 864.216552, 1918.064697, -83.992500, 90.000000, 90.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1897, 864.220336, 1918.037353, -83.992500, 90.000000, 90.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1897, 864.195007, 1918.038330, -83.992500, 90.000000, 90.000000, 270.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1897, 864.278869, 1918.090209, -83.992500, 90.000000, 90.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1897, 870.585205, 1918.006103, -83.992500, 90.000000, 90.000000, 270.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1897, 870.610534, 1918.005126, -83.992500, 90.000000, 90.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1897, 870.606750, 1918.032470, -83.992500, 90.000000, 90.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1897, 870.681701, 1918.052124, -83.992500, 90.000000, 90.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19089, 870.590270, 1918.035278, -76.544853, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1897, 870.585205, 1918.006103, -83.992500, 90.000000, 90.000000, 270.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1897, 870.610534, 1918.005126, -83.992500, 90.000000, 90.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1897, 870.606750, 1918.032470, -83.992500, 90.000000, 90.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1897, 870.681701, 1918.052124, -83.992500, 90.000000, 90.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2076, 864.188171, 1916.944335, -84.651512, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2076, 863.178771, 1918.077148, -84.651512, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2076, 864.193359, 1919.114135, -84.651512, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2073, 864.192016, 1918.058593, -84.167068, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2076, 870.585571, 1919.081054, -84.651512, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2076, 869.589843, 1918.036621, -84.651512, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2076, 870.583557, 1916.924804, -84.651512, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2076, 871.671447, 1918.040283, -84.651512, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2073, 870.579528, 1918.023803, -84.167068, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1744, 865.096313, 1938.063842, -92.839202, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1744, 865.075927, 1940.000610, -92.233177, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1744, 865.095825, 1939.998535, -92.839202, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1744, 865.096313, 1938.063842, 1940.000610, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1744, 865.076293, 1938.062866, -92.233200, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2350, 867.445983, 1940.890258, -93.940101, 0.000000, 0.000000, 348.269592, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2350, 867.344726, 1938.163085, -93.940101, 0.000000, 0.000000, 20.175800, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2350, 867.354614, 1939.471679, -93.940101, 0.000000, 0.000000, 31248.269531, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2290, 875.189941, 1943.084350, -94.307403, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2290, 875.203002, 1940.136962, -94.307403, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2311, 873.579162, 1941.390014, -94.307998, 0.000000, 0.000000, 89.089958, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2311, 873.591186, 1938.331054, -94.307998, 0.000000, 0.000000, 90.504013, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19824, 873.450927, 1942.950927, -93.804191, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19820, 873.637939, 1942.114624, -93.804313, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1509, 873.783447, 1939.338256, -93.602653, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1509, 873.829284, 1938.276123, -93.602653, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1509, 866.527954, 1939.724731, -92.836662, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19824, 865.414184, 1937.978271, -91.894989, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19823, 865.411010, 1938.184692, -91.894798, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1517, 865.364013, 1940.200073, -92.299018, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19821, 865.478942, 1939.397094, -91.896911, 0.000000, 0.000000, 54.283119, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19822, 865.335510, 1940.380615, -92.500411, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1512, 865.425720, 1940.068969, -91.693557, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 865.342224, 1940.860107, -92.499977, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 873.780639, 1941.702758, -93.803359, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1512, 865.444030, 1940.694335, -92.298561, 0.000000, 0.000000, 350.906280, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 865.507812, 1940.817382, -92.499977, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 865.494995, 1940.936767, -92.499977, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 865.365051, 1941.023681, -92.499977, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 865.378601, 1941.084838, -91.890937, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 865.274780, 1941.114624, -92.499977, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 865.361450, 1941.244506, -92.499977, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19822, 865.509887, 1941.286132, -92.500411, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19822, 865.516052, 1940.365722, -91.894386, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1517, 865.325012, 1939.942626, -92.299018, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1517, 865.514892, 1940.068847, -92.299018, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1517, 865.464721, 1939.932250, -92.299018, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1517, 865.435974, 1939.814086, -92.299018, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19822, 865.322143, 1939.637695, -92.500411, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19822, 865.481750, 1939.476684, -92.500411, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19824, 865.340393, 1939.198730, -92.499992, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19824, 865.520446, 1939.078247, -92.499992, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19824, 865.321838, 1938.916625, -92.499992, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19824, 865.502197, 1938.878051, -92.499992, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19824, 865.323669, 1938.716430, -92.499992, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19823, 865.475341, 1938.699951, -92.499801, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19823, 865.329040, 1939.405883, -92.499801, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19823, 865.553466, 1939.257568, -92.499801, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19823, 865.304260, 1938.492065, -92.499801, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1517, 865.450744, 1938.465087, -91.696029, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1517, 865.538635, 1938.288940, -92.299018, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1517, 865.483093, 1937.745849, -92.299018, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1517, 865.341308, 1937.779663, -92.299018, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19824, 865.414184, 1937.978271, -92.499992, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19823, 865.411010, 1938.184692, -92.499801, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1517, 865.450744, 1938.465087, -92.299018, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19822, 865.516052, 1940.365722, -92.500411, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 865.497863, 1941.098022, -92.499977, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 865.473388, 1940.954467, -91.890937, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 865.340820, 1940.879394, -91.890937, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 865.510742, 1940.797607, -91.890937, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19822, 865.398071, 1941.258300, -91.894386, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1512, 865.417053, 1940.570800, -92.298561, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19821, 865.335388, 1939.594848, -91.896911, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19821, 865.471557, 1939.817626, -91.896911, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19821, 865.396972, 1940.656616, -91.896911, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19821, 865.343139, 1939.135375, -91.896911, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1512, 865.327575, 1940.230346, -91.693557, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1512, 865.455261, 1939.248779, -91.693557, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1512, 865.331726, 1938.970092, -91.693557, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1512, 865.389465, 1938.789672, -91.693557, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19823, 865.503784, 1938.291015, -91.894798, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19823, 865.317199, 1938.378417, -91.894798, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19823, 865.300476, 1938.617675, -91.894798, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19824, 865.335205, 1937.672607, -91.894989, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19824, 865.503723, 1937.844360, -91.894989, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 873.627990, 1939.919799, -93.803359, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18075, 870.271850, 1941.620483, -89.583297, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 867.082397, 1911.112792, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 865.210754, 1911.132446, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 863.438110, 1911.122192, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 861.804504, 1911.093505, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 860.131225, 1911.108276, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 868.920654, 1911.179809, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 870.681091, 1911.185058, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 872.400878, 1911.153808, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 874.262695, 1911.135131, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 876.224731, 1911.115600, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 859.669860, 1912.366455, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 859.709167, 1914.345458, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 859.760437, 1916.148071, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 859.764953, 1918.049072, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 859.788513, 1919.628906, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 859.822998, 1921.608276, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 859.875793, 1923.641723, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 876.095031, 1925.469726, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 873.954711, 1925.463256, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 871.834716, 1925.422851, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 869.735534, 1925.413818, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 867.251281, 1925.391723, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 864.757690, 1925.344970, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 862.369140, 1925.385009, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 860.291809, 1925.354003, -85.196800, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 864.197692, 1917.277099, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 864.196472, 1917.717529, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 864.207885, 1918.397705, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 864.211242, 1918.837890, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 863.895874, 1918.047973, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 863.439575, 1918.059570, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 864.490539, 1918.057739, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 864.884643, 1918.048706, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 869.895935, 1918.013061, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 870.337951, 1918.010498, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 870.599304, 1917.771850, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 870.578308, 1918.323852, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 870.920837, 1918.018676, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 871.395202, 1918.014282, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 870.580627, 1917.269531, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 870.591064, 1918.776489, -83.969802, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 869.963745, 1949.749145, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 871.846313, 1949.899169, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 873.418762, 1950.617553, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 874.587707, 1951.754394, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 875.360900, 1953.190673, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 875.591186, 1955.079711, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 875.317871, 1956.541137, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 874.456298, 1958.068969, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 868.323608, 1950.169555, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 866.703552, 1951.230590, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 865.645874, 1952.860107, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 865.264709, 1954.867309, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 865.633300, 1956.858276, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 866.563415, 1958.300781, -94.111701, 180.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2184, 829.638610, 1918.608276, -88.556800, 0.000000, 0.000000, 112.564208, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2184, 828.909118, 1915.765380, -88.556800, 0.000000, 0.000000, 69.625183, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1754, 833.321350, 1914.055175, -88.555900, 0.000000, 0.000000, 195.992752, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1754, 830.485412, 1914.051879, -88.555900, 0.000000, 0.000000, 160.614334, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2082, 831.412414, 1913.363891, -88.554512, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2059, 829.294067, 1919.254760, -87.750503, 0.000000, 0.000000, 270.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19786, 829.536132, 1922.875488, -86.534263, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2344, 831.731872, 1914.104370, -88.053001, 0.000000, 0.000000, 113.967498, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1742, 826.331054, 1921.764282, -88.554702, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1742, 826.329162, 1920.325805, -88.554702, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2332, 826.851379, 1914.134887, -86.338180, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2332, 826.851379, 1914.134887, -88.153213, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2332, 826.851379, 1914.134887, -87.244178, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1569, 856.900390, 1923.151733, -84.999702, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1569, 856.927001, 1911.741455, -84.999702, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1569, 856.947448, 1917.587890, -84.999702, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1569, 862.054565, 1927.543701, -84.999702, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1569, 873.323791, 1927.565673, -84.999702, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1569, 873.040161, 1908.891235, -84.999702, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1569, 861.894836, 1908.914184, -84.999702, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19920, 828.989624, 1917.689331, -87.769599, 0.000000, 0.000000, 343.484710, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19172, 826.422546, 1918.032226, -86.599166, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2266, 826.941711, 1916.003417, -86.712722, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2357, 850.236694, 1918.149047, -90.403869, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2357, 845.977844, 1918.148071, -90.403869, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2357, 841.722534, 1918.146972, -90.403869, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18075, 883.529541, 1920.151000, -85.069992, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2076, 865.320251, 1918.069213, -84.651512, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19303, 884.061645, 1893.293457, -93.585418, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(3014, 884.331604, 1892.423461, -94.797981, 0.000000, 0.000000, 2.952558, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19303, 882.314147, 1893.293579, -93.585403, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2680, 883.182800, 1893.407714, -93.742500, -30.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19303, 880.565979, 1893.295043, -93.585403, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19303, 878.819213, 1893.294555, -93.585403, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19303, 877.070190, 1893.292236, -93.585403, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19303, 875.322998, 1893.292480, -93.585403, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2680, 879.703735, 1893.385375, -93.742500, -30.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2680, 876.207092, 1893.410278, -93.742500, -30.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2040, 883.302795, 1892.266113, -94.796600, 0.000000, 0.000000, 20.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2359, 884.282226, 1894.400390, -94.692001, 0.000000, 0.000000, 18.146400, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2359, 878.830322, 1892.695190, -91.984397, 0.000000, 0.000000, 128.146392, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2040, 883.019531, 1892.280639, -94.796577, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2040, 882.759155, 1892.359741, -94.796577, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2040, 883.304199, 1892.802734, -94.796600, 0.000000, 0.000000, 10.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2040, 883.651977, 1892.288330, -94.796577, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2040, 882.451721, 1892.697387, -94.796600, 0.000000, 0.000000, 2310.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(3014, 880.913452, 1892.442993, -94.797981, 0.000000, 0.000000, 351.004821, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(3014, 883.751342, 1892.932617, -94.797981, 0.000000, 0.000000, 351.004821, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2358, 880.174133, 1892.238281, -94.795196, 0.000000, 0.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2358, 880.006713, 1892.752319, -94.795196, 0.000000, 0.000000, 192.167190, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2358, 879.336730, 1892.331054, -94.795196, 0.000000, 0.000000, 172.585006, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2358, 879.135559, 1892.918212, -94.795196, 0.000000, 0.000000, 172.585006, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2040, 878.827270, 1892.325195, -94.796600, 0.000000, 0.000000, 2310.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2040, 878.573608, 1892.913330, -94.796600, 0.000000, 0.000000, 2312120.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2985, 876.092041, 1892.684204, -94.896400, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2358, 875.075256, 1892.310668, -94.795196, 0.000000, 0.000000, 172.585006, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2358, 875.273376, 1892.843627, -94.795196, 0.000000, 0.000000, 179.699157, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(358, 883.480651, 1891.990844, -93.747673, 0.000000, 0.000000, 6.609360, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(358, 883.480651, 1891.990844, -93.041656, 0.000000, 0.000000, 6.609360, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(358, 883.480651, 1891.990844, -93.344673, 0.000000, 0.000000, 6.609360, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(358, 882.344970, 1891.933471, -92.940658, 0.000000, 0.000000, 6.609360, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(358, 882.344970, 1891.933471, -93.242652, 0.000000, 0.000000, 6.609360, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(357, 882.392028, 1891.950683, -93.654411, 0.000000, 0.000000, 7.258399, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(357, 881.354187, 1891.978637, -94.056396, 0.000000, 5.000000, 7.258399, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(357, 881.354187, 1891.978637, -93.554412, 0.000000, 5.000000, 7.258399, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(356, 879.975097, 1891.964599, -93.963943, 0.000000, 0.000000, 4.166958, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(356, 880.489562, 1891.943115, -93.051856, 0.000000, 0.000000, 4.166958, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(356, 880.489562, 1891.943115, -92.748847, 0.000000, 0.000000, 4.166958, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(356, 879.856811, 1891.935791, -93.561950, 0.000000, 0.000000, 4.166958, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(355, 878.230346, 1891.962890, -93.771057, 0.000000, 0.000000, 4.286859, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(355, 879.005249, 1891.971435, -92.961013, 0.000000, 0.000000, 4.286859, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(355, 878.964904, 1892.002563, -93.263999, 0.000000, 0.000000, 184.286895, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(355, 877.823364, 1892.004516, -93.364997, 0.000000, 0.000000, 184.799072, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(372, 877.851501, 1891.960449, -94.249458, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(372, 881.882995, 1891.951416, -94.569976, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(372, 881.244689, 1891.966064, -93.134376, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(353, 877.461975, 1892.021728, -93.835113, 0.000000, 0.000000, 187.143539, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(353, 877.461975, 1892.021728, -94.236099, 0.000000, 0.000000, 187.143539, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(941, 884.311401, 1895.735961, -94.491661, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(923, 873.681884, 1898.495849, -94.090263, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(923, 873.347045, 1892.479736, -94.191261, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1271, 875.117858, 1898.388793, -94.600730, 0.000000, 0.000000, 19.877969, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1271, 876.172546, 1898.425659, -94.600700, 0.000000, 0.000000, 129.878005, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1271, 875.284545, 1897.367553, -94.600730, 0.000000, 0.000000, 351.940856, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1271, 871.975708, 1892.894653, -94.600730, 0.000000, 0.000000, 351.940856, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(11729, 883.568298, 1898.799560, -94.896469, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(11729, 882.891235, 1898.800659, -94.896469, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(14411, 886.773620, 1901.068115, -98.090896, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(3092, 891.685852, 1910.355468, -96.893997, 90.000000, 90.000000, 224.699783, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1805, 892.696166, 1903.925415, -97.830596, 0.000000, 88.000000, 331.300292, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(941, 890.355712, 1902.336669, -97.719886, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2907, 890.174133, 1901.981933, -97.147300, 0.000000, 0.000000, 335.996002, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2905, 890.656921, 1902.023681, -97.245437, 0.000000, 0.000000, 9.406450, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2908, 890.059631, 1902.704956, -97.189498, 0.000000, 0.000000, 261.832977, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2906, 890.539306, 1903.256225, -97.205596, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19583, 890.817504, 1903.322875, -97.237899, 0.000000, 0.000000, 344.007141, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(341, 889.879699, 1900.975585, -97.803497, 0.000000, 30.000000, 26.372840, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19924, 890.147216, 1902.610473, -95.013778, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19590, 890.304504, 1902.777587, -97.221298, 0.000000, 90.000000, 192.838867, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(3092, 892.484680, 1904.737182, -97.928298, 180.000000, 90.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2907, 891.932922, 1909.912231, -97.004302, 0.000000, 0.000000, 335.996002, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2905, 891.069824, 1909.505981, -97.027397, 0.000000, 0.000000, 17.048099, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2906, 892.284729, 1909.474243, -97.042701, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1463, 891.546691, 1911.464477, -97.211593, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1463, 892.306762, 1910.453979, -97.175605, 0.000000, 0.000000, 69.300003, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18694, 891.512023, 1911.340942, -101.443695, 91.499977, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19632, 901.447875, 1909.789062, -97.263168, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1463, 891.123535, 1909.961547, -97.275611, 0.000000, 0.000000, 147.700042, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1463, 892.927917, 1907.830688, -97.715599, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2805, 892.948608, 1906.119995, -96.915496, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2805, 892.322814, 1906.123046, -96.915496, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1370, 893.029907, 1900.156127, -97.519996, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2060, 890.221496, 1908.139038, -97.775199, 0.000000, 0.000000, 101.132202, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2060, 890.221496, 1908.139038, -97.934196, 0.000000, 0.000000, 84.351898, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1897, 893.273620, 1906.115478, -96.136802, 270.000000, 90.000000, 180.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2671, 891.352294, 1906.766479, -98.010803, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(3675, 891.619445, 1912.182739, -88.904693, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2359, 884.024169, 1892.755126, -91.984397, 0.000000, 0.000000, 18.146400, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2358, 884.573852, 1897.593383, -94.795196, 0.000000, 0.000000, 282.838928, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1544, 890.758117, 1903.568237, -97.256896, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1893, 872.465332, 1895.286010, -90.444297, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1893, 877.485168, 1895.181396, -90.444297, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1893, 881.643371, 1894.997192, -90.444297, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(1893, 892.099121, 1901.948852, -94.867103, 0.000000, 0.000000, 90.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2082, 856.929748, 1909.006469, -90.804656, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2082, 856.964721, 1926.548461, -90.804656, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2251, 857.326354, 1909.542480, -89.461402, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2251, 857.359375, 1927.052856, -89.461402, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18676, 865.653503, 1954.438110, -95.980865, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18676, 865.653503, 1954.438110, -95.980865, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18676, 867.390075, 1951.026611, -95.980865, 0.000000, 0.000000, 43.199996, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18676, 867.390075, 1951.026611, -95.980865, 0.000000, 0.000000, 43.199996, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18676, 872.795471, 1950.744140, -95.980865, 0.000000, 0.000000, 135.999954, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18676, 872.795471, 1950.744140, -95.980865, 0.000000, 0.000000, 135.999954, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18676, 875.194763, 1953.604736, -95.980865, 0.000000, 0.000000, 164.699981, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18676, 875.194763, 1953.604736, -95.980865, 0.000000, 0.000000, 164.699981, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 867.359130, 1959.069580, -93.105117, 90.800003, 174.900009, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 867.359130, 1959.055175, -92.025215, 90.800003, 174.900009, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 867.359130, 1959.039916, -90.925300, 90.800003, 174.900009, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 867.359130, 1959.023803, -89.705383, 90.800003, 174.900009, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 867.359130, 1959.003784, -88.285552, 90.800003, 174.900009, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 873.550231, 1959.073974, -88.284637, 90.800003, 174.900009, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 873.603576, 1959.066040, -93.135231, 90.800003, 174.900009, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 873.545715, 1959.077148, -92.064971, 90.800003, 174.900009, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 873.547546, 1959.083007, -90.974723, 90.800003, 174.900009, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2707, 873.548400, 1959.075073, -89.654670, 90.800003, 174.900009, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18676, 866.509094, 1957.755859, -95.970878, 0.000000, 0.000000, -22.899990, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18676, 866.509094, 1957.755859, -95.970878, 0.000000, 0.000000, -22.899990, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18676, 874.660339, 1957.331665, -95.970848, 0.000000, 0.000000, -159.999954, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18676, 874.660339, 1957.331665, -95.970848, 0.000000, 0.000000, -159.999954, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2232, 875.842041, 1947.651611, -90.719268, 0.000000, 0.000000, -88.500030, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2232, 865.115722, 1947.378417, -90.719268, 0.000000, 0.000000, 90.599922, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19152, 879.953491, 1962.379882, -91.200660, 0.000000, 0.000000, -32.099994, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19150, 870.650390, 1957.571533, -85.254829, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19152, 860.222473, 1961.486694, -90.560722, 0.000000, 0.000000, 35.800003, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19149, 870.016418, 1954.829956, -79.951271, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19152, 861.515380, 1952.832885, -92.418624, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19152, 879.675598, 1955.763061, -92.418624, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19294, 870.386474, 1960.429565, -70.595695, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19148, 871.652893, 1968.259643, -76.624084, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19156, 878.267883, 1961.580078, -88.756233, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19156, 863.397888, 1961.580078, -88.756233, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19152, 871.045471, 1957.105834, -81.776359, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19152, 867.612609, 1952.628417, -101.203414, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(18748, 891.606689, 1909.242675, -98.484703, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(337, 889.995605, 1907.334106, -97.238685, 177.999877, -8.399998, 170.199996, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2261, 857.349182, 1910.436035, -89.185867, 0.000000, 0.000000, 90.000022, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2261, 857.349182, 1925.565795, -89.185867, 0.000000, 0.000000, 90.000022, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19295, 869.754150, 1917.670776, -70.165901, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19295, 834.356933, 1922.335449, -95.926383, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19295, 849.796936, 1918.435424, -72.306396, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19295, 846.757446, 1918.497070, -109.406349, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(19295, 897.164184, 1917.670776, -91.675865, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2074, 891.567016, 1907.003173, -95.386337, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2074, 891.567016, 1907.003173, -95.386337, 0.000000, 0.000000, 0.000000, 150.00, 150.00);
	streetgang = CreateDynamicObjectEx(2855, 882.979309, 1913.056518, -89.385307, 0.000000, 0.000000, -45.999996, 150.00, 150.00);

	//Toll - Flint
	CreateObject(8168, 61.25604, -1533.39465, 6.10425,   0.00000, 0.00000, 9.92526);
	CreateObject(8168, 40.96660, -1529.57251, 6.10425,   0.00000, 0.00000, 188.57129);
	CreateObject(966, 35.88975, -1526.00964, 4.24106,   0.00000, 0.00000, 270.67566);
	CreateObject(966, 67.09373, -1536.82751, 3.99106,   0.00000, 0.00000, 87.33780);
	CreateObject(973, 52.97949, -1531.92529, 5.09049,   0.00000, 0.00000, 352.06006);
	CreateObject(973, 49.04207, -1531.50659, 5.17587,   0.00000, 0.00000, 352.05688);

	//Toll - LV
	CreateObject(8168, 1789.83203, 703.18945, 15.84637,   0.00000, 3.00000, 99.24951);
	CreateObject(8168, 1784.83350, 703.94800, 16.07064,   0.00000, 357.00000, 278.61096);
	CreateObject(966, 1781.41223, 697.32532, 14.63691,   0.00000, 0.00000, 348.09009);
	CreateObject(966, 1793.42896, 709.87982, 13.63691,   0.00000, 0.00000, 169.43665);
	CreateObject(973, 1771.58691, 702.35260, 15.03000,   0.00000, 0.00000, 131.87990);
	CreateObject(973, 1804.35840, 710.90863, 13.90900,   0.00000, 0.00000, 206.40012);
	CreateObject(970, 1781.71448, 699.19360, 14.93310,   0.00000, 0.00000, 79.26010);
	CreateObject(970, 1792.94360, 707.78748, 14.22510,   0.00000, 0.00000, 79.80003);

	Tflint[0] = CreateDynamicObject(968, 35.838928222656, -1525.9034423828, 5.0012145042419, 0.000000, -90.000000, 270.67565917969, -1);
	Tflint[1] = CreateDynamicObject(968, 67.116600036621, -1536.8218994141, 4.7504549026489, 0.000000, -90.000000, 87.337799072266, -1);

	TollLv[0] = CreateDynamicObject(968, 1781.4133300781, 697.31750488281, 15.420023918152, 0.000000, -90.000000, 348.10229492188, -1);
	TollLv[1] = CreateDynamicObject(968, 1793.6700439453, 709.84631347656, 14.405718803406, 0.000000, -90.000000, 169.43664550781, -1);

    pTollArea[0] = CreateDynamicSphere(40.3993, -1522.9064, 5.1910, 4.0, -1, -1);
	pTollArea[1] = CreateDynamicSphere(62.3336, -1540.1075, 5.0645, 4.0, -1, -1);
	pTollArea[2] = CreateDynamicSphere(1795.9447, 704.2550, 15.0006, 4.0, -1, -1);
	pTollArea[3] = CreateDynamicSphere(1778.9886, 702.6728, 15.2574, 4.0, -1, -1);

    //trasher
	new label[128];
	for(new i; i < sizeof(TrashData); i++)
	{
	    format(label, sizeof(label), "%s\n{FFFFFF}\n/trash /pickup to drop trash or collect trash.", (TrashData[i][TrashType] == TYPE_BIN) ? ("Trash Bin") : ("Dumpster"));
		TrashData[i][TrashLabel] = CreateDynamic3DTextLabel(label, 0x2ECC71FF, TrashData[i][TrashX], TrashData[i][TrashY], TrashData[i][TrashZ]+1.25, 15.0, .testlos = 1);
		TrashData[i][TrashLevel] = (TrashData[i][TrashType] == TYPE_BIN) ? 1 : 2;
	}
	for(new i; i < sizeof(FactoryData); i++)
	{
	    format(label, sizeof(label), "Recycling Factory - %s\n\n{FFFFFF}Current Trash Bags: {F39C12}0\n{FFFFFF}Bring trash here to earn money!", FactoryData[i][FactoryName]);
		FactoryData[i][FactoryLabel] = CreateDynamic3DTextLabel(label, 0x2ECC71FF, FactoryData[i][FactoryX], FactoryData[i][FactoryY], FactoryData[i][FactoryZ] + 0.5, 15.0, .testlos = 1);
		FactoryData[i][FactoryCP] = CreateDynamicCP(FactoryData[i][FactoryX], FactoryData[i][FactoryY], FactoryData[i][FactoryZ], 6.0);
	}

	for(new i, m = GetPlayerPoolSize(); i <= m; i++)
	{
	    if(!IsPlayerConnected(i)) continue;
		Trash_InitPlayer(i);
	}
	//electric
	for(new i; i < sizeof(ElectricData); i++)
	{
	    format(label, sizeof(label), "Electrican Point\n/services to service.");
		ElectricData[i][ElectricLabel] = CreateDynamic3DTextLabel(label, 0x2ECC71FF, ElectricData[i][ElectricX], ElectricData[i][ElectricY], ElectricData[i][ElectricZ]+1.25, 15.0, .testlos = 1);
	}
	tangga1 = CreateDynamicObject(1428, -770.86072, 2740.76587, 42.99480,   13.00000, 0.00000, 0.00000);
	tangga2 = CreateObject(1428, -1462.87024, 2527.30664, 53.48190,   7.00000, 0.00000, -130.00000);
	//Auction
	AuctionText = CreateDynamicObject(18244, 189.572525, -80.501548, 1032.988037, 89.999946, -0.499999, 0.699999, -1, -1, -1, 250.00, 250.00);
	SetDynamicObjectMaterialText(AuctionText, 0, "{FFFF00}Welcome\nTo Los Santos\n{FFFF00}Auction Office", 90, "Ariel", 20, 1, 0x00000000, 0x00000001, 1);
	HighBidText = CreateDynamicObject(3077, 195.396118, -81.974838, 1030.729858, 0.000000, 0.000000, -36.599998, -1, -1, -1, 300.00, 300.00);
	//hydr
	hydr[0] = CreateDynamicObject(19817, 2193.24243, -2199.99780, 10.96290,   0.00000, 0.00000, 44.40000);
	hydr[1] = CreateDynamicObject(19817, 2199.55225, -2193.81885, 10.96290,   0.00000, 0.00000, 44.40000);
	hydr[2] = CreateDynamicObject(19817, 2186.67017, -2206.51807, 10.96290,   0.00000, 0.00000, 44.04000);
	hydr[3] = CreateDynamicObject(19817, 2201.54321, -2237.80566, 10.88290,   0.00000, 0.00000, -136.98000);
	hydr[4] = CreateDynamicObject(19817, 2208.19092, -2231.78809, 10.86690,   0.00000, 0.00000, -136.98000);
	hydr[5] = CreateDynamicObject(19817, 2214.58667, -2225.68530, 10.85890,   0.00000, 0.00000, -136.98000);

	objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
	//----------------------------------------------------------------------------------------------------
    CreateDynamicObject(19379, 1435.35657, -1227.07996, 151.31239,   360.00000, 90.00000, 0.00000);
	CreateDynamicObject(19379, 1424.86401, -1227.07996, 151.31239,   360.00000, 90.00000, 1080.00000);
	g_Discord_AndroVerifed = DCC_FindChannelById("905805208033054720");
	g_discord_twt = DCC_FindChannelById("862531909727944775");
	g_Discord_adslogs = DCC_FindChannelById("863082017985789962");
	g_discord_ban = DCC_FindChannelById("865071798650535936");
	g_discord_admins = DCC_FindChannelById("864854692831952936");
	g_Discord_PcVerived = DCC_FindChannelById("865873292921798666");
	g_Discord_Information = DCC_FindChannelById("905805451520774164");
	g_discord_botcmd = DCC_FindChannelById("864671043763044352");
	g_Admin_Command = DCC_FindChannelById("835257449349906453");
	g_discord_logs = DCC_FindChannelById("905805451520774164");

	DCC_SetBotActivity("BremX Share GM Roleplay | "TEXT_GAMEMODE"");

	//Butcher
    new obuther = CreateDynamicObject(1439, 944.436828, 2127.660644, 1010.021179, 0.000000, 0.000000, -90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(obuther, 0, 2803, "cj_meaty", "CJ_FLESH_2", 0x00000000);
	CreatePickup(1275, 23, 960.7062,2099.4375,1011.0248,0);
	meatsp = CreateDynamicSphere(960.7062,2099.4375,1011.0248, 2.0);

	CreateDynamic3DTextLabel("Start Work: {f7ae11}H",0xFFFFFFFF,940.1020,2127.6326,1011.0303,5.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,0, 0);

	//-------------------------------------------------

	SpawnMale = LoadModelSelectionMenu("spawnmale.txt");
	SpawnFemale = LoadModelSelectionMenu("spawnfemale.txt");
	MaleSkins = LoadModelSelectionMenu("maleskin.txt");
	FemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
	VIPMaleSkins = LoadModelSelectionMenu("maleskin.txt");
	VIPFemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
	SAPDMale = LoadModelSelectionMenu("sapdmale.txt");
	SAPDFemale = LoadModelSelectionMenu("sapdfemale.txt");
	SAPDWar = LoadModelSelectionMenu("sapdwar.txt");
	SAGSMale = LoadModelSelectionMenu("sagsmale.txt");
	SAGSFemale = LoadModelSelectionMenu("sagsfemale.txt");
	SAMDMale = LoadModelSelectionMenu("samdmale.txt");
	SAMDFemale = LoadModelSelectionMenu("samdfemale.txt");
	SANEWMale = LoadModelSelectionMenu("sanewmale.txt");
	SANEWFemale = LoadModelSelectionMenu("sanewfemale.txt");
	toyslist = LoadModelSelectionMenu("toys.txt");
	rentjoblist = LoadModelSelectionMenu("rentjoblist.txt");
	sportcar = LoadModelSelectionMenu("sportcar.txt");
 	boatlist = LoadModelSelectionMenu("boatlist.txt");
	viptoyslist = LoadModelSelectionMenu("viptoys.txt");
	vtoylist = LoadModelSelectionMenu("vtoylist.txt");

	SAGSLobbyBtn[0] = CreateButton(1388.987670, -25.291969, 1001.358520, 180.000000);
	SAGSLobbyBtn[1] = CreateButton(1391.275756, -25.481920, 1001.358520, 0.000000);
	SAGSLobbyDoor = CreateDynamicObject(1569, 1389.375000, -25.387500, 999.978210, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);

	SAPDLobbyBtn[0] = CreateButton(252.95264, 107.67332, 1004.00909, 264.79898);
	SAPDLobbyBtn[1] = CreateButton(253.43437, 110.62970, 1003.92737, 91.00000);
	SAPDLobbyDoor[0] = CreateDynamicObject(1569, 253.10965, 107.61060, 1002.21368,   0.00000, 0.00000, 91.00000);
	SAPDLobbyDoor[1] = CreateDynamicObject(1569, 253.12556, 110.49657, 1002.21460,   0.00000, 0.00000, -91.00000);

	SAPDLobbyBtn[2] = CreateButton(239.82739, 116.12640, 1004.00238, 91.00000);
	SAPDLobbyBtn[3] = CreateButton(238.75888, 116.12949, 1003.94086, 185.00000);
	SAPDLobbyDoor[2] = CreateDynamicObject(1569, 239.69435, 116.15908, 1002.21411,   0.00000, 0.00000, 91.00000);
	SAPDLobbyDoor[3] = CreateDynamicObject(1569, 239.64050, 119.08750, 1002.21332,   0.00000, 0.00000, 270.00000);

	//Family Button
	LLFLobbyBtn[0] = CreateButton(-2119.90039, 655.96808, 1062.39954, 184.67528);
	LLFLobbyBtn[1] = CreateButton(-2119.18481, 657.88519, 1062.39954, 90.00000);
	LLFLobbyDoor = CreateDynamicObject(1569, -2119.21509, 657.54187, 1060.73560,   0.00000, 0.00000, -90.00000);

	printf("[Object] Number of Dynamic objects loaded: %d", CountDynamicObjects());
	DCC_SendChannelMessage(g_Discord_Information, "```Server Sudah Kembali Online, Happy Roleplaying.``` @everyone");
	return 1;
}

public OnGameModeExit()
{
	print("-------------- [ Auto Gmx ] --------------");
	new count = 0, count1 = 0, user = 0;
	foreach(new gsid : GStation)
	{
		if(Iter_Contains(GStation, gsid))
		{
			count++;
			GStation_Save(gsid);
		}
	}
	printf("[Gas Station] Number of Saved: %d", count);

	foreach(new pid : Plants)
	{
		if(Iter_Contains(Plants, pid))
		{
			count1++;
			Plant_Save(pid);
		}
	}
	printf("[Farmer Plant] Number of Saved: %d", count1);
	for (new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			OnPlayerDisconnect(i, 1);
		}
	}
	//trasher
	for(new i, m = GetPlayerPoolSize(); i <= m; i++)
	{
	    if(!IsPlayerConnected(i)) continue;
	    Trash_ResetPlayer(i, 1);
	}
	foreach(new i : Player)
	{
		user++;
		UpdatePlayerData(i);
	}
	printf("[Database] User Saved: %d", user);
	print("-------------- [ Auto Gmx ] --------------");
	SendClientMessageToAll(COLOR_RED, "[!]"YELLOW_E" Sorry Server is Maintenance/Restart.{00FFFF} ~BremX Share GM CITY BOTS");
	new msg[100];
	format(msg, sizeof(msg), "```The Server Is Now __Restarted__. [Database] User Saved: %d```", user);
	DCC_SendChannelMessage(g_Discord_Information, msg);

	UnloadTazerSAPD();
	SaveActors();
	//Audio_DestroyTCPServer();
	mysql_close(g_SQL);
	return 1;
}

/*
forward CheckPlayers(playerid);
public CheckPlayers(playerid)
{
	new str[20];

	format(str, sizeof(str), "Server ON %s Players In City", number_format(Iter_Count(Player)));
	DCC_SetEmbedDescription(Discord_Stats, str);
	return 1;
}*/

public OnPlayerPressButton(playerid, buttonid)
{
	if(buttonid == SAGSLobbyBtn[0] || buttonid == SAGSLobbyBtn[1])
	{
	    if(pData[playerid][pFaction] == 2)
	    {
	        MoveDynamicObject(SAGSLobbyDoor, 1387.9232, -25.3887, 999.9782, 3);
			SetTimer("SAGSLobbyDoorClose", 5000, 0);
	    }
		else
	    {
	        Error(playerid, "Access denied.");
			return 1;
		}
	}
	if(buttonid == SAPDLobbyBtn[0] || buttonid == SAPDLobbyBtn[1])
	{
		if(pData[playerid][pFaction] == 1)
		{
			MoveDynamicObject(SAPDLobbyDoor[0], 253.14204, 106.60210, 1002.21368, 3);
			MoveDynamicObject(SAPDLobbyDoor[1], 253.24377, 111.94370, 1002.21460, 3);
			SetTimer("SAPDLobbyDoorClose", 5000, 0);
		}
		else
	    {
	        Error(playerid, "Access denied.");
			return 1;
		}
	}
	if(buttonid == SAPDLobbyBtn[2] || buttonid == SAPDLobbyBtn[3])
	{
		if(pData[playerid][pFaction] == 1)
		{
			MoveDynamicObject(SAPDLobbyDoor[2], 239.52385, 114.75534, 1002.21411, 3);
			MoveDynamicObject(SAPDLobbyDoor[3], 239.71977, 120.21591, 1002.21332, 3);
			SetTimer("SAPDLobbyDoorClose", 5000, 0);
		}
		else
	    {
	        Error(playerid, "Access denied.");
			return 1;
		}
	}
	if(buttonid == LLFLobbyBtn[0] || buttonid == LLFLobbyBtn[1])
	{
		if(pData[playerid][pFamily] == 0)
		{
			MoveDynamicObject(LLFLobbyDoor, -2119.27148, 656.04028, 1060.73560, 3);
			SetTimer("LLFLobbyDoorClose", 5000, 0);
		}
		else
		{
			Error(playerid, "Access denied.");
			return 1;
		}
	}
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!ispassenger)
	{
		if(IsSAPDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 1)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "You are not SAPD!");
			}
		}
		if(IsGovCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 2)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "You are not SAGS!");
			}
		}
		if(IsSAMDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 3)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "You are not SAMD!");
			}
		}
		if(IsSANACar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 4)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "You are not SANEW!");
			}
		}
		if(GetVehicleModel(vehicleid) == 548 || GetVehicleModel(vehicleid) == 417 || GetVehicleModel(vehicleid) == 487 || GetVehicleModel(vehicleid) == 488 ||
		GetVehicleModel(vehicleid) == 497 || GetVehicleModel(vehicleid) == 563 || GetVehicleModel(vehicleid) == 469)
		{
			if(pData[playerid][pLevel] < 5)
			{
				RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
				Error(playerid, "Anda tidak memiliki izin!");
			}
		}
	}
	return 1;
}

public OnPlayerText(playerid, text[])
{
    new fmt_str[128];
    format(fmt_str, sizeof fmt_str, "```%s Says: %s```", pData[playerid][pName], text);
    DCC_SendChannelMessage(g_discord_logs, fmt_str);

	if(isnull(text)) return 0;
	printf("[CHAT] %s(%d) : %s", pData[playerid][pName], playerid, text);

	if(pData[playerid][pSpawned] == 0 && pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be spawned or logged in to use chat.");
	    return 0;
	}
	text[0] = toupper(text[0]);
	if(!strcmp(text, "rpgun", true) || !strcmp(text, "gunrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s take the weapon off the belt and ready to shoot anytime.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpsavegun", true) || !strcmp(text, "savegunrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s safe a weapon in dueffel bag.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcrash", true) || !strcmp(text, "crashrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s shocked after crash.", ReturnName(playerid));
		return 0;
	}
	if(pData[playerid][pAdminDuty] == 1)
	{
		SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s: "WHITE_E"(( %s ))", pData[playerid][pAdminname], text);
		SetPlayerChatBubble(playerid, text, COLOR_RED, 10.0, 3000);
		return 0;
	}
	if(text[0] == '@')
	{
		if(pData[playerid][pSMS] != 0)
		{
			if(pData[playerid][pPhoneCredit] < 1)
			{
				Error(playerid, "You dont have phone credits!");
				return 0;
			}
			if(pData[playerid][pInjured] != 0)
			{
				Error(playerid, "You cant do at this time.");
				return 0;
			}
			new tmp[512];
			if(text[0] == '!')
			{
				if(text[1] == ' ')
				{
			 		format(tmp, sizeof(tmp), "%s", text[2]);
				}
				else
				{
				    format(tmp, sizeof(tmp), "%s", text[1]);
				}
				if(pData[playerid][pPhone] == pData[playerid][pSMS])
				{
					if(playerid == INVALID_PLAYER_ID || !IsPlayerConnected(playerid))
					{
						Error(playerid, "This number is not actived!");
						return 0;
					}
					SendClientMessageEx(playerid, COLOR_YELLOW, "[SMS to %d]"WHITE_E" %s", pData[playerid][pSMS], tmp);
					SendClientMessageEx(playerid, COLOR_YELLOW, "[SMS from %d]"WHITE_E" %s", pData[playerid][pPhone], tmp);
					PlayerPlaySound(playerid, 6003, 0,0,0);
					pData[playerid][pSMS] = pData[playerid][pPhone];

					pData[playerid][pPhoneCredit] -= 1;
					return 0;
				}
			}
		}
	}
	if(GetPVarInt(playerid,"911"))
    {
		new Float:x, Float:y, Float:z, String[100];
		GetPlayerPos(playerid, x, y, z);
		Info(playerid, "Warning: This number for emergency crime only! please wait for SAPD respon!");
		SendFactionMessage(1, COLOR_BLUE, "[EMERGENCY CALL] "WHITE_E"%s calling the emergency crime! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
		format(String, sizeof(String), "[Description]: "WHITE_E"%s", text);
		SendFactionMessage(1, COLOR_BLUE, String);
		DeletePVar(playerid, "911");
		return 0;
	}
	if(GetPVarInt(playerid,"922"))
    {
		new Float:x, Float:y, Float:z, String[100];
		GetPlayerPos(playerid, x, y, z);
		Info(playerid, "Warning: This number for emergency medical only! please wait for SAMD respon!");
		SendFactionMessage(3, COLOR_PINK2, "[EMERGENCY CALL] "WHITE_E"%s calling the emergency medical! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
		format(String, sizeof(String), "[Description]: "WHITE_E"%s", text);
		SendFactionMessage(1, COLOR_PINK2, String);
		DeletePVar(playerid, "922");
		return 0;
	}
	if(GetPVarInt(playerid,"933"))
    {
		new Float:x, Float:y, Float:z, String[100];
		GetPlayerPos(playerid, x, y, z);
		Info(playerid, "Your calling has sent to the taxi driver. please wait for respon!");
		foreach(new tx : Player)
		{
			if(pData[tx][pJob] == 1 || pData[tx][pJob2] == 1)
			{
				SendClientMessageEx(tx, COLOR_YELLOW, "[TAXI CALL] "WHITE_E"%s calling the taxi for order! Ph: ["GREEN_E"%d"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
                format(String, sizeof(String), "[Description]: "WHITE_E"%s", text);
				SendFactionMessage(1, COLOR_YELLOW, String);
			}
		}
		DeletePVar(playerid, "933");
		return 0;
	}
	new sgm[128];
	foreach(new i : Player)
	if(pData[playerid][pUsingWT] == 1)
   	{
        if(pData[i][pWT] == pData[playerid][pWT])
        {
			SendClientMessageEx(i, COLOR_LIME, "[WT:%d] "YELLOW_E"%s: %s", pData[playerid][pWT], ReturnName(playerid), text);
			format(sgm, sizeof(sgm), "[<WT>]\n* %s *", sgm);
			SetPlayerChatBubble(i, sgm, COLOR_LBLUE, 5.0, 5000);
        }
	}
	if(pData[playerid][pCall] != INVALID_PLAYER_ID)
	{

		UpperToLower(text);
		new lstr[1024];
		format(lstr, sizeof(lstr), "(cellphone) %s says: %s", ReturnName(playerid), text);
		ProxDetector(10, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
		SetPlayerChatBubble(playerid, text, COLOR_WHITE, 10.0, 3000);

		SendClientMessageEx(pData[playerid][pCall], COLOR_YELLOW, "[CELLPHONE] "WHITE_E"%s.", text);
		return 0;
	}
	else SendMessageInChat(playerid, text);
	return 0;
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    if (result == -1)
    {
        Error(playerid, "the command '/%s' not registered on the server see '(/help)'.", cmd);
        return 0;
    }
	printf("[CMD]: %s(%d) has used the command '%s' (%s)", pData[playerid][pName], playerid, cmd, params);
	//dc
    new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    return 1;
}
/*public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == LoginTDS)
    {
    	new string[100];
        PlayerPlaySound(playerid, 1058, 0, 0, 0);
        format(string, sizeof string, "Nickname (%s), Input Your Password", pData[playerid][pName]);
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", string, "Login", "Abort");
    }
    return 1;
}*/
public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == phTextD[20][playerid])
    {
        PlayerPlaySound(playerid, 1058, 0, 0, 0);
		strcat(EnteredPhoneNumb[playerid], "1");
		PlayerTextDrawSetString(playerid, phTextD[5][playerid], EnteredPhoneNumb[playerid]);
    }

    if(playertextid == phTextD[21][playerid])
    {
        PlayerPlaySound(playerid, 1058, 0, 0, 0);
		strcat(EnteredPhoneNumb[playerid], "2");
		PlayerTextDrawSetString(playerid, phTextD[5][playerid], EnteredPhoneNumb[playerid]);
    }

    if(playertextid == phTextD[22][playerid])
    {
        PlayerPlaySound(playerid, 1058, 0, 0, 0);
		strcat(EnteredPhoneNumb[playerid], "3");
		PlayerTextDrawSetString(playerid, phTextD[5][playerid], EnteredPhoneNumb[playerid]);
    }

    if(playertextid == phTextD[23][playerid])
    {
        PlayerPlaySound(playerid, 1058, 0, 0, 0);
       	strcat(EnteredPhoneNumb[playerid], "4");
       	PlayerTextDrawSetString(playerid, phTextD[5][playerid], EnteredPhoneNumb[playerid]);
    }

    if(playertextid == phTextD[24][playerid])
    {
        PlayerPlaySound(playerid, 1058, 0, 0, 0);
       	strcat(EnteredPhoneNumb[playerid], "5");
       	PlayerTextDrawSetString(playerid, phTextD[5][playerid], EnteredPhoneNumb[playerid]);
    }

    if(playertextid == phTextD[25][playerid])
    {
        PlayerPlaySound(playerid, 1058, 0, 0, 0);
       	strcat(EnteredPhoneNumb[playerid], "6");
       	PlayerTextDrawSetString(playerid, phTextD[5][playerid], EnteredPhoneNumb[playerid]);
    }

    if(playertextid == phTextD[26][playerid])
    {
        PlayerPlaySound(playerid, 1058, 0, 0, 0);
       	strcat(EnteredPhoneNumb[playerid], "7");
       	PlayerTextDrawSetString(playerid, phTextD[5][playerid], EnteredPhoneNumb[playerid]);
    }

    if(playertextid == phTextD[27][playerid])
    {
        PlayerPlaySound(playerid, 1058, 0, 0, 0);
       	strcat(EnteredPhoneNumb[playerid], "8");
       	PlayerTextDrawSetString(playerid, phTextD[5][playerid], EnteredPhoneNumb[playerid]);
    }

    if(playertextid == phTextD[28][playerid])
    {
        PlayerPlaySound(playerid, 1058, 0, 0, 0);
       	strcat(EnteredPhoneNumb[playerid], "9");
    	PlayerTextDrawSetString(playerid, phTextD[5][playerid], EnteredPhoneNumb[playerid]);
    }

    if(playertextid == phTextD[29][playerid])
    {
        PlayerPlaySound(playerid, 1058, 0, 0, 0);
        strcat(EnteredPhoneNumb[playerid], "0");
    	PlayerTextDrawSetString(playerid, phTextD[5][playerid], EnteredPhoneNumb[playerid]);
    }

    if(playertextid == phTextD[30][playerid])
    {
		new numbs = strlen(EnteredPhoneNumb[playerid]);

        if(numbs == 1) strdel(EnteredPhoneNumb[playerid], 0, 1);
        if(numbs == 2) strdel(EnteredPhoneNumb[playerid], 1, 2);
        if(numbs == 3) strdel(EnteredPhoneNumb[playerid], 2, 3);
        if(numbs == 4) strdel(EnteredPhoneNumb[playerid], 3, 4);
        if(numbs == 5) strdel(EnteredPhoneNumb[playerid], 4, 5);
        if(numbs == 6) strdel(EnteredPhoneNumb[playerid], 5, 6);

        PlayerPlaySound(playerid, 1137, 0, 0, 0);
    	PlayerTextDrawSetString(playerid, phTextD[5][playerid], EnteredPhoneNumb[playerid]);
    }

    if(playertextid == phTextD[31][playerid])
    {
		if(!CallingNum[playerid])
		{
			PlayerPlaySound(playerid, 3600, 0, 0, 0);
			CallingNum[playerid] = true;

			PlayerTextDrawSetString(playerid, phTextD[5][playerid], "Dialing");
			PlayerTextDrawSetString(playerid, phTextD[31][playerid], "~r~h");
		}

		else if(CallingNum[playerid])
		{
        	PlayerPlaySound(playerid, 1058, 0, 0, 0);
			CallingNum[playerid] = false;

			PlayerTextDrawSetString(playerid, phTextD[5][playerid], EnteredPhoneNumb[playerid]);
			PlayerTextDrawSetString(playerid, phTextD[31][playerid], "~g~c");
		}

    }
    if(playertextid == EditVObjTD[playerid][4])
    {
    	if(IsPlayerInAnyVehicle(playerid))
    	{
    		HideEditVehicleTD(playerid);
    		new x = GetPlayerVehicleID(playerid);
    		foreach(new i: PVehicles)
			{
				if(x == pvData[i][cVeh])
				{
    				MySQL_SaveVehicleToys(i);
    			}
    		}
    	}
    }
    else if(playertextid == EditVObjTD[playerid][6])
    {
    	HideEditVehicleTD(playerid);
    	Info(playerid, "You has canceled edit vehicle toys position");
    }
    else if(playertextid == EditVObjTD[playerid][2])
    {
    	AddVObjPos(playerid);
    }
    else if(playertextid == EditVObjTD[playerid][3])
    {
    	SubVObjPos(playerid);
    }
    else if(playertextid == EditVObjTD[playerid][7])
    {
    	ShowPlayerDialog(playerid, VTOYSET_VALUE, DIALOG_STYLE_INPUT, "Vehicle Toy PosX", "Set current float value\nNormal Value = 0.05\n\nEnter Float NudgeValue in here:", "Edit", "Cancel");
    }
    else if(playertextid == ToysTDsave[playerid])
    {
    	HideEditToysTD(playerid);
    	SetPVarInt(playerid, "UpdatedToy", 1);
    	Info(playerid, "You has saved toys position");
    }
    else if(playertextid == ToysTDup[playerid])
    {
    	AddTObjPos(playerid);
    }
    else if(playertextid == ToysTDdown[playerid])
    {
    	SubTObjPos(playerid);
    }
    else if(playertextid == ToysTDedit[playerid])
    {
    	ShowPlayerDialog(playerid, TOYSET_VALUE, DIALOG_STYLE_INPUT, "Vehicle Toy PosX", "Set current float value\nNormal Value = 0.05\n\nEnter Float NudgeValue in here:", "Edit", "Cancel");
    }
    return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	if(pData[playerid][pAdminDuty])
	{
        new vehicleid = GetPlayerVehicleID(playerid);
        if(vehicleid > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
            SetVehiclePos(vehicleid, fX, fY, fZ+10);
        }
        else
        {
           	SetPlayerPosFindZ(playerid, fX, fY, 999.0);
            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerInterior(playerid, 0);
        }
        Info(playerid, "Teleport to : %f, %f, %f", fX, fY, fZ);
	}
    return 1;
}

public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
	return 1;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
	if (!strcmp(cmdtext, "/pcmds"))
	{
		SendClientMessage(playerid, 0x12FF12AA, "/pwork for work, /pwstop for stopping work, /phelp for some help.");
		return 1;
	}
	if (!strcmp(cmdtext, "/pwork"))
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			new strin[45];
 			format(strin, sizeof(strin), "%i, %i, %i", pilotvehs[0], pilotvehs[1], pilotvehs[2]);
 			SendClientMessage(playerid, -1, strin);
 			new bool:IsPassing[MAX_PLAYERS] = false;
 			for (new o; o < 9; o++)
			{
    			if(GetVehicleModel(GetPlayerVehicleID(playerid)) == pilotvehs[o])
				{
					// 476 Rustler
					rands = random(sizeof(RandomCPs));
    				SendClientMessage(playerid, 0x34AA33AA, "As you were in your plane. An airport officer noticed you then he approached you.");
	 				cp[playerid] = SetPlayerCheckpoint(playerid, RandomCPs[rands][0],RandomCPs[rands][1],RandomCPs[rands][2], 5.0);

	 				TakingPs[playerid] = 1;
	 				IsPassing[playerid] = true;
	 				return 1;
				}
			}
   			if(IsPassing[playerid] == false) {
			    SendClientMessage(playerid, 0xFF6347AA, "Please use planes. Hydra and Rustler not included in planes category.");
			}
		}
		else
		{
			SendClientMessage(playerid, 0xFF6347AA, "Please get in a plane and then start your work.");
		}
		return 1;
	}


	if(!strcmp(cmdtext, "/phelp"))
	{
	    new phstr[256];
	    format(phstr, sizeof(phstr),  "If you want to became a pilot then worry not we have\n some thing for you, just get in a plane and use /pwork.\n While you are doing your work you will also be \ngiven your payment it is %i per trip. So, have fun and fly just\n one.In last, use /pwstop to stop.", WorkBucks);
	    ShowPlayerDialog(playerid, PH_D, DIALOG_STYLE_MSGBOX, "Pilots Work Help", phstr, "OK", "Cancel");
	    return 1;
	}

	if(!strcmp(cmdtext, "/pwstop"))
	{
		SendClientMessage(playerid, 0xFFFF00AA, "He said: OK! you are out of duty. Have fun in your life.");
	    DestroyDynamicCP(cp[playerid]);
	    TakingPs[playerid] = 2;
	    return 1;
	}
	return 0;
}
public OnPlayerConnect(playerid)
{
	new hour, minute;
	gettime(hour, minute);
	online++;
	togtextdraws[playerid] = 0;
	new PlayerIP[16], country[MAX_COUNTRY_LENGTH], city[MAX_CITY_LENGTH];
	g_MysqlRaceCheck[playerid]++;

	ResetVariables(playerid);
	CreatePlayerTextDraws(playerid);

	GetPlayerName(playerid, pData[playerid][pName], MAX_PLAYER_NAME);
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	pData[playerid][pIP] = PlayerIP;

	GetPlayerCountry(playerid, country, MAX_COUNTRY_LENGTH);
	GetPlayerCity(playerid, city, MAX_CITY_LENGTH);

	SetTimerEx("SafeLogin", 5000, 0, "i", playerid);

	new query[103];
	mysql_format(g_SQL, query, sizeof query, "SELECT * FROM `players` WHERE `username` = '%e' LIMIT 1", pData[playerid][pName]);
	mysql_pquery(g_SQL, query, "OnPlayerDataLoaded", "dd", playerid, g_MysqlRaceCheck[playerid]);
	SetPlayerColor(playerid, COLOR_WHITE);

	//---[ Function ]---
	SedangHauling[playerid] = 0;
	DeletePVar(playerid,"MeatCheck");
	pPurchaseCargoSeed[playerid] = 0;
	pPurchaseCargoMeat[playerid] = 0;
	SedangAnterPizza[playerid] = 0;
	pCargo[playerid] = 0;
	IsAtEvent[playerid] = 0;
	PlayerPBing[playerid] = false;
    PlayerPBKills[playerid] = 0;
    /*uif speedo
    PlayerSpeed[playerid] = 1;
	PlayerSpeedObject[playerid] = -1;
	PlayerSpeedObject2[playerid] = -1;*/
	//---------
	Trash_InitPlayer(playerid);
	//--------------------
 	new fmt_join[128];
	foreach(new ii : Player)
	{
		if(pData[ii][pTogLog] == 0)
		{
			SendClientMessageEx(ii, COLOR_RED, " JOIN: {FFFFFF}%s (%d) {FFFFFF}is now joined to the Server. ", pData[playerid][pName], playerid);
		}
	}
 	format(fmt_join, sizeof fmt_join, "```[JOIN] %s (%d) Is now joined to the Server```",  pData[playerid][pName], playerid);
    DCC_SendChannelMessage(g_discord_logs, fmt_join);
	pData[playerid][activitybar] = CreatePlayerProgressBar(playerid, 281.000000, 136.000000, 88.000000, 10.500000, -1061109611, 100, 0);
	//HBE textdraw Modern
	pData[playerid][damagebar] = CreatePlayerProgressBar(playerid, 386.000000, 441.000000, 7.000000, 78.000000, -16776961, 1000.0, 2);
	pData[playerid][fuelbar] = CreatePlayerProgressBar(playerid, 405.000000, 440.000000, 7.000000, 78.000000, -16776961, 1000.0, 2);

	pData[playerid][hungrybar] = CreatePlayerProgressBar(playerid, 632.000000, 377.000000, 62.000000, 4.000000, 16711935, 100.0, 1);
	pData[playerid][energybar] = CreatePlayerProgressBar(playerid, 632.000000, 398.000000, 62.000000, 4.000000, 16711935, 100.0, 1);
	pData[playerid][bladdybar] = CreatePlayerProgressBar(playerid, 632.000000, 417.000000, 62.000000, 4.000000, 16711935, 100.0, 1);

	//HBE textdraw Simple
	pData[playerid][spdamagebar] = CreatePlayerProgressBar(playerid, 577.000000, 389.000000, 62.000000, 4.000000, -16776961, 1000.0, 0);

	pData[playerid][spfuelbar] = CreatePlayerProgressBar(playerid, 577.000000, 405.000000, 62.000000, 4.000000, -16776961, 1000.0, 0);

	pData[playerid][sphungrybar] = CreatePlayerProgressBar(playerid, 467.500000, 433.833282, 41.000000, 8.000000, 16711935, 100.0, 0);
	pData[playerid][spenergybar] = CreatePlayerProgressBar(playerid, 531.500000, 433.249938, 41.000000, 8.000000, 16711935, 100.0, 0);
	pData[playerid][spbladdybar] = CreatePlayerProgressBar(playerid, 595.500000, 433.250061, 41.000000, 8.000000, 16711935, 100.0, 0);

	//Textdraw Mode
	pData[playerid][BarHp] = CreatePlayerProgressBar(playerid, 523.000000, 150.000000, 85.500000, 6.500000, -16776961, 100.0, 0);
	pData[playerid][BarArmour] = CreatePlayerProgressBar(playerid, 523.000000, 167.000000, 85.500000, 6.500000, -1, 100.0, 0);

	//cent money
	//Server Cent
    Cent[0] = TextDrawCreate(580.000000, 54.000000, ".");
	TextDrawFont(Cent[0], 2);
	TextDrawLetterSize(Cent[0], 0.924999, 5.700003);
	TextDrawTextSize(Cent[0], 400.000000, 17.000000);
	TextDrawSetOutline(Cent[0], 1);
	TextDrawSetShadow(Cent[0], 0);
	TextDrawAlignment(Cent[0], 1);
	TextDrawColor(Cent[0], 6553855);
	TextDrawBackgroundColor(Cent[0], 255);
	TextDrawBoxColor(Cent[0], 50);
	TextDrawUseBox(Cent[0], 0);
	TextDrawSetProportional(Cent[0], 1);
	TextDrawSetSelectable(Cent[0], 0);

	Cent[1] = TextDrawCreate(542.000000, 75.000000, ",");
	TextDrawFont(Cent[1], 2);
	TextDrawLetterSize(Cent[1], 0.745832, 2.849998);
	TextDrawTextSize(Cent[1], 400.000000, 17.000000);
	TextDrawSetOutline(Cent[1], 1);
	TextDrawSetShadow(Cent[1], 0);
	TextDrawAlignment(Cent[1], 1);
	TextDrawColor(Cent[1], 6553855);
	TextDrawBackgroundColor(Cent[1], 255);
	TextDrawBoxColor(Cent[1], 50);
	TextDrawUseBox(Cent[1], 0);
	TextDrawSetProportional(Cent[1], 1);
	TextDrawSetSelectable(Cent[1], 0);

	TextDrawShowForPlayer(playerid, Cent[0]);
	TextDrawShowForPlayer(playerid, Cent[1]);

	DigiHP[playerid] = TextDrawCreate(614.000000, 177.000000, "100");
	TextDrawFont(DigiHP[playerid], 2);
	TextDrawLetterSize(DigiHP[playerid], 0.241666, 0.899999);
	TextDrawTextSize(DigiHP[playerid], 400.000000, 17.000000);
	TextDrawSetOutline(DigiHP[playerid], 1);
	TextDrawSetShadow(DigiHP[playerid], 0);
	TextDrawAlignment(DigiHP[playerid], 2);
	TextDrawColor(DigiHP[playerid], -1);
	TextDrawBackgroundColor(DigiHP[playerid], 255);
	TextDrawBoxColor(DigiHP[playerid], 50);
	TextDrawUseBox(DigiHP[playerid], 0);
	TextDrawSetProportional(DigiHP[playerid], 1);
	TextDrawSetSelectable(DigiHP[playerid], 0);

	DigiAP[playerid] = TextDrawCreate(614.000000, 194.000000, "100");
	TextDrawFont(DigiAP[playerid], 2);
	TextDrawLetterSize(DigiAP[playerid], 0.241666, 0.899999);
	TextDrawTextSize(DigiAP[playerid], 400.000000, 17.000000);
	TextDrawSetOutline(DigiAP[playerid], 1);
	TextDrawSetShadow(DigiAP[playerid], 0);
	TextDrawAlignment(DigiAP[playerid], 2);
	TextDrawColor(DigiAP[playerid], -1);
	TextDrawBackgroundColor(DigiAP[playerid], 255);
	TextDrawBoxColor(DigiAP[playerid], 50);
	TextDrawUseBox(DigiAP[playerid], 0);
	TextDrawSetProportional(DigiAP[playerid], 1);
	TextDrawSetSelectable(DigiAP[playerid], 0);

	//PlayAudioStreamForPlayer(playerid, "");
	//Custom mapping kek mememk
	RemoveBuildingForPlayer(playerid, 4857, 1942.680, -1986.750, 14.898, 0.250);
	RemoveBuildingForPlayer(playerid, 4979, 1942.680, -1986.750, 14.898, 0.250);
	RemoveBuildingForPlayer(playerid, 3625, 1941.979, -1970.699, 14.984, 0.250);
    //----------------------------------[New Alhambra]----------------------------//
	RemoveBuildingForPlayer(playerid, 5544, 1873.7422, -1682.4766, 34.7969, 0.25);
	RemoveBuildingForPlayer(playerid, 1524, 1837.6641, -1640.3828, 13.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1855.7188, -1741.5391, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1879.5078, -1741.4844, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1908.2188, -1741.4844, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1929.5781, -1736.9063, 21.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1931.0391, -1726.3281, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1832.3828, -1694.3125, 9.7188, 0.25);
	RemoveBuildingForPlayer(playerid, 1537, 1837.4375, -1683.9688, 12.3047, 0.25);
	RemoveBuildingForPlayer(playerid, 1533, 1837.4375, -1683.9531, 12.3047, 0.25);
	RemoveBuildingForPlayer(playerid, 1537, 1837.4375, -1686.9844, 12.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1832.8984, -1670.7656, 9.7188, 0.25);
	RemoveBuildingForPlayer(playerid, 1533, 1837.4375, -1677.9219, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1537, 1837.4375, -1680.9531, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1533, 1837.4375, -1680.9375, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 5408, 1873.7422, -1682.4766, 34.7969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1931.0391, -1702.2891, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1929.5781, -1694.4609, 21.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1931.0391, -1667.0313, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1931.0391, -1637.8984, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1855.7188, -1623.2813, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1879.5078, -1623.1016, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1908.2188, -1622.9844, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1929.5781, -1627.6250, 21.3906, 0.25);
	//Trasher
	RemoveBuildingForPlayer(playerid, 3574, 2226.320, -2168.989, 15.101, 0.250);
	RemoveBuildingForPlayer(playerid, 3744, 2226.320, -2168.989, 15.101, 0.250);
	RemoveBuildingForPlayer(playerid, 3574, 2241.300, -2183.979, 15.101, 0.250);
	RemoveBuildingForPlayer(playerid, 3744, 2241.300, -2183.979, 15.101, 0.250);
	// Roadmaps
	RemoveBuildingForPlayer(playerid, 1290, 1348.010, -1447.920, 18.226, 0.250);
	RemoveBuildingForPlayer(playerid, 1290, 1341.349, -1476.599, 18.226, 0.250);
	RemoveBuildingForPlayer(playerid, 1290, 1329.709, -1498.680, 18.226, 0.250);
	RemoveBuildingForPlayer(playerid, 1290, 1316.660, -1519.270, 18.226, 0.250);
	RemoveBuildingForPlayer(playerid, 1290, 1308.329, -1539.319, 18.226, 0.250);
	//Dealership Ocean Docks
	RemoveBuildingForPlayer(playerid, 1412, 2285.830, -2315.760, 13.757, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, 2282.070, -2312.050, 13.757, 0.250);
	RemoveBuildingForPlayer(playerid, 3627, 2288.270, -2342.070, 15.562, 0.250);
	RemoveBuildingForPlayer(playerid, 3686, 2288.270, -2342.070, 15.562, 0.250);
	//Fish Factory
	RemoveBuildingForPlayer(playerid, 17751, 2844.2422, -1531.8828, 20.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 17551, 2844.2422, -1531.8828, 20.1406, 0.25);
	// Ws Flint
    RemoveBuildingForPlayer(playerid, 785, -54.833, -1201.052, 0.216, 0.250);
	RemoveBuildingForPlayer(playerid, 1447, -107.083, -1196.083, 3.039, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, -112.169, -1194.750, 3.039, 0.250);
	RemoveBuildingForPlayer(playerid, 1413, -101.289, -1215.583, 2.960, 0.250);
	RemoveBuildingForPlayer(playerid, 1447, -100.179, -1210.078, 3.039, 0.250);
	RemoveBuildingForPlayer(playerid, 1413, -102.132, -1197.162, 2.960, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, -98.919, -1204.912, 3.039, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, -98.875, -1199.927, 3.039, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, -98.929, -1218.724, 3.039, 0.250);
	RemoveBuildingForPlayer(playerid, 1447, -88.615, -1220.380, 3.039, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, -93.944, -1219.537, 3.039, 0.250);
	RemoveBuildingForPlayer(playerid, 17066, -86.875, -1207.240, 1.687, 0.250);
	RemoveBuildingForPlayer(playerid, 1413, -83.398, -1221.296, 2.960, 0.250);
	RemoveBuildingForPlayer(playerid, 1447, -78.429, -1208.943, 3.039, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, -79.490, -1214.099, 3.039, 0.250);
	RemoveBuildingForPlayer(playerid, 1412, -80.294, -1219.078, 3.039, 0.250);
	RemoveBuildingForPlayer(playerid, 1413, -77.349, -1203.740, 2.802, 0.250);
	RemoveBuildingForPlayer(playerid, 791, -54.833, -1201.052, 0.216, 0.250);
	//removebuild
	RemoveBuildingForPlayer(playerid, 4051, 1371.8203, -1754.8203, 19.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 4021, 1371.8203, -1754.8203, 19.0469, 0.25);
	//electrican
	RemoveBuildingForPlayer(playerid, 1308, -1462.4063, 2527.0078, 54.0547, 0.25);
	//ws midnight
	RemoveBuildingForPlayer(playerid, 1268, 218.2266, -1434.5625, 24.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 6350, 247.3906, -1454.8281, 37.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 1259, 218.2266, -1434.5625, 24.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 673, 227.8672, -1424.9531, 11.0703, 0.25);
	//ws lshc
	RemoveBuildingForPlayer(playerid, 1412, 1917.3203, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1927.8516, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1922.5859, -1797.4219, 13.8125, 0.25);
	//box
	RemoveBuildingForPlayer(playerid, 998, 1464.3203, 1023.2734, 10.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 8311, 1277.2578, 1206.9219, 12.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 8312, 1277.2578, 1206.9219, 12.8281, 0.25);
	//dealer rs
	RemoveBuildingForPlayer(playerid, 5967, 1259.4375, -1246.8125, 17.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 5857, 1259.4375, -1246.8125, 17.1094, 0.25);
	//drag
	RemoveBuildingForPlayer(playerid, 4640, 1728.7891, -1065.0938, 24.5000, 0.25);
	//apart
	RemoveBuildingForPlayer(playerid, 5766, 1160.96, -1180.58, 70.4141, 250.0); // Awning shadows
	RemoveBuildingForPlayer(playerid, 5767, 1160.96, -1180.58, 70.4141, 250.0); // Building
	RemoveBuildingForPlayer(playerid, 5964, 1160.96, -1180.58, 70.4141, 250.0); // LOD

	//ms13 ws
	RemoveBuildingForPlayer(playerid, 5821, 1120.3438, -1248.9375, 20.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 5855, 1095.6797, -1212.7813, 18.2891, 0.25);
	RemoveBuildingForPlayer(playerid, 5822, 1123.8203, -1198.8516, 25.7188, 0.25);
	//sa news
	RemoveBuildingForPlayer(playerid, 1226, 642.0938, -1359.8203, 16.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 642.0938, -1334.8516, 16.2734, 0.25);

	//market
	RemoveBuildingForPlayer(playerid, 4191, 1353.2578, -1764.5313, 15.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 4022, 1353.2578, -1764.5313, 15.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 1532, 1353.1328, -1759.6563, 12.5000, 0.25);

	//HooverWs
	RemoveBuildingForPlayer(playerid, 3592, 2451.7344, -1637.4844, 15.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 762, 2446.5547, -1681.0703, 12.3828, 0.25);
	RemoveBuildingForPlayer(playerid, 17879, 2484.5313, -1667.6094, 21.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 2448.9141, -1648.8516, 13.2813, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 2446.7734, -1646.4219, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1410, 2455.9063, -1648.8047, 13.2813, 0.25);
	RemoveBuildingForPlayer(playerid, 3589, 2451.7344, -1637.4844, 15.1328, 0.25);
	//yakuza
	RemoveBuildingForPlayer(playerid, 705, -2491.5859, -670.7188, 138.4297, 0.25);
	RemoveBuildingForPlayer(playerid, 10496, -2501.7891, -701.1875, 227.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 10675, -2529.1875, -705.0391, 141.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 10693, -2528.6563, -672.3047, 139.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2529.2813, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 10676, -2528.6563, -672.3047, 139.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2528.0781, -719.9219, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2524.0156, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2522.8125, -719.9219, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2517.5469, -719.9219, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1596, -2517.5938, -671.0078, 149.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 1694, -2518.4297, -632.1953, 155.6719, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2518.7500, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2514.8672, -711.8672, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2514.8672, -706.6328, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2514.8672, -701.3984, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2514.8672, -696.1719, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2514.8672, -690.9375, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2514.8672, -717.0938, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 10357, -2501.7891, -701.1875, 227.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 1684, -2508.5000, -680.9531, 139.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2513.4844, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2508.2188, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1684, -2508.4063, -669.0938, 139.8516, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2502.9531, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2497.6875, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2492.4219, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2487.1563, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2484.2969, -597.1641, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2484.2969, -602.4297, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2484.2969, -607.6953, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2541.5000, -690.9609, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2541.5000, -696.1875, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2541.5000, -701.4219, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2541.5000, -706.6563, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2541.5000, -711.8828, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2541.5000, -717.1172, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2538.6094, -719.9219, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1595, -2538.9297, -648.6406, 152.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1595, -2538.9297, -660.9063, 152.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, -2539.8359, -718.3203, 152.5078, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2533.3438, -719.9219, 139.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 1695, -2529.6641, -652.6484, 147.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1695, -2529.6641, -661.9766, 147.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1695, -2529.6641, -671.3047, 147.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1695, -2529.6641, -680.6250, 147.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, -2537.5938, -620.4688, 145.7500, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2539.8125, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1411, -2534.5469, -594.3281, 133.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1695, -2529.6641, -634.0000, 147.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1695, -2529.6641, -643.3281, 147.5234, 0.25);

	//mechanic central
	RemoveBuildingForPlayer(playerid, 3686, 2169.1172, -2276.5859, 15.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 3686, 2195.0859, -2216.8438, 15.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 3686, 2220.7813, -2261.0547, 15.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 3744, 2193.2578, -2286.2891, 14.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3744, 2183.1719, -2237.2734, 14.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3744, 2174.6406, -2215.6563, 15.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 3744, 2193.0625, -2196.6406, 15.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 5305, 2198.8516, -2213.9219, 14.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 3747, 2234.3906, -2244.8281, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3747, 2226.9688, -2252.1406, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3747, 2219.4219, -2259.5234, 14.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 3747, 2212.0938, -2267.0703, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3747, 2204.6328, -2274.4141, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3578, 2165.0703, -2288.9688, 13.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 3574, 2193.2578, -2286.2891, 14.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3627, 2169.1172, -2276.5859, 15.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 3569, 2204.6328, -2274.4141, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3569, 2212.0938, -2267.0703, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3627, 2220.7813, -2261.0547, 15.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 3569, 2219.4219, -2259.5234, 14.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 3578, 2194.4766, -2242.8750, 13.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 2217.2188, -2250.3594, 16.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 3569, 2226.9688, -2252.1406, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3569, 2234.3906, -2244.8281, 14.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3574, 2183.1719, -2237.2734, 14.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3578, 2235.1641, -2231.8516, 13.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 3574, 2174.6406, -2215.6563, 15.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 3627, 2195.0859, -2216.8438, 15.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 5244, 2198.8516, -2213.9219, 14.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 3574, 2193.0625, -2196.6406, 15.1016, 0.25);

	//ext rs
	RemoveBuildingForPlayer(playerid, 5929, 1230.8906, -1337.9844, 12.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 739, 1231.1406, -1341.8516, 12.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 739, 1231.1406, -1328.0938, 12.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 739, 1231.1406, -1356.2109, 12.7344, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1222.6641, -1374.6094, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1222.6641, -1356.5547, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1240.9219, -1374.6094, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1240.9219, -1356.5547, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1222.6641, -1335.0547, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1222.6641, -1317.7422, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 5812, 1230.8906, -1337.9844, 12.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1240.9219, -1335.0547, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1240.9219, -1317.7422, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1222.6641, -1300.9219, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1240.9219, -1300.9219, 12.2969, 0.25);
    //------------------------------------------------------------------------------------------
    Warning[playerid] = 0;
    VehicleLastEnterTime[playerid] = 0;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    online--;
    //pb
	if(PlayerPBing[playerid] == true)
	{
		PBPlayers--;
	}
	//end
    new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    if(pData[playerid][pPacket] == 1)
    {
        taked = 0;
        pData[playerid][pPacket]--;
        pCPPacket = INVALID_PLAYER_ID;
        new Float:X, Float:Y, Float:Z;
        GetPlayerPos(playerid, X, Y, Z);
        objectpacket = CreateDynamicObject(11745, X, Y, Z-1, 80.0, 0.0, 0.0, 0);
        taked = 0;
    }

	//pilot
	if(TakingPs[playerid] == 1 || TakingPs[playerid] == 0) {
		DestroyDynamicCP(cp[playerid]);
		TakingPs[playerid] = 2;
	}
	//butcher
    if(GetPVarInt(playerid,"InWork"))
	{
	    if(IsValidDynamicObject(playerobject[playerid][0])) DestroyDynamicObject(playerobject[playerid][0]);
	    else if(IsValidDynamicObject(playerobject[playerid][1])) DestroyDynamicObject(playerobject[playerid][1]);
	}
	if(GetPVarType(playerid, "PlacedBB"))
    {
        DestroyDynamicObject(GetPVarInt(playerid, "PlacedBB"));
        DestroyDynamic3DTextLabel(Text3D:GetPVarInt(playerid, "BBLabel"));
        if(GetPVarType(playerid, "BBArea"))
        {
            foreach(new i : Player)
            {
                if(IsPlayerInDynamicArea(i, GetPVarInt(playerid, "BBArea")))
                {
                    StopAudioStreamForPlayer(i);
                    SendClientMessage(i, COLOR_PURPLE, " The boombox creator has disconnected from the server.");
                }
            }
        }
    }
	DestroyObject(ObjetoC[playerid]);
	DestroyObject(ObjetoC1[playerid]);
	DeletePVar(playerid,"InWork");
	DeletePVar(playerid,"MeatCheck");
	DeletePVar(playerid,"BadMeatDel");
	DeletePVar(playerid,"BadMeat");
	DeletePVar(playerid,"OldSkin");
	DeletePVar(playerid,"OnWork");
	TextDrawDestroy(DigiHP[playerid]);
	TextDrawDestroy(DigiAP[playerid]);

	killgr(playerid);
	//trasher
	if(HasTrash[playerid]) Trash_ResetPlayer(playerid);
	//end trasher
	SetPlayerName(playerid, pData[playerid][pName]);

	if(pData[playerid][pSekolahSim] == 1)
	{
		pData[playerid][pSekolahSim] = 0;
		Global[SKM] = 0;
	}
	if(IsPlayerInAnyVehicle(playerid))
	{
        RemovePlayerFromVehicle(playerid);
    }
	//UpdateWeapons(playerid);
	g_MysqlRaceCheck[playerid]++;

	if(pData[playerid][IsLoggedIn] == true)
	{
		/*if(IsAtEvent[playerid] == 0)
		{
			UpdatePlayerData(playerid);
		}*/
		UpdatePlayerData(playerid);
		RemovePlayerVehicle(playerid);
		for(new v; v < MAX_PLAYER_VEHICLE; ++v)
		{
		    for(new vt = 0; vt < 4; vt++)
		 	{
		 	 	DestroyObject(vtData[v][vt][vtoy_model]);
			}
		}
		Report_Clear(playerid);
		Ask_Clear(playerid);
		Player_ResetMining(playerid);
		Player_ResetCutting(playerid);
		Player_RemoveLumber(playerid);
		Player_ResetHarvest(playerid);
		KillTazerTimer(playerid);
		if(IsAtEvent[playerid] == 1)
		{
			if(GetPlayerTeam(playerid) == 1)
			{
				if(EventStarted == 1)
				{
					RedTeam -= 1;
					foreach(new ii : Player)
					{
						if(GetPlayerTeam(ii) == 2)
						{
							GivePlayerMoneyEx(ii, EventPrize);
							Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d00 per orang", EventPrize);
							SetPlayerPos(ii, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
							pData[playerid][pHospital] = 0;
							ResetPlayerWeapons(ii);
							SetPlayerColor(ii, COLOR_WHITE);
							ClearAnimations(ii);
							BlueTeam = 0;
						}
						else if(GetPlayerTeam(ii) == 1)
						{
							Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
							SetPlayerPos(ii, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
							pData[playerid][pHospital] = 0;
							ResetPlayerWeapons(ii);
							SetPlayerColor(ii, COLOR_WHITE);
							ClearAnimations(ii);
							RedTeam = 0;
						}
					}
				}
			}
			if(GetPlayerTeam(playerid) == 2)
			{
				if(EventStarted == 1)
				{
					BlueTeam -= 1;
					foreach(new ii : Player)
					{
						if(GetPlayerTeam(ii) == 1)
						{
							GivePlayerMoneyEx(ii, EventPrize);
							Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d00 per orang", EventPrize);
							SetPlayerPos(ii, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
							pData[playerid][pHospital] = 0;
							ResetPlayerWeapons(ii);
							SetPlayerColor(ii, COLOR_WHITE);
							ClearAnimations(ii);
							BlueTeam = 0;
						}
						else if(GetPlayerTeam(ii) == 2)
						{
							Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
							SetPlayerPos(ii, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
							pData[playerid][pHospital] = 0;
							ResetPlayerWeapons(ii);
							SetPlayerColor(ii, COLOR_WHITE);
							ClearAnimations(ii);
							BlueTeam = 0;
						}
					}
				}
			}
			SetPlayerTeam(playerid, 0);
			IsAtEvent[playerid] = 0;
			pData[playerid][pInjured] = 0;
			pData[playerid][pSpawned] = 1;
		}
	}
	if(IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pAdoTag]);

	if(IsValidDynamicObject(pData[playerid][pFlare]))
            DestroyDynamicObject(pData[playerid][pFlare]);

    pData[playerid][pAdoActive] = false;

	if(cache_is_valid(pData[playerid][Cache_ID]))
	{
		cache_delete(pData[playerid][Cache_ID]);
		pData[playerid][Cache_ID] = MYSQL_INVALID_CACHE;
	}

	if (pData[playerid][LoginTimer])
	{
		KillTimer(pData[playerid][LoginTimer]);
		pData[playerid][LoginTimer] = 0;
	}

	pData[playerid][IsLoggedIn] = false;

	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

	//hauling tr
	for(new i; i <= 9; i++) // 9 = Total Dialog , Jadi kita mau tau kalau Player Ini Apakah Ambil Dialog dari 3 tersebut apa ga !
	{
		if(DialogSaya[playerid][i] == true) // Cari apakah dia punya salah satu diantara 10 dialog tersebut
		{
		    DialogSaya[playerid][i] = false; // Ubah Jadi Dia ga punya dialog lagi Kalau Udah Disconnect (Bukan dia lagi pemilik)
		    DialogHauling[i] = false; // Jadi ga ada yang punya nih dialog
		    DestroyVehicle(TrailerHauling[playerid]);
		}
	}
	foreach(new ii : Player)
	{
		if(IsPlayerInRangeOfPoint(ii, 40.0, x, y, z))
		{
			switch(reason)
			{
				case 0:
				{
					SendClientMessageEx(ii, COLOR_RED, "[LEAVE]"WHITE_E" %s(%d) has leave from the server.{FFFF00}(timeout/crash)", pData[playerid][pName], playerid);
				}
				case 1:
				{
					SendClientMessageEx(ii, COLOR_RED, "[LEAVE]"WHITE_E" %s(%d) has leave from the server.{FFFF00}(leaving)", pData[playerid][pName], playerid);
				}
				case 2:
				{
					SendClientMessageEx(ii, COLOR_RIKO, "[LEAVE]"WHITE_E" %s(%d) has leave from the server.{FFFF00}(kicked/banned)", pData[playerid][pName], playerid);
				}
			}
		}
	}
	Player_Fire_Enabled[playerid] = false;
	Player_Key_Sprint_Time[playerid] = 0;

	return 1;
}


public OnPlayerSpawn(playerid)
{
	if(PlayerPBing[playerid] == true)
	{
	    new RandomSpawn = random(sizeof(PBSpawns));
	    new RandomSkins = random(sizeof(PBSkins));
	    SetPlayerSkin(playerid,PBSkins[RandomSkins]);
		SetPlayerPos(playerid,PBSpawns[RandomSpawn][0],PBSpawns[RandomSpawn][1],PBSpawns[RandomSpawn][2]);
		SetPlayerFacingAngle(playerid,PBSpawns[RandomSpawn][3]);
		SetPlayerHealth(playerid,100.0);
		SetPlayerArmour(playerid,50.0);
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid,PBGunID,99999);
	}
	SetPlayerFightingStyle(playerid, pData[playerid][pFightStyle]);
	StopAudioStreamForPlayer(playerid);
	SetPlayerInterior(playerid, pData[playerid][pInt]);
	SetPlayerVirtualWorld(playerid, pData[playerid][pWorld]);
	SetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
	SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, 0);
	SetPlayerSpawn(playerid);
	LoadAnims(playerid);

	SetPlayerSkillLevel(playerid, WEAPON_COLT45, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SILENCED, 1);
	SetPlayerSkillLevel(playerid, WEAPON_DEAGLE, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SAWEDOFF, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGSPA, 1);
	SetPlayerSkillLevel(playerid, WEAPON_UZI, 1);
	SetPlayerSkillLevel(playerid, WEAPON_MP5, 1);
	SetPlayerSkillLevel(playerid, WEAPON_AK47, 1);
	SetPlayerSkillLevel(playerid, WEAPON_M4, 1);
	SetPlayerSkillLevel(playerid, WEAPON_TEC9, 1);
	SetPlayerSkillLevel(playerid, WEAPON_RIFLE, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SNIPER, 1);
	//butcher
	if(GetPVarInt(playerid,"InWork"))
	{
	    if(IsValidDynamicObject(playerobject[playerid][0])) DestroyDynamicObject(playerobject[playerid][0]);
	    else if(IsValidDynamicObject(playerobject[playerid][1])) DestroyDynamicObject(playerobject[playerid][1]);
	    DeletePVar(playerid,"InWork");
	}
	return 1;
}

SetPlayerSpawn(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(pData[playerid][pGender] == 0)
		{
			TogglePlayerControllable(playerid,0);
			SetPlayerHealth(playerid, 100.0);
			SetPlayerArmour(playerid, 0.0);
			SetPlayerPos(playerid, 1716.1129, -1880.0715, -10.0);
			InterpolateCameraPos(playerid, 1330.757080, -1732.019042, 23.432754, 1484.328125, -1716.528442, 23.261428, 20000);
			InterpolateCameraLookAt(playerid, 1335.739990, -1732.224365, 23.073688, 1483.968627, -1721.461547, 23.993165, 19000);
			SetPlayerVirtualWorld(playerid, 0);
			ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukan tanggal lahir (Tgl/Bulan/Tahun): 15/04/1998", "Enter", "Batal");
		}
		else
		{
			SetPlayerColor(playerid, COLOR_WHITE);
			if(pData[playerid][pHBEMode] == 1) //simple
			{
				PlayerTextDrawShow(playerid, DigiHunger[playerid]);
				PlayerTextDrawShow(playerid, DigiEnergi[playerid]);
				PlayerTextDrawShow(playerid, DigiBladdy[playerid]);
				for(new txd; txd < 9; txd++)
				{
					TextDrawShowForPlayer(playerid, DGhudchar[txd]);
				}
			}
			if(pData[playerid][pHBEMode] == 2) //modern
			{
				ShowPlayerProgressBar(playerid, pData[playerid][hungrybar]);
				ShowPlayerProgressBar(playerid, pData[playerid][energybar]);
				ShowPlayerProgressBar(playerid, pData[playerid][bladdybar]);
				TextDrawShowForPlayer(playerid, CharBox);
				PlayerTextDrawSetPreviewModel(playerid, HBEO[playerid], GetPlayerSkin(playerid));
				PlayerTextDrawShow(playerid, HBEO[playerid]);
				for(new txd; txd < 5; txd++)
				{
					TextDrawShowForPlayer(playerid, HudChar[txd]);
				}
			}
			if(pData[playerid][pTDMode] == 1) //simple
			{
				TextDrawShowForPlayer(playerid, DigiHP[playerid]);
				TextDrawShowForPlayer(playerid, DigiAP[playerid]);
				for(new idx; idx < 5; idx++)
				{
					TextDrawShowForPlayer(playerid, DigiHPTD[idx]);
				}
				TextDrawShowForPlayer(playerid, TextDate);
				TextDrawShowForPlayer(playerid, TextTime);
				TextDrawShowForPlayer(playerid, TDTime[0]);
				TextDrawShowForPlayer(playerid, TDTime[1]);
				TextDrawShowForPlayer(playerid, ServerName);
			}
			if(pData[playerid][pTDMode] == 2) //bar
			{
				ShowPlayerProgressBar(playerid, pData[playerid][BarHp]);
				ShowPlayerProgressBar(playerid, pData[playerid][BarArmour]);

				PlayerTextDrawShow(playerid, PreviuwModelBarHp[playerid]);
				PlayerTextDrawShow(playerid, PreviewModelBarArmour[playerid]);
				PlayerTextDrawShow(playerid, BoxBarArmour[playerid]);
				PlayerTextDrawShow(playerid, BoxBarHp[playerid]);
				TextDrawShowForPlayer(playerid, TextDate);
				TextDrawShowForPlayer(playerid, TextTime);
				TextDrawShowForPlayer(playerid, TDTime[0]);
				TextDrawShowForPlayer(playerid, TDTime[1]);
				TextDrawShowForPlayer(playerid, ServerName);
			}
			SetPlayerSkin(playerid, pData[playerid][pSkin]);
			if(pData[playerid][pOnDuty] >= 1)
			{
				SetPlayerSkin(playerid, pData[playerid][pFacSkin]);
				SetFactionColor(playerid);
			}
			if(pData[playerid][pAdminDuty] > 0)
			{
				SetPlayerColor(playerid, COLOR_RED);
			}
			SetTimerEx("SpawnTimer", 6000, false, "i", playerid);
		}
	}
}

public OnPlayerModelSelection(playerid, response, listid, modelid)
{
	if(listid == SpawnMale)
    {
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1642.8126, -2333.4019, 13.5469, 359.7415, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
		}
    }
	if(listid == SpawnFemale)
    {
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1642.8126, -2333.4019, 13.5469, 359.7415, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
		}
    }
	//Locker Faction Skin
	if(listid == SAPDMale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAPDFemale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAPDWar)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAGSMale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAGSFemale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAMDMale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAMDFemale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SANEWMale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SANEWFemale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	///Bisnis buy skin clothes
	if(listid == MaleSkins)
    {
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][0];
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			GivePlayerMoneyEx(playerid, -price);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
            bData[bizid][bProd]--;
            bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
            Bisnis_Save(bizid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
    }
	if(listid == FemaleSkins)
    {
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][0];
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			GivePlayerMoneyEx(playerid, -price);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
            bData[bizid][bProd]--;
            bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
            Bisnis_Save(bizid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
    }
	if(listid == VIPMaleSkins)
    {
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengganti skin ID %d.", ReturnName(playerid), modelid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
    }
	if(listid == VIPFemaleSkins)
    {
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d.", ReturnName(playerid), modelid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
    }
    if(listid == vtoylist)
	{
		if(response)
		{
			new x = GetPlayerVehicleID(playerid);
			foreach(new i: PVehicles)
			if(x == pvData[i][cVeh])
			{
				new vehid = pvData[i][cVeh];
				vtData[vehid][pvData[vehid][vtoySelected]][vtoy_modelid] = modelid;
				if(pvData[vehid][PurchasedvToy] == false)
				{
					MySQL_CreateVehicleToy(i);
				}
				vtData[vehid][pvData[vehid][vtoySelected]][vtoy_model] = CreateDynamicObject(vtData[vehid][pvData[vehid][vtoySelected]][vtoy_modelid], 0.0, 0.0, -14.0, 0.0, 0.0, 0.0);
				AttachDynamicObjectToVehicle(vtData[vehid][pvData[vehid][vtoySelected]][vtoy_model], vehid, vtData[vehid][pvData[vehid][vtoySelected]][vtoy_x], vtData[vehid][pvData[vehid][vtoySelected]][vtoy_y], vtData[vehid][pvData[vehid][vtoySelected]][vtoy_z], vtData[vehid][pvData[vehid][vtoySelected]][vtoy_rx], vtData[vehid][pvData[vehid][vtoySelected]][vtoy_ry], vtData[vehid][pvData[vehid][vtoySelected]][vtoy_rz]);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memasang toys untuk vehicleid(%d) object ID %d", ReturnName(playerid), vehid, modelid);
				ShowPlayerDialog(playerid, VTOY_ACCEPT, DIALOG_STYLE_MSGBOX, "Vehicle Toys", "Do You Want To Save it?", "Yes", "Cancel");
			}
		}
		else return Servers(playerid, "Canceled buy toys");
	}
	if(listid == toyslist)
	{
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][1];

			GivePlayerMoneyEx(playerid, -price);
			if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Select", "Cancel");

            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli object ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
            bData[bizid][bProd]--;
            bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
            Bisnis_Save(bizid);
		}
		else return Servers(playerid, "Canceled buy toys");
	}
	if(listid == viptoyslist)
	{
		if(response)
		{
			if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Select", "Cancel");

            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengambil object ID %d dilocker.", ReturnName(playerid), modelid);
		}
		else return Servers(playerid, "Canceled toys");
	}
	if(listid == rentjoblist)
	{
		if(response)
		{
			if(modelid == 414)
			{
				//new modelid = 414;
				new tstr[128];
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan menyewa kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"$500 / one days", GetVehicleModelName(modelid));
				ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARSCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Vehicles", tstr, "Rental", "Batal");
			}
			if(modelid == 455)
			{
				//new modelid = 455;
				new tstr[128];
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan menyewa kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"$500 / one days", GetVehicleModelName(modelid));
				ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARSCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Vehicles", tstr, "Rental", "Batal");
			}
			if(modelid == 456)
			{
			//new modelid = 456;
				new tstr[128];
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan menyewa kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"$500 / one days", GetVehicleModelName(modelid));
				ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARSCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Vehicles", tstr, "Rental", "Batal");
			}
			if(modelid == 498)
			{
				//new modelid = 498;
				new tstr[128];
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan menyewa kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"$500 / one days", GetVehicleModelName(modelid));
				ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARSCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Vehicles", tstr, "Rental", "Batal");
			}
			if(modelid == 499)
			{
				//new modelid = 499;
				new tstr[128];
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan menyewa kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"$500 / one days", GetVehicleModelName(modelid));
				ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARSCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Vehicles", tstr, "Rental", "Batal");
			}
			if(modelid == 609)
			{
				//new modelid = 609;
				new tstr[128];
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan menyewa kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"$500 / one days", GetVehicleModelName(modelid));
				ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARSCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Vehicles", tstr, "Rental", "Batal");
			}
			if(modelid == 478)
			{
				//new modelid = 478;
				new tstr[128];
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan menyewa kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"$500 / one days", GetVehicleModelName(modelid));
				ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARSCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Vehicles", tstr, "Rental", "Batal");
			}
			if(modelid == 422)
			{
				//new modelid = 422;
				new tstr[128];
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan menyewa kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"$500 / one days", GetVehicleModelName(modelid));
				ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARSCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Vehicles", tstr, "Rental", "Batal");
			}
			if(modelid == 543)
			{
				//new modelid = 543;
				new tstr[128];
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan menyewa kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"$500 / one days", GetVehicleModelName(modelid));
				ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARSCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Vehicles", tstr, "Rental", "Batal");
			}
			if(modelid == 554)
			{
				//new modelid = 554;
				new tstr[128];
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan menyewa kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"$500 / one days", GetVehicleModelName(modelid));
				ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARSCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Vehicles", tstr, "Rental", "Batal");
			}
			if(modelid == 525)
			{
				//new modelid = 525;
				new tstr[128];
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan menyewa kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"$500 / one days", GetVehicleModelName(modelid));
				ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARSCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Vehicles", tstr, "Rental", "Batal");
			}
			if(modelid == 438)
			{
				//new modelid = 438;
				new tstr[128];
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan menyewa kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"$500 / one days", GetVehicleModelName(modelid));
				ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARSCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Vehicles", tstr, "Rental", "Batal");
			}
			if(modelid == 420)
			{
				//new modelid = 420;
				new tstr[128];
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan menyewa kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"$500 / one days", GetVehicleModelName(modelid));
				ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARSCONFIRM, DIALOG_STYLE_MSGBOX, "Rental Vehicles", tstr, "Rental", "Batal");
			}
		}
		else return Servers(playerid, "Canceled buy vehicle");
	}
	if(listid == sportcar)
	{
		if(response)
		{
			if(modelid == 400)
			{
				//new modelid = 414;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 402)
			{
				//new modelid = 455;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 415)
			{
				//new modelid = 498;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 421)
			{
				//new modelid = 499;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 429)
			{
				//new modelid = 609;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 436)
			{
				//new modelid = 478;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 466)
			{
				//new modelid = 543;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 533)
			{
				//new modelid = 414;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 541)
			{
				//new modelid = 455;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 543)
			{
			//new modelid = 456;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 579)
			{
				//new modelid = 498;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 602)
			{
				//new modelid = 499;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 405)
			{
				//new modelid = 609;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 603)
			{
				//new modelid = 478;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 589)
			{
				//new modelid = 422;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 587)
			{
				//new modelid = 543;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 566)
			{
				//new modelid = 554;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 562)
			{
				//new modelid = 525;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 560)
			{
				//new modelid = 438;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 559)
			{
				//new modelid = 420;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 558)
			{
				//new modelid = 609;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 551)
			{
				//new modelid = 478;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 540)
			{
				//new modelid = 422;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 534)
			{
				//new modelid = 543;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 527)
			{
				//new modelid = 554;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 507)
			{
				//new modelid = 525;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 411)
			{
				//new modelid = 420;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
			if(modelid == 477)
			{
				//new modelid = 477;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
   			if(modelid == 522)
			{
				//new modelid = 477;
				new tstr[128], price = GetVipVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d gold", GetVehicleModelName(modelid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYPVCP_VIPCONFIRM, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
		}
		else return Servers(playerid, "Canceled Buy Vehicle");
	}
	if(listid == boatlist)
	{
		if(response)
		{
			if(modelid == 446)
			{
				new tstr[128], price = GetVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
				ShowPlayerDialog(playerid, DIALOG_BUYBOAT_CONFIRM, DIALOG_STYLE_MSGBOX, "Boat", tstr, "Buy", "Cancel");
			}
			if(modelid == 453)
			{
				new tstr[128], price = GetVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
				ShowPlayerDialog(playerid, DIALOG_BUYBOAT_CONFIRM, DIALOG_STYLE_MSGBOX, "Boat", tstr, "Buy", "Cancel");
			}
			if(modelid == 472)
			{
				new tstr[128], price = GetVehicleCost(modelid);
				pData[playerid][pBuyPvModel] = modelid;
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleModelName(modelid), FormatMoney(price));
				ShowPlayerDialog(playerid, DIALOG_BUYBOAT_CONFIRM, DIALOG_STYLE_MSGBOX, "Boat", tstr, "Buy", "Cancel");
			}
		}
		else return Servers(playerid, "Canceled Buy Boat");
	}
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	InterpolateCameraPos(playerid, 244.116943, -1844.963256, 41.799915, 821.013366, -1641.763793, 29.977857, 15000);
	InterpolateCameraLookAt(playerid, 247.605590, -1841.989990, 39.802570, 817.645996, -1645.395751, 29.292520, 15000);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
 	new mstr[128];
 	format(mstr, sizeof(mstr), "Masukkan password anda jika ingin bermain!");
	ShowPlayerDialog(playerid, DIALOG_NGENTOD, DIALOG_STYLE_MSGBOX, "Eror", mstr, "Close", "");
	KickEx(playerid);
	return 1;
}
//end
public OnPlayerDeath(playerid, killerid, reason)
{
	//pb
	/*if(PlayerPBing[killerid] == true)
	{
		new string[128],name[MAX_PLAYER_NAME];
		GetPlayerName(killerid,name,sizeof(name));
		PlayerPBKills[killerid]++;
		if(PlayerPBKills[killerid] > PBLeaderKills)
		{
			PBLeaderKills = PlayerPBKills[killerid];
			PBLeaderid = killerid;
			format(string,sizeof(string),"The Player "COL_RED"%s(%d) "COL_WHITE"Is In Lead With "COL_RED"%d "COL_WHITE"Kills",name,killerid,PlayerPBKills[killerid]);
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(PlayerPBing[i] == true)
				{
					SendClientMessage(i,COLOR_WHITE,string);
				}
			}
		}
	}
	//end*/
	DeletePVar(playerid, "UsingSprunk");
	SetPVarInt(playerid, "GiveUptime", -1);
	pData[playerid][pSpawned] = 0;
	Player_ResetCutting(playerid);
	Player_RemoveLumber(playerid);
	Player_ResetMining(playerid);
	Player_ResetHarvest(playerid);

	pData[playerid][CarryProduct] = 0;

	KillTimer(pData[playerid][pActivity]);
	KillTimer(pData[playerid][pMechanic]);
	KillTimer(pData[playerid][pProducting]);
	KillTimer(pData[playerid][pCooking]);
	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
	PlayerTextDrawHide(playerid, ActiveTD[playerid]);
	pData[playerid][pMechVeh] = INVALID_VEHICLE_ID;
	pData[playerid][pActivityTime] = 0;

	pData[playerid][pMechDuty] = 0;
	pData[playerid][pTaxiDuty] = 0;
	pData[playerid][pMission] = -1;
	pData[playerid][pDealerMission] = -1;
	SedangHauling[playerid] = 0;
	//RecogioChatarra[playerid] = 0;

	pData[playerid][pSideJob] = 0;
	pData[playerid][pJobTime] = 0;
	DisablePlayerCheckpoint(playerid);
	DisablePlayerRaceCheckpoint(playerid);
	SetPlayerColor(playerid, COLOR_WHITE);
	RemovePlayerAttachedObject(playerid, 9);
	GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	foreach(new ii : Player)
    {
        if(pData[ii][pAdmin] > 0)
        {
            SendDeathMessageToPlayer(ii, killerid, playerid, reason);
        }
    }
    if(TakingPs[playerid] == 1 || TakingPs[playerid] == 0) {
		DestroyDynamicCP(cp[playerid]);
		TakingPs[playerid] = 2;
	}
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ,Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	new weaponid = EditingWeapon[playerid];
    if(weaponid)
    {
        if(response == 1)
        {
            new enum_index = weaponid - 22, weaponname[18], string[340];

            GetWeaponName(weaponid, weaponname, sizeof(weaponname));

            WeaponSettings[playerid][enum_index][Position][0] = fOffsetX;
            WeaponSettings[playerid][enum_index][Position][1] = fOffsetY;
            WeaponSettings[playerid][enum_index][Position][2] = fOffsetZ;
            WeaponSettings[playerid][enum_index][Position][3] = fRotX;
            WeaponSettings[playerid][enum_index][Position][4] = fRotY;
            WeaponSettings[playerid][enum_index][Position][5] = fRotZ;

            RemovePlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid));
            SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);

            Servers(playerid, "You have successfully adjusted the position of your %s.", weaponname);

            mysql_format(g_SQL, string, sizeof(string), "INSERT INTO weaponsettings (Owner, WeaponID, PosX, PosY, PosZ, RotX, RotY, RotZ) VALUES ('%d', %d, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f) ON DUPLICATE KEY UPDATE PosX = VALUES(PosX), PosY = VALUES(PosY), PosZ = VALUES(PosZ), RotX = VALUES(RotX), RotY = VALUES(RotY), RotZ = VALUES(RotZ)", pData[playerid][pID], weaponid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ);
            mysql_tquery(g_SQL, string);
        }
		else if(response == 0)
		{
			new enum_index = weaponid - 22;
			SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);
		}
        EditingWeapon[playerid] = 0;
		return 1;
    }
	else
	{
		if(response == 1)
		{
			GameTextForPlayer(playerid, "~g~~h~Toy Position Updated~y~!", 4000, 5);

			pToys[playerid][index][toy_x] = fOffsetX;
			pToys[playerid][index][toy_y] = fOffsetY;
			pToys[playerid][index][toy_z] = fOffsetZ;
			pToys[playerid][index][toy_rx] = fRotX;
			pToys[playerid][index][toy_ry] = fRotY;
			pToys[playerid][index][toy_rz] = fRotZ;
			pToys[playerid][index][toy_sx] = fScaleX;
			pToys[playerid][index][toy_sy] = fScaleY;
			pToys[playerid][index][toy_sz] = fScaleZ;

			MySQL_SavePlayerToys(playerid);
		}
	}
	return 1;
}

public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT: objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
    if(pData[playerid][EditingVending] != -1 && Iter_Contains(Vending, pData[playerid][EditingVending]))
	{
		if(response == EDIT_RESPONSE_FINAL)
	    {
	        new venid = pData[playerid][EditingVending];
	        VendingData[venid][VendingPosX] = x;
	        VendingData[venid][VendingPosY] = y;
	        VendingData[venid][VendingPosZ] = z;
	        VendingData[venid][VendingPosRX] = rx;
	        VendingData[venid][VendingPosRY] = ry;
	        VendingData[venid][VendingPosRZ] = rz;

	        SetDynamicObjectPos(objectid, VendingData[venid][VendingPosX], VendingData[venid][VendingPosY], VendingData[venid][VendingPosZ]);
	        SetDynamicObjectRot(objectid, VendingData[venid][VendingPosRX], VendingData[venid][VendingPosRY], VendingData[venid][VendingPosRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, VendingData[venid][VendingLabel], E_STREAMER_X, VendingData[venid][VendingPosX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, VendingData[venid][VendingLabel], E_STREAMER_Y, VendingData[venid][VendingPosY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, VendingData[venid][VendingLabel], E_STREAMER_Z, VendingData[venid][VendingPosZ] + 0.3);

		    VendingSave(venid);
	        pData[playerid][EditingVending] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new venid = pData[playerid][EditingVending];
	        SetDynamicObjectPos(objectid, VendingData[venid][VendingPosX], VendingData[venid][VendingPosY], VendingData[venid][VendingPosZ]);
	        SetDynamicObjectRot(objectid, VendingData[venid][VendingPosRX], VendingData[venid][VendingPosRY], VendingData[venid][VendingPosRZ]);
	    	pData[playerid][EditingVending] = -1;
	    }
	}
	if(pData[playerid][EditingVtoys] != -1)
	{
		if(response == EDIT_RESPONSE_FINAL)
	    {
	    	new vehicleid = GetNearestVehicleToPlayer(playerid, 5.0, false);
	        new vehid = pvData[vehicleid][cVeh];
	        new idxs = pvData[vehid][vtoySelected];
	        vtData[vehid][idxs][vtoy_x] = x;
	        vtData[vehid][idxs][vtoy_y] = y;
	        vtData[vehid][idxs][vtoy_z] = z;
	        vtData[vehid][idxs][vtoy_rx] = rx;
	        vtData[vehid][idxs][vtoy_ry] = ry;
	        vtData[vehid][idxs][vtoy_rz] = rz;

	        SetDynamicObjectPos(objectid, vtData[vehid][idxs][vtoy_x], vtData[vehid][idxs][vtoy_y], vtData[vehid][idxs][vtoy_z]);
	        SetDynamicObjectRot(objectid, vtData[vehid][idxs][vtoy_rx], vtData[vehid][idxs][vtoy_ry], vtData[vehid][idxs][vtoy_rz]);

		    MySQL_SaveVehicleToys(vehicleid);
	        pData[playerid][EditingVtoys] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new vehid = pData[playerid][EditingVtoys];
	        new idxs = pvData[vehid][vtoySelected];
	        SetDynamicObjectPos(objectid, vtData[vehid][idxs][vtoy_x], vtData[vehid][idxs][vtoy_y], vtData[vehid][idxs][vtoy_z]);
	        SetDynamicObjectRot(objectid, vtData[vehid][idxs][vtoy_rx], vtData[vehid][idxs][vtoy_ry], vtData[vehid][idxs][vtoy_rz]);
	    	pData[playerid][EditingVtoys] = -1;
	    }
	}
	//graf
	if(response == EDIT_RESPONSE_FINAL )
	{
		if(GetPVarInt(playerid, "GraffitiCreating") == 1 )
		{
			new id = nGraffiti();
	        gInfo[id][Xpos] = x;
	        gInfo[id][Ypos] = y;
	        gInfo[id][Zpos] = z;
	        gInfo[id][XYpos] = rx;
	        gInfo[id][YYpos] = ry;
	        gInfo[id][ZYpos] = rz;

	        SetDynamicObjectPos(objectid, gInfo[id][Xpos], gInfo[id][Ypos], gInfo[id][Zpos]);
	        SetDynamicObjectRot(objectid, gInfo[id][XYpos], gInfo[id][YYpos], gInfo[id][ZYpos]);
		}
	}
	if( response == EDIT_RESPONSE_CANCEL )
	{
		if(GetPVarInt(playerid, "GraffitiCreating") == 1 )
		{
			DestroyDynamicObject( POBJECT[playerid] );
			SendClientMessage( playerid,0xFF6800FF,"Creation of Graffiti Canceled" ); // <---
			DeletePVar( playerid,"GraffitiCreating" );
		}
	}
    new String[10000];
    new idx = gymEditID[playerid];
	if(response == EDIT_RESPONSE_UPDATE)
	{
	    SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);
	}
	else if(response == EDIT_RESPONSE_CANCEL)
	{
	    if(gymEditID[playerid] != 0)
	    {
		    SetDynamicObjectPos(objectid, gymObjectPos[playerid][0], gymObjectPos[playerid][1], gymObjectPos[playerid][2]);
			SetDynamicObjectRot(objectid, gymObjectRot[playerid][0], gymObjectRot[playerid][1], gymObjectRot[playerid][2]);
			gymObjectPos[playerid][0] = 0; gymObjectPos[playerid][1] = 0; gymObjectPos[playerid][2] = 0;
			gymObjectRot[playerid][0] = 0; gymObjectRot[playerid][1] = 0; gymObjectRot[playerid][2] = 0;
			gymEdit[playerid] = 0;
			gymEditID[playerid] = 0;
		}
	}
	else if(response == EDIT_RESPONSE_FINAL)
	{
		SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);
		if(gymEdit[playerid] == 1)
		{
		    GYMInfo[idx][GYMOBJPos][0] = x;
	        GYMInfo[idx][GYMOBJPos][1] = y;
	        GYMInfo[idx][GYMOBJPos][2] = z;
	        GYMInfo[idx][GYMOBJPos][3] = rx;
	        GYMInfo[idx][GYMOBJPos][4] = ry;
	        GYMInfo[idx][GYMOBJPos][5] = rz;
	        GYMInfo[idx][GYMvw] = GetPlayerVirtualWorld(playerid);
        	GYMInfo[idx][GYMint] = GetPlayerInterior(playerid);
	        DestroyDynamic3DTextLabel(GYMInfo[idx][GYMOBJText]);
   			format(String, 128, "[ID:%d]\n{00FF00}Available\n%d/1000", idx, GYMInfo[idx][GYMOBJCondition]);
			GYMInfo[idx][GYMOBJText] = CreateDynamic3DTextLabel(String, COLOR_YELLOW, GYMInfo[idx][GYMOBJPos][0], GYMInfo[idx][GYMOBJPos][1], GYMInfo[idx][GYMOBJPos][2], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, GYMInfo[idx][GYMvw], GYMInfo[idx][GYMint], -1, 10.0);
			SaveGYMObject();
		    gymEdit[playerid] = 0;
		    gymEditID[playerid] = 0;
		}
	}
    idx = oEditID[playerid];
	if(response == EDIT_RESPONSE_UPDATE)
	{
	    SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);
	}
	else if(response == EDIT_RESPONSE_CANCEL)
	{
	    if(oEditID[playerid] != 0)
	    {
		    SetDynamicObjectPos(objectid, oPos[playerid][0], oPos[playerid][1], oPos[playerid][2]);
			SetDynamicObjectRot(objectid, oRot[playerid][0], oRot[playerid][1], oRot[playerid][2]);
			oPos[playerid][0] = 0; oPos[playerid][1] = 0; oPos[playerid][2] = 0;
			oRot[playerid][0] = 0; oRot[playerid][1] = 0; oRot[playerid][2] = 0;
			format(String, sizeof(String), " Anda membatalkan Edit Object ID %d.", idx);
			SendClientMessage(playerid, COLOR_WHITE, String);
			oEdit[playerid] = 0;
			oEditID[playerid] = 0;
		}
	}
	else if(response == EDIT_RESPONSE_FINAL)
	{
		SetDynamicObjectPos(objectid, x, y, z);
		SetDynamicObjectRot(objectid, rx, ry, rz);
		if(oEdit[playerid] == 1)
		{
		    ObjectInfo[idx][oX] = x;
			ObjectInfo[idx][oY] = y;
			ObjectInfo[idx][oZ] = z;
			ObjectInfo[idx][oRX] = rx;
			ObjectInfo[idx][oRY] = ry;
			ObjectInfo[idx][oRZ] = rz;
			//ObjectInfo[idx][oText] = CreateDynamic3DTextLabel(String, COLOR_WHITE, ObjectInfo[idx][oX], ObjectInfo[idx][oY], ObjectInfo[idx][oZ], 10);
		    oEdit[playerid] = 0;
		    oEditID[playerid] = 0;
		    format(String, sizeof(String), " Anda telah menyelesaikan Edit Posisi Object ID %d.", idx);
		    SendClientMessage(playerid, COLOR_WHITE, String);
			SaveObj();
		}
	}
	//--
	if(pData[playerid][EditingTreeID] != -1 && Iter_Contains(Trees, pData[playerid][EditingTreeID]))
	{
	    if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingTreeID];
	        TreeData[etid][treeX] = x;
	        TreeData[etid][treeY] = y;
	        TreeData[etid][treeZ] = z;
	        TreeData[etid][treeRX] = rx;
	        TreeData[etid][treeRY] = ry;
	        TreeData[etid][treeRZ] = rz;

	        SetDynamicObjectPos(objectid, TreeData[etid][treeX], TreeData[etid][treeY], TreeData[etid][treeZ]);
	        SetDynamicObjectRot(objectid, TreeData[etid][treeRX], TreeData[etid][treeRY], TreeData[etid][treeRZ]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_X, TreeData[etid][treeX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_Y, TreeData[etid][treeY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_Z, TreeData[etid][treeZ] + 1.5);

		    Tree_Save(etid);
	        pData[playerid][EditingTreeID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingTreeID];
	        SetDynamicObjectPos(objectid, TreeData[etid][treeX], TreeData[etid][treeY], TreeData[etid][treeZ]);
	        SetDynamicObjectRot(objectid, TreeData[etid][treeRX], TreeData[etid][treeRY], TreeData[etid][treeRZ]);
	        pData[playerid][EditingTreeID] = -1;
	    }
	}
    if(pData[playerid][EditingBerryID] != -1 && Iter_Contains(Berrys, pData[playerid][EditingBerryID]))
	{
	    if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingBerryID];
	        BerryData[etid][berryX] = x;
	        BerryData[etid][berryY] = y;
	        BerryData[etid][berryZ] = z;
	        BerryData[etid][berryRX] = rx;
	        BerryData[etid][berryRY] = ry;
	        BerryData[etid][berryRZ] = rz;

	        SetDynamicObjectPos(objectid, BerryData[etid][berryX], BerryData[etid][berryY], BerryData[etid][berryZ]);
	        SetDynamicObjectRot(objectid, BerryData[etid][berryRX], BerryData[etid][berryRY], BerryData[etid][berryRZ]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, BerryData[etid][berryLabel], E_STREAMER_X, BerryData[etid][berryX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, BerryData[etid][berryLabel], E_STREAMER_Y, BerryData[etid][berryY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, BerryData[etid][berryLabel], E_STREAMER_Z, BerryData[etid][berryZ] + 1.5);

		    Berry_Save(etid);
	        pData[playerid][EditingBerryID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingBerryID];
	        SetDynamicObjectPos(objectid, BerryData[etid][berryX], BerryData[etid][berryY], BerryData[etid][berryZ]);
	        SetDynamicObjectRot(objectid, BerryData[etid][berryRX], BerryData[etid][berryRY], BerryData[etid][berryRZ]);
	        pData[playerid][EditingBerryID] = -1;
	    }
	}
	if(pData[playerid][EditingOreID] != -1 && Iter_Contains(Ores, pData[playerid][EditingOreID]))
	{
	    if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingOreID];
	        OreData[etid][oreX] = x;
	        OreData[etid][oreY] = y;
	        OreData[etid][oreZ] = z;
	        OreData[etid][oreRX] = rx;
	        OreData[etid][oreRY] = ry;
	        OreData[etid][oreRZ] = rz;

	        SetDynamicObjectPos(objectid, OreData[etid][oreX], OreData[etid][oreY], OreData[etid][oreZ]);
	        SetDynamicObjectRot(objectid, OreData[etid][oreRX], OreData[etid][oreRY], OreData[etid][oreRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_X, OreData[etid][oreX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_Y, OreData[etid][oreY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_Z, OreData[etid][oreZ] + 1.5);

		    Ore_Save(etid);
	        pData[playerid][EditingOreID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingOreID];
	        SetDynamicObjectPos(objectid, OreData[etid][oreX], OreData[etid][oreY], OreData[etid][oreZ]);
	        SetDynamicObjectRot(objectid, OreData[etid][oreRX], OreData[etid][oreRY], OreData[etid][oreRZ]);
	        pData[playerid][EditingOreID] = -1;
	    }
	}
	if(pData[playerid][EditingATMID] != -1 && Iter_Contains(ATMS, pData[playerid][EditingATMID]))
	{
		if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        AtmData[etid][atmX] = x;
	        AtmData[etid][atmY] = y;
	        AtmData[etid][atmZ] = z;
	        AtmData[etid][atmRX] = rx;
	        AtmData[etid][atmRY] = ry;
	        AtmData[etid][atmRZ] = rz;

	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_X, AtmData[etid][atmX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Y, AtmData[etid][atmY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Z, AtmData[etid][atmZ] + 0.3);

		    Atm_Save(etid);
	        pData[playerid][EditingATMID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);
	        pData[playerid][EditingATMID] = -1;
	    }
	}
	if(pData[playerid][gEditID] != -1 && Iter_Contains(Gates, pData[playerid][gEditID]))
	{
		new id = pData[playerid][gEditID];
		if(response == EDIT_RESPONSE_UPDATE)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
		}
		else if(response == EDIT_RESPONSE_CANCEL)
		{
			SetDynamicObjectPos(objectid, gPosX[playerid], gPosY[playerid], gPosZ[playerid]);
			SetDynamicObjectRot(objectid, gRotX[playerid], gRotY[playerid], gRotZ[playerid]);
			gPosX[playerid] = 0; gPosY[playerid] = 0; gPosZ[playerid] = 0;
			gRotX[playerid] = 0; gRotY[playerid] = 0; gRotZ[playerid] = 0;
			Servers(playerid, " You have canceled editing gate ID %d.", id);
			Gate_Save(id);
		}
		else if(response == EDIT_RESPONSE_FINAL)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
			if(pData[playerid][gEdit] == 1)
			{
				gData[id][gCX] = x;
				gData[id][gCY] = y;
				gData[id][gCZ] = z;
				gData[id][gCRX] = rx;
				gData[id][gCRY] = ry;
				gData[id][gCRZ] = rz;
				if(IsValidDynamic3DTextLabel(gData[id][gText])) DestroyDynamic3DTextLabel(gData[id][gText]);
				new str[64];
				format(str, sizeof(str), "Gate ID: %d", id);
				gData[id][gText] = CreateDynamic3DTextLabel(str, COLOR_WHITE, gData[id][gCX], gData[id][gCY], gData[id][gCZ], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 10.0);

				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's closing position.", id);
				gData[id][gStatus] = 0;
				Gate_Save(id);
			}
			else if(pData[playerid][gEdit] == 2)
			{
				gData[id][gOX] = x;
				gData[id][gOY] = y;
				gData[id][gOZ] = z;
				gData[id][gORX] = rx;
				gData[id][gORY] = ry;
				gData[id][gORZ] = rz;

				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's opening position.", id);

				gData[id][gStatus] = 1;
				Gate_Save(id);
			}
		}
	}
	return 1;
}

public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	//pilot
	if(IsPlayerInDynamicCP(playerid, cp[playerid]))
	{
	    if(TakingPs[playerid] == 1)
	    {
     		rands2 = random(sizeof(RandomCPs));
	        while (rands2 == rands)
	        {
	            rands2 = random(sizeof(RandomCPs));
			}
	    	SendClientMessage(playerid, 0x00FF24AA, "You took passengers and now are looking to leave, when ready.");
	    	DestroyDynamicCP(cp[playerid]);
 			rands = random(sizeof(RandomCPs));
 			TakingPs[playerid] = 0;
	 		cp[playerid] = CreateDynamicCP(RandomCPs[rands2][0],RandomCPs[rands2][1],RandomCPs[rands2][2], 20, -1, playerid, -1, 6000);
	 		return 1;
		}
		if(TakingPs[playerid] == 0)
		{
		    new wst[180];
			new pilotN[MAX_PLAYER_NAME];
		    GetPlayerName(playerid, pilotN, sizeof(pilotN));
		    format(wst, sizeof(wst), "Officer looking at you said: Well work MR.%s you have done your job honestly then he fetches something from his pocket and handes to you.", pilotN);
		    SendClientMessage(playerid, 0x26CF12AA, "You completed your passengers' trip (Which you must have to do), then a staff officer approached you...");
		    SendClientMessage(playerid, 0x26CF12AA, wst);
		    SendClientMessage(playerid, 0x26CF12AA, "You then hurried and opened you hand, it was filled with bucks i.e cash. You were payed. If you again need the work type /pwork");
			GivePlayerMoney(playerid, WorkBucks);
			DestroyDynamicCP(cp[playerid]);
			TakingPs[playerid] = 2;
			return 1;
		}
	}
	//trash
	else if(checkpointid == TrashCP[playerid])
	{
	    if(!HasTrash[playerid]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You're not carrying a trash bag.");
	    new vehicleid = GetPVarInt(playerid, "LastVehicleID");
	    if(LoadedTrash[vehicleid] >= TRASH_LIMIT) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}This vehicle is full, you can't load any more trash.");
	    LoadedTrash[vehicleid]++;
		ApplyAnimation(playerid, "GRENADE", "WEAPON_throwu", 4.1, 0, 0, 0, 0, 0);
		SendClientMessage(playerid, COLOR_JOB, "TRASHMASTER: {FFFFFF}You've collected a trash bag.");

		if(TRASH_LIMIT - LoadedTrash[vehicleid] > 0)
		{
			new string[96];
			format(string, sizeof(string), "TRASHMASTER: {FFFFFF}You can load {F39C12}%d {FFFFFF}more trash bags to this vehicle.", TRASH_LIMIT - LoadedTrash[vehicleid]);
			SendClientMessage(playerid, COLOR_JOB, string);
		}

		new driver = GetVehicleDriver(vehicleid);
		if(IsPlayerConnected(driver)) Trash_ShowCapacity(driver);
		Trash_ResetPlayer(playerid);
		return 1;
	}

    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		for(new i; i < sizeof(FactoryData); i++)
		{
		    if(checkpointid == FactoryData[i][FactoryCP])
		    {
		        new string[128], vehicleid = GetPlayerVehicleID(playerid), cash = LoadedTrash[vehicleid] * TRASH_BAG_VALUE;
		        format(string, sizeof(string), "TRASHMASTER: {FFFFFF}Sold {F39C12}%d {FFFFFF}bags of trash and earned {2ECC71}$%d.", LoadedTrash[vehicleid], cash);
		        SendClientMessage(playerid, COLOR_JOB, string);
		        GivePlayerMoneyEx(playerid, cash);
		        FactoryData[i][FactoryCurrent] += LoadedTrash[vehicleid];
		        LoadedTrash[vehicleid] = 0;
                Trash_ShowCapacity(playerid);
                format(string, sizeof(string), "Recycling Factory - %s\n\n{FFFFFF}Current Trash Bags: {F39C12}%d\n{FFFFFF}Bring trash here to earn money!", FactoryData[i][FactoryName], FactoryData[i][FactoryCurrent]);
                UpdateDynamic3DTextLabelText(FactoryData[i][FactoryLabel], 0x2ECC71FF, string);

		        for(new x; x < sizeof(FactoryData); x++)
				{
				    if(IsValidDynamicMapIcon(FactoryIcons[playerid][x]))
				    {
				        DestroyDynamicMapIcon(FactoryIcons[playerid][x]);
				        FactoryIcons[playerid][x] = -1;
				    }
					TogglePlayerDynamicCP(playerid, FactoryData[x][FactoryCP], 0);
				}

		        break;
		    }
		}
	}
	//electrican
	if(checkpointid == ElectricCP[playerid])
	{
	    GetPVarInt(playerid, "LastVehicleID");

		ApplyAnimation(playerid, "CARRY", "liftup105", 4.1, 0, 0, 0, 0, 0);
		SetPlayerAttachedObject(playerid, 9, 1264, 6, 0.222, 0.024, 0.128, 1.90, -90.0, 0.0, 0.5,0.5, 0.5);
		SCM(playerid, COLOR_JOB, "ELECTRICAN: {FFFFFF}Anda Mengambil Tangga.");
		DestroyDynamicCP(TrashCP[playerid]);
		return 1;
	}
	else if(checkpointid == StoremeatCP[playerid])
	{
	    if(!GetMeatBag[playerid]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You're not carrying a meat bag.");

	    if(StoreMeat[playerid] == 10) return Error(playerid, "You has store 10 meat!");

	    StoreMeat[playerid] += 2;
	    GetMeatBag[playerid] = false;
	    ApplyAnimation(playerid, "GRENADE", "WEAPON_throwu", 4.1, 0, 0, 0, 0, 0);
	    RemovePlayerAttachedObject(playerid, ATTACHMENT_INDEX);
		SendClientMessage(playerid, COLOR_JOB, "BUTCHER: {FFFFFF}You've stored a meat bag.");

		Info(playerid, "You Has Stored "RED_E"%d "WHITE_E"Meat", StoreMeat[playerid]);
		return 1;
	}
	else if(checkpointid == pData[playerid][LoadingPoint])
	{
	    if(GetPVarInt(playerid, "LoadingCooldown") > gettime()) return 1;
		new vehicleid = GetPVarInt(playerid, "LastVehicleID"), type[64], carid = -1;
		if(pData[playerid][CarryingLog] == 0)
		{
			type = "Metal";
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			type = "Coal";
		}
		else
		{
			type = "Unknown";
		}
		if(Vehicle_LogCount(vehicleid) >= LOG_LIMIT) return Error(playerid, "You can't load any more ores to this vehicle.");
		if((carid = Vehicle_Nearest2(playerid)) != -1)
		{
			if(pData[playerid][CarryingLog] == 0)
			{
				pvData[carid][cMetal] += 1;
			}
			else if(pData[playerid][CarryingLog] == 1)
			{
				pvData[carid][cCoal] += 1;
			}
		}
		LogStorage[vehicleid][ pData[playerid][CarryingLog] ]++;
		Info(playerid, "MINING: Loaded %s.", type);
		ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);
		Player_RemoveLog(playerid);
		return 1;
	}
	else if(checkpointid == ShowRoomS)
	{
		ShowModelSelectionMenu(playerid, sportcar, "Sport Cars", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
	}
	else if(checkpointid == ShowRoomCPRent)
	{
		ShowModelSelectionMenu(playerid, rentjoblist, "Rent JobsCar", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
	}
	else if(checkpointid == BoatDealer)
	{
		ShowModelSelectionMenu(playerid, boatlist, "Buy Boat", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
	}
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	if(CheckpointLast[playerid] == 1)
	{
	    if(pData[playerid][pPacket] == 1)
	    {
		    DisablePlayerRaceCheckpoint(playerid);
		    pData[playerid][pPacket] = 0;
		    pCPPacket = INVALID_PLAYER_ID;
		    CheckpointLast[playerid] = 0;
		    taked = 0;
		    packet = 0;
		    new packet_price = Random(10000, 30000);

		    GivePlayerMoneyEx(playerid, packet_price);
		    new String[1280];
		    format(String, sizeof String, "SMUGGLER: {FFFFFF}You get $%s from delivering packet", FormatMoney(packet_price));
		 	SendClientMessage(playerid, COLOR_LOGS, String);
		 	return 1;
		}
	}
    /*if(SedangHauling[playerid] > 0)
	{
 		if(SedangHauling[playerid] == 1)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 2;
     		SetPlayerRaceCheckpoint(playerid, 1, -2471.2942, 783.0248, 35.1719, -2471.2942, 783.0248, 35.1719, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 2)
		{
   		if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 500);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[0] = false;
                DialogSaya[playerid][0] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$500 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 3)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 4;
     		SetPlayerRaceCheckpoint(playerid, 1, -576.2687, 2569.0842, 53.5156, 576.2687, 2569.0842, 53.5156, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 4)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 500);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[0] = false;
                DialogSaya[playerid][0] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$500 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 5)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 6;
     		SetPlayerRaceCheckpoint(playerid, 1, 1424.8624, 2333.4939, 10.8203, 1424.8624, 2333.4939, 10.8203, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 6)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 500);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[0] = false;
                DialogSaya[playerid][0] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$500 have been issued to your paycheck");
                return 1;
			}
		}
		if(SedangHauling[playerid] == 7)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 8;
     		SetPlayerRaceCheckpoint(playerid, 1, 1198.7153, 165.4331, 20.5056, 1198.7153, 165.4331, 20.5056, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 8)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 500);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[0] = false;
                DialogSaya[playerid][0] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$500 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 9)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 10;
     		SetPlayerRaceCheckpoint(playerid, 1, 1201.5385, 171.6184, 20.5035, 1201.5385, 171.6184, 20.5035, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 10)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 500);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[0] = false;
                DialogSaya[playerid][0] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$500 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 11)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 12;
     		SetPlayerRaceCheckpoint(playerid, 1, 2786.8313, -2417.9558, 13.6339, 2786.8313, -2417.9558, 13.6339, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 12)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 500);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[0] = false;
                DialogSaya[playerid][0] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$500 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 13)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 14;
     		SetPlayerRaceCheckpoint(playerid, 1, 1613.7815, 2236.2046, 10.3787, 1613.7815, 2236.2046, 10.3787, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 14)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 500);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[0] = false;
                DialogSaya[playerid][0] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$500 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 15)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 16;
     		SetPlayerRaceCheckpoint(playerid, 1, 2415.7803, -2470.1309, 13.6300, 2415.7803, -2470.1309, 13.6300, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 16)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 500);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[0] = false;
                DialogSaya[playerid][0] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$500 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 17)
	    {
     		DisablePlayerRaceCheckpoint(playerid);
     		SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
  			SedangHauling[playerid] = 18;
     		SetPlayerRaceCheckpoint(playerid, 1, -980.1684, -713.3505, 32.0078, -980.1684, -713.3505, 32.0078, 10.0);
       		return 1;
		}
		else if(SedangHauling[playerid] == 18)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 500);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[0] = false;
                DialogSaya[playerid][0] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$500 have been issued to your paycheck");
                return 1;
			}
		}
		else if(SedangHauling[playerid] == 19)
		{
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid, COLOR_JOB,"TRUCKING: {FFFFFF}Attach the trailer to your vehicle to order");
			SedangHauling[playerid] = 20;
			SetPlayerRaceCheckpoint(playerid, 1, -2226.1292, -2315.1055, 30.6045, -2226.1292, -2315.1055, 30.6045, 10.0);
			return 1;
		}
		else if(SedangHauling[playerid] == 20)
		{
			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
			{
			    DisablePlayerRaceCheckpoint(playerid);
                SedangHauling[playerid] = 0;
                AddPlayerSalary(playerid, "Sidejob(Hauling)", 500);
                pData[playerid][pTruckerTime] += 30*60;
                DialogHauling[0] = false;
                DialogSaya[playerid][0] = false;
                DestroyVehicle(GetVehicleTrailer(GetPlayerVehicleID(playerid)));
                SendClientMessage(playerid, COLOR_JOB, "TRUCKING: {FFFFFF}$500 have been issued to your paycheck");
                return 1;
			}
		}
	}*/
	if(pData[playerid][pTrackCar] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan kendaraan anda!");
		pData[playerid][pTrackCar] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackHouse] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan rumah anda!");
		pData[playerid][pTrackHouse] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackBisnis] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan bisnis anda!");
		pData[playerid][pTrackBisnis] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pMission] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		Info(playerid, "/buy , /gps(My Mission) , /storeproduct.");
	}
	if(pData[playerid][pHauling] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		Info(playerid, "/buy , /gps(My Hauling) , /storegas.");
	}
	if(pData[playerid][pRestock] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		Info(playerid, "/buy, /gps(My Restock Vending), /storestock.");
	}
    if(pData[playerid][pDealerMission] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		Info(playerid, "/gps(My Dealer Mission) , /storeveh.");
	}
	if(CheckpointPacket[playerid] == 1)
	{
		CheckpointPacket[playerid] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	DisablePlayerRaceCheckpoint(playerid);
	return 1;
}
public OnPlayerHackTeleport(playerid, Float:distance)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x,y,z);
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z))
	{
		new string[50];
		format(string, sizeof(string), "%s have detected hack teleport.", pData[playerid][pName]);
		SendClientMessageToAll(-1, string);
		Kick(playerid);
	}
	return 1;
}
CMD:openpara(playerid)
{
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerVehicleSeat(playerid) == 0)
	{
		new vid = GetPlayerVehicleID(playerid);
		if(IsToggleVehicleParachute(vid))
		{
			if(IsPlayerUsingVehPara(playerid))
			{
				StopVehicleParachuteAction(playerid);
				CallLocalFunction("OnVehicleParachuteThrown","dd",playerid,vid);
			}
			else
			{
				if(IsCollisionFlag(Item::GetCollisionFlags(vid,item_vehicle),POSITION_FLAG_AIR) && GetVehicleSpeed(vid) > 0.0)
				{
					StartVehicleParachuteAction(playerid);
					CallLocalFunction("OnVehicleParachuteOpened","dd",playerid,vid);
				}
				else
				{
					CallLocalFunction("OnVehicleParachuteOpenFail","dd",playerid,vid);
				}
			}
		}
	}
}
public OnVehicleParachuteThrown(playerid,vehicleid)
{
	InfoTD_MSG(playerid, 4000, "Vehicle Parachute ~r~thrown");
	return 1;
}

public OnVehicleParachuteOpened(playerid,vehicleid)
{
	InfoTD_MSG(playerid, 4000, "Vehicle Parachute ~g~opened");
	return 1;
}

public OnVehicleParachuteOpenFail(playerid,vehicleid)
{
	InfoTD_MSG(playerid, 4000, "Cannot use ~r~Parachute");
	return 1;
}
public OnPlayerAirbreak(playerid)
{
	SendClientMessage(playerid, -1, "You have detected airbreak teleport.");
	//Kick(playerid);
	return 1;
}
public OnPlayerEnterCheckpoint(playerid)
{
	if(pData[playerid][pSekolahSim] == 1)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 426)
		{
			if (IsPlayerInRangeOfPoint(playerid,  3.0, dmvpoint1))
			{
				SetPlayerCheckpoint(playerid, dmvpoint2, 3.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 3.0,dmvpoint2))
			{
				SetPlayerCheckpoint(playerid, dmvpoint3, 3.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 3.0,dmvpoint3))
			{
				SetPlayerCheckpoint(playerid, dmvpoint4, 3.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 3.0,dmvpoint4))
			{
				SetPlayerCheckpoint(playerid, dmvpoint5, 3.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 3.0,dmvpoint5))
			{
				SetPlayerCheckpoint(playerid, dmvpoint6, 3.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 3.0,dmvpoint6))
			{
				SetPlayerCheckpoint(playerid, dmvpoint7, 3.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 3.0,dmvpoint7))
			{
				SetPlayerCheckpoint(playerid, dmvpoint8, 3.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 3.0,dmvpoint8))
			{
				SetPlayerCheckpoint(playerid, dmvpoint9, 3.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 3.0,dmvpoint9))
			{
				pData[playerid][pDriveLic] = 1;
				pData[playerid][pSekolahSim] = 0;
				Global[SKM] = 0;
				DisablePlayerCheckpoint(playerid);
				pData[playerid][pDriveLicTime] = gettime() + (15 * 86400);
				Info(playerid, "Anda telah berhasil membuat SIM");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	//butcher
	if(GetPVarInt(playerid,"OnWork"))
	{
		DisablePlayerCheckpoint(playerid);
	}

	if(IsPlayerInRangeOfPoint(playerid, 2.0, 2846.0537,955.7325,10.7500)) //lv
	{
 		DisablePlayerCheckpoint(playerid);
 		return 1;
	}
	if(IsPlayerInRangeOfPoint(playerid, 2.0, -1873.7448,1417.5586,7.1763)) //sf
	{
 		DisablePlayerCheckpoint(playerid);
 		return 1;
	}
	if(IsPlayerInRangeOfPoint(playerid, 2.0, 163.5530,-54.8748,1.5781)) //ls
	{
 		DisablePlayerCheckpoint(playerid);
 		return 1;
	}
	if(IsPlayerInRangeOfPoint(playerid, 2.0, 1466.4801,1039.0343,10.0313)) //pusat
	{
 		DisablePlayerCheckpoint(playerid);
 		return 1;
	}

	if(pData[playerid][CarryingLog] != -1)
	{
		if(GetPVarInt(playerid, "LoadingCooldown") > gettime()) return 1;
		new vehicleid = GetPVarInt(playerid, "LastVehicleID"), type[64], carid = -1;
		if(pData[playerid][CarryingLog] == 0)
		{
			type = "Metal";
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			type = "Coal";
		}
		else
		{
			type = "Unknown";
		}
		if(Vehicle_LogCount(vehicleid) >= LOG_LIMIT) return Error(playerid, "You can't load any more ores to this vehicle.");
		if((carid = Vehicle_Nearest2(playerid)) != -1)
		{
			if(pData[playerid][CarryingLog] == 0)
			{
				pvData[carid][cMetal] += 1;
			}
			else if(pData[playerid][CarryingLog] == 1)
			{
				pvData[carid][cCoal] += 1;
			}
		}
		LogStorage[vehicleid][ pData[playerid][CarryingLog] ]++;
		Info(playerid, "MINING: Loaded %s.", type);
		ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);
		Player_RemoveLog(playerid);
		DisablePlayerCheckpoint(playerid);
		return 1;
	}
	if(pData[playerid][pFindEms] != INVALID_PLAYER_ID)
	{
		pData[playerid][pFindEms] = INVALID_PLAYER_ID;
		DisablePlayerCheckpoint(playerid);
	}
	if(pData[playerid][pSideJob] == 1)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 574)
		{
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint1))
			{
				SetPlayerCheckpoint(playerid, sweperpoint2, 7.0);
				GameTextForPlayer(playerid, "~g~Clean!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint2))
			{
				SetPlayerCheckpoint(playerid, sweperpoint3, 7.0);
				GameTextForPlayer(playerid, "~g~Clean!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint3))
			{
				SetPlayerCheckpoint(playerid, sweperpoint4, 7.0);
				GameTextForPlayer(playerid, "~g~Clean!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint4))
			{
				SetPlayerCheckpoint(playerid, sweperpoint5, 7.0);
			    GameTextForPlayer(playerid, "~g~Clean!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint5))
			{
				SetPlayerCheckpoint(playerid, sweperpoint6, 7.0);
				GameTextForPlayer(playerid, "~g~Clean!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint6))
			{
				SetPlayerCheckpoint(playerid, sweperpoint7, 7.0);
				GameTextForPlayer(playerid, "~g~Clean!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint7))
			{
				SetPlayerCheckpoint(playerid, sweperpoint8, 7.0);
				GameTextForPlayer(playerid, "~g~Clean!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint8))
			{
				SetPlayerCheckpoint(playerid, sweperpoint9, 7.0);
				GameTextForPlayer(playerid, "~g~Clean!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint9))
			{
				SetPlayerCheckpoint(playerid, sweperpoint10, 7.0);
				GameTextForPlayer(playerid, "~g~Clean!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint10))
			{
				SetPlayerCheckpoint(playerid, sweperpoint11, 7.0);
				GameTextForPlayer(playerid, "~g~Clean!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint11))
			{
				SetPlayerCheckpoint(playerid, sweperpoint12, 7.0);
				GameTextForPlayer(playerid, "~g~Clean!", 1000, 3);
			}
			if(IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint12))
			{
				pData[playerid][pSideJob] = 0;
				pData[playerid][pSweeperTime] = 900;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Sweeper)", 10000);
				Info(playerid, "Sidejob(Bus) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	if(pData[playerid][pSideJob] == 2)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 431)
		{
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint1))
			{
				SetPlayerCheckpoint(playerid, buspoint2, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint2))
			{
				SetPlayerCheckpoint(playerid, buspoint3, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint3))
			{
				SetPlayerCheckpoint(playerid, buspoint4, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint4))
			{
				SetPlayerCheckpoint(playerid, buspoint5, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint5))
			{
				SetPlayerCheckpoint(playerid, buspoint6, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint6))
			{
				SetPlayerCheckpoint(playerid, buspoint7, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint7))
			{
				SetPlayerCheckpoint(playerid, buspoint8, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint8))
			{
				SetPlayerCheckpoint(playerid, buspoint9, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint9))
			{
				SetPlayerCheckpoint(playerid, buspoint10, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint10))
			{
				SetPlayerCheckpoint(playerid, buspoint11, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint11))
			{
				SetPlayerCheckpoint(playerid, buspoint12, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint12))
			{
				SetPlayerCheckpoint(playerid, buspoint13, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint13))
			{
				SetPlayerCheckpoint(playerid, buspoint14, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint14))
			{
				SetPlayerCheckpoint(playerid, buspoint15, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint15))
			{
				SetPlayerCheckpoint(playerid, buspoint16, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint16))
			{
				SetPlayerCheckpoint(playerid, buspoint17, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint17))
			{
				SetPlayerCheckpoint(playerid, buspoint18, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint18))
			{
				SetPlayerCheckpoint(playerid, buspoint19, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint19))
			{
				SetPlayerCheckpoint(playerid, buspoint20, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint20))
			{
				SetPlayerCheckpoint(playerid, buspoint21, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint21))
			{
				SetPlayerCheckpoint(playerid, buspoint22, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint22))
			{
				SetPlayerCheckpoint(playerid, buspoint23, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint23))
			{
				SetPlayerCheckpoint(playerid, buspoint24, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint24))
			{
				SetPlayerCheckpoint(playerid, buspoint25, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint25))
			{
				SetPlayerCheckpoint(playerid, buspoint26, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint26))
			{
				SetPlayerCheckpoint(playerid, buspoint27, 7.0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 7.0,buspoint27))
			{
				pData[playerid][pSideJob] = 0;
				pData[playerid][pBusTime] = 1200;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Bus Route B)", 12500);
				Info(playerid, "Sidejob(Bus) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	if(pData[playerid][pSideJob] == 2)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 431)
		{
		    if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus1))
			{
			    SetPlayerCheckpoint(playerid,cpbus2, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus2))
			{
			    SetPlayerCheckpoint(playerid,cpbus3, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus3))
			{
			    SetPlayerCheckpoint(playerid,cpbus4, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus4))
			{
			    SetPlayerCheckpoint(playerid,cpbus5, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus5))
			{
			    SetPlayerCheckpoint(playerid,cpbus6, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus6))
			{
			    SetPlayerCheckpoint(playerid,cpbus7, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus7))
			{
			    SetPlayerCheckpoint(playerid,cpbus8, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus8))
			{
			    SetPlayerCheckpoint(playerid,cpbus9, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus9))
			{
			    SetPlayerCheckpoint(playerid,cpbus10, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus10))
			{
			    SetPlayerCheckpoint(playerid,cpbus11, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus11))
			{
			    SetPlayerCheckpoint(playerid,cpbus12, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus12))
			{
			    SetPlayerCheckpoint(playerid,cpbus13, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus13))
			{
			    SetPlayerCheckpoint(playerid,cpbus14, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus14))
			{
			    SetPlayerCheckpoint(playerid,cpbus15, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus15))
			{
			    SetPlayerCheckpoint(playerid,cpbus16, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus16))
			{
			    SetPlayerCheckpoint(playerid,cpbus17, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus17))
			{
			    SetPlayerCheckpoint(playerid,cpbus18, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus18))
			{
			    SetPlayerCheckpoint(playerid,cpbus19, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus19))
			{
			    SetPlayerCheckpoint(playerid,cpbus20, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus20))
			{
			    SetPlayerCheckpoint(playerid,cpbus21, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus21))
			{
			    SetPlayerCheckpoint(playerid,cpbus22, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,cpbus22))
			{
			    SetPlayerCheckpoint(playerid,cpbus23, 7.0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 7.0,cpbus23))
			{
				SetPlayerCheckpoint(playerid,cpbus24, 7.0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 7.0,cpbus24))
			{
			    pData[playerid][pSideJob] = 0;
				pData[playerid][pBusTime] = 1200;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Bus Route B)", 15500);
				Info(playerid, "Sidejob(Bus) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	if(pData[playerid][pSideJob] == 2)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 431)
		{
		    if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp1))
			{
			    SetPlayerCheckpoint(playerid,buscp2, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp2))
			{
			    SetPlayerCheckpoint(playerid,buscp3, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp3))
			{
			    SetPlayerCheckpoint(playerid,buscp4, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp4))
			{
			    SetPlayerCheckpoint(playerid,buscp5, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp5))
			{
			    SetPlayerCheckpoint(playerid,buscp6, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp6))
			{
			    SetPlayerCheckpoint(playerid,buscp7, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp7))
			{
			    SetPlayerCheckpoint(playerid,buscp8, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp8))
			{
			    SetPlayerCheckpoint(playerid,buscp9, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp9))
			{
			    SetPlayerCheckpoint(playerid,buscp10, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp10))
			{
			    SetPlayerCheckpoint(playerid,buscp11, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp11))
			{
			    SetPlayerCheckpoint(playerid,buscp12, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp12))
			{
			    SetPlayerCheckpoint(playerid,buscp13, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp13))
			{
			    SetPlayerCheckpoint(playerid,buscp14, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp14))
			{
			    SetPlayerCheckpoint(playerid,buscp15, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp15))
			{
			    SetPlayerCheckpoint(playerid,buscp16, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp16))
			{
			    SetPlayerCheckpoint(playerid,buscp17, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp17))
			{
			    SetPlayerCheckpoint(playerid,buscp18, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp18))
			{
			    SetPlayerCheckpoint(playerid,buscp19, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp19))
			{
			    SetPlayerCheckpoint(playerid,buscp20, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp20))
			{
			    SetPlayerCheckpoint(playerid,buscp21, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buscp21))
			{
			    pData[playerid][pSideJob] = 0;
				pData[playerid][pBusTime] = 1200;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Bus Route C)", 20000);
				Info(playerid, "Sidejob(Bus) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	if(pData[playerid][pSideJob] == 3)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 530)
		{
			if (IsPlayerInRangeOfPoint(playerid, 4.0,forpoint1))
			{
				SetPlayerCheckpoint(playerid, forpoint2, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ForkliftTake", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Mengangkat Box...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0,forpoint2))
			{
				SetPlayerCheckpoint(playerid, forpoint3, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ForkliftDown", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Meletakkan Box...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0,forpoint3))
			{
				SetPlayerCheckpoint(playerid, forpoint4, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ForkliftTake", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Mengangkat Box...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0,forpoint4))
			{
				SetPlayerCheckpoint(playerid, forpoint5, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ForkliftDown", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Meletakkan Box...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0,forpoint5))
			{
				SetPlayerCheckpoint(playerid, forpoint6, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ForkliftTake", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Mengangkat Box...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0,forpoint6))
			{
				SetPlayerCheckpoint(playerid, forpoint7, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ForkliftDown", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Meletakkan Box...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0,forpoint7))
			{
				SetPlayerCheckpoint(playerid, forpoint8, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ForkliftTake", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Mengangkat Box...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0,forpoint8))
			{
				SetPlayerCheckpoint(playerid, forpoint9, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ForkliftDown", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Meletakkan Box...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0,forpoint9))
			{
				SetPlayerCheckpoint(playerid, forpoint10, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ForkliftTake", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Mengangkat Box...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0,forpoint10))
			{
				SetPlayerCheckpoint(playerid, forpoint11, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ForkliftDown", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Meletakkan Box...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if(IsPlayerInRangeOfPoint(playerid, 4.0,forpoint11))
			{
				pData[playerid][pSideJob] = 0;
				pData[playerid][pForkliftTime] = 900;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Forklift)", 10000);
				Info(playerid, "Sidejob(Bus) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
				return 1;
			}
		}
	}
    if(SedangAnterPizza[playerid] == 1) // pizza
	{
        SedangAnterPizza[playerid] = 0;
	    pData[playerid][pPizzaTime] = 600;
    	AddPlayerSalary(playerid, "Sidejob(Pizza)", 5000);
    	new fmt_str[1280];
    	RemovePlayerAttachedObject(playerid,1);
    	format(fmt_str, sizeof fmt_str, "PIZZA JOB: {ffffff}Kamu mendapatkan $50.00 dari hasil mengirim pizza dan dimasukkan ke salary.");
    	SendClientMessage(playerid,COLOR_RIKO, "PIZZA JOB: {ffffff}Kamu berhasil mengirimkan pizza dan mendapat delay 10 menit.");
        SendClientMessage(playerid,COLOR_RIKO, fmt_str);
        DisablePlayerCheckpoint(playerid);
	}
    if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 578)
		{
			if (IsPlayerInRangeOfPoint(playerid, 4.0,containerpoint1))
			{
				SetPlayerCheckpoint(playerid, 2869.1934,917.6111,10.7500, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ContainerTake", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Memuat Container...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0,containerpoint2))
			{
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("ContainerDown", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Meletakkan Container...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				pData[playerid][pSideJob] = 0;
				pData[playerid][pJobTime] = 1800;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Trucker(Container)", 35000);
				Info(playerid, "Trucker(Container) telah masuk ke pending salary anda!");
				return 1;
			}
		}
	}
	if(pData[playerid][pJob] == 9 || pData[playerid][pJob2] == 9)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 482)
		{
			if (IsPlayerInRangeOfPoint(playerid, 4.0, 2787.4229,-2417.5588,13.6338))
			{
				SetPlayerCheckpoint(playerid, 2785.6194,-2455.9802,13.6342, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("KurirDone", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Meletakkan Crate...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0, 2785.6194,-2455.9802,13.6342))
			{
				SetPlayerCheckpoint(playerid, 2787.2864,-2494.1882,13.6509, 4.0);
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("KurirDone", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Memuat Crate...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				return 1;
			}
			if (IsPlayerInRangeOfPoint(playerid, 4.0,2787.2864,-2494.1882,13.6509))
			{
				TogglePlayerControllable(playerid, 0);
				pData[playerid][pActivity] = SetTimerEx("KurirDone", 400, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Memuat Crate...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				pData[playerid][pSideJob] = 0;
				pData[playerid][pJobTime] = 800;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Couriers(Jobs)", 6500);
				Info(playerid, "Couriers(Jobs) telah masuk ke pending salary anda!");
				return 1;
			}
		}
	}
	//DisablePlayerCheckpoint(playerid);
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	KillTimer(pData[playerid][LimitSpeedTimer]);
	if(pData[playerid][pSekolahSim] == 1)
	{
		//new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 426)
		{
		    DisablePlayerCheckpoint(playerid);
		    Info(playerid, "Anda gagal test mengemudi karena telah keluar dari kendaraan!");
		    RemovePlayerFromVehicle(playerid);
		    Global[SKM] = 0;
		    pData[playerid][pSekolahSim] = 0;
		    SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
		}
	}
    if (GetVehicleModel(vehicleid) == 574)
	{
	    {
	        SendClientMessageEx(playerid,COLOR_RIKO,"SIDEJOB:{FFFFFF}Kamu telah berhenti bekerja, kamu dapat bekerja Street Sweeper 10 menit lagi.");
			pData[playerid][pSideJob] = 0;
			RemovePlayerFromVehicle(playerid);
			SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			pData[playerid][pSweeperTime] = 600;
			DisablePlayerCheckpoint(playerid);
	    }
	}
	else if (GetVehicleModel(vehicleid) == 431)
	{
	    {
	        SendClientMessageEx(playerid,COLOR_RIKO,"SIDEJOB:{FFFFFF}Kamu telah berhenti bekerja, kamu dapat bekerja sebagai Bus Driver 10 menit lagi.");
			pData[playerid][pSideJob] = 0;
			RemovePlayerFromVehicle(playerid);
			SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			pData[playerid][pBusTime] = 600;
			DisablePlayerCheckpoint(playerid);
	    }
	}
	else if (GetVehicleModel(vehicleid) == 530)
	{
	    {
	        SendClientMessageEx(playerid,COLOR_RIKO,"SIDEJOB:{FFFFFF}Kamu telah berhenti bekerja, kamu dapat bekerja Forklift 10 menit lagi.");
			pData[playerid][pSideJob] = 0;
			RemovePlayerFromVehicle(playerid);
			SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			pData[playerid][pForkliftTime] = 600;
			DisablePlayerCheckpoint(playerid);
	    }
	}
	return 1;
}

public OnDynamicObjectMoved(objectid)
{
    new playerid = Streamer_GetIntData(STREAMER_TYPE_OBJECT,objectid,E_STREAMER_EXTRA_ID);
    if(playerid != INVALID_PLAYER_ID)
    {
		new Float:x,Float:y,Float:z;
		GetDynamicObjectPos(objectid,x,y,z);
        if(GetPVarInt(playerid,"MeatCheck"))
        {
			if(x == 944.204345)
			{
				DestroyDynamicObject(objectid);
			    GoObject(playerid);
				DeletePVar(playerid,"MeatCheck");
				GameTextForPlayer(playerid,"~g~GOOD JOB",500,5);
				SetPVarInt(playerid,"BadMeatDel", GetPVarInt(playerid,"BadMeatDel") +1);
				StoreMeat[playerid]--;
				Info(playerid, "Remaining "RED_E"%d "WHITE_E"Meat (threw out "RED_E"%d "WHITE_E"spoiled pieces)", StoreMeat[playerid],GetPVarInt(playerid,"BadMeatDel"));
			}
        }
        else
        {
            if(y == 2123.890380)
            {
			    if(StoreMeat[playerid] == -1)
				{
			    	Info(playerid, "Finish.");
			    	if(IsValidDynamicObject(playerobject[playerid][0])) DestroyDynamicObject(playerobject[playerid][0]);
					else if(IsValidDynamicObject(playerobject[playerid][1])) DestroyDynamicObject(playerobject[playerid][1]);
					SetPlayerVirtualWorld(playerid,0);
				    TogglePlayerControllable(playerid, 1);
				    SetCameraBehindPlayer(playerid);
				    DeletePVar(playerid,"MeatCheck");
					DeletePVar(playerid,"InWork");
					DeletePVar(playerid,"MeatCheck");
					DeletePVar(playerid,"BadMeatDel");
					DeletePVar(playerid,"BadMeat");
					DeletePVar(playerid,"OldSkin");
					DeletePVar(playerid,"OnWork");
			    }
			    if(GetPVarInt(playerid,"BadMeat")) GameTextForPlayer(playerid,"~r~BAD JOB",500,5);
                else GameTextForPlayer(playerid,"~g~GOOD JOB",500,5);
                DestroyDynamicObject(objectid);
			    GoObject(playerid);
			    StoreMeat[playerid]--;
			    Info(playerid, "Remaining "RED_E"%d "WHITE_E"Meat (threw out "RED_E"%d "WHITE_E"spoiled pieces)",StoreMeat[playerid] ,GetPVarInt(playerid,"BadMeatDel"));
            }
        }
    }
	return 1;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	if(EnterDoor(playerid))
	{
		InfoTD_MSG(playerid, 4000, "~w~ Type ~r~'/en' ~w~Or Press~r~ F");
		return 1;
	}
	return 1;
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    //Vote System
	if(VoteOn && VoteVoted[playerid] == 0)
	{
	    if(newkeys == KEY_YES)
	    {
	        VoteY++;
	        VoteVoted[playerid] = 1;
	        SendClientMessage(playerid, COLOR_RIKO, "[VOTE]{FFFFFF} Anda memilih {33AA33}IYA{FFFFFF}.");
		}
	    if(newkeys == KEY_NO)
	    {
		    VoteN++;
		    VoteVoted[playerid] = 1;
		    SendClientMessage(playerid, COLOR_RIKO, "[VOTE]{FFFFFF} Anda memilih {FF0000}TIDAK{FFFFFF}.");
	    }
	}
	if(PRESSED(KEY_FIRE) && GetPVarInt(playerid, "GraffitiCreating") == 0  && GetPlayerWeapon(playerid) == 41 )
	{
		if(!IsValidDynamicObject(POBJECT[playerid]))
    	{
		    spraytimerch[playerid] = SetTimerEx( "sprayingch", 1000, true, "i", playerid );
		    SetPVarInt(playerid, "GraffitiMenu", 1);
	    	return 1;
	    }
	    return ShowPlayerDialog(playerid, DIALOG_GDOBJECT, DIALOG_STYLE_MSGBOX, "Graffiti", "Anda sudah membuat graffiti\n\nJika anda ingin melanjutkan, text sebelumnya akan terhapus.", "Oke", "Cancel");
	}
	if(RELEASED( KEY_FIRE ) && GetPVarInt(playerid, "GraffitiMenu") == 1 && GetPlayerWeapon(playerid) == 41)
	{
	    KillTimer( spraytimerch[playerid] );
	    graffmenup[playerid] = 0;
	    DeletePVar(playerid, "GraffitiMenu");
	    return 1;
	}
	if( RELEASED( KEY_FIRE ) && GetPVarInt(playerid, "GraffitiCreating") == 1 )
	{
		if(GetPlayerWeapon(playerid) == 41 )
		{
		    KillTimer( spraytimer[playerid] );
	    	sprayammount[playerid] --;
    	 	spraytimerx[playerid] = SetTimerEx( "killgr", 90000, true, "i", playerid );
		}
	}
	if(newkeys == KEY_CROUCH)
   	{
      	if(IsPlayerInAnyVehicle(playerid))
      	{
        	return callcmd::paytoll(playerid);
      	}
   	}
   	/*if(newkeys == KEY_LOOK_BEHIND)
   	{
      	{
        	ShowPlayerDialog(playerid, DIALOG_VC, DIALOG_STYLE_LIST, "Vehicle Control", "Engine\nLock\nLights", "Select", "Cancel");
      	}
   	}*/
	//butcher
	if(newkeys & KEY_CTRL_BACK && !GetPVarInt(playerid,"InWork") && GetPVarInt(playerid,"OnWork"))
	{
	    if(IsPlayerInRangeOfPoint(playerid,2.0,940.1020,2127.6326,1011.0303))
	    {
	        ShowPlayerDialog(playerid,D_WORK_INFO,DIALOG_STYLE_MSGBOX,"Information","Butcher - Sidejob\n\n"WHITE_E"You have to stored 10 meat and select the meat.\n\n"GREEN_E"Green "WHITE_E"meat is spoiled.\nAs it will be a "RED_E"red "WHITE_E"square press the {f7ae11}Y{ffffff}\nTo "YELLOW_E"end the operation, press {f7ae11}N","Ok","");
	    }
	}
	if(newkeys & KEY_NO && !GetPVarInt(playerid,"MeatCheck"))
	{
		if(IsValidDynamicObject(playerobject[playerid][0])) DestroyDynamicObject(playerobject[playerid][0]);
		else if(IsValidDynamicObject(playerobject[playerid][1])) DestroyDynamicObject(playerobject[playerid][1]);
		SetPlayerVirtualWorld(playerid,0);
	    TogglePlayerControllable(playerid, 1);
	    SetCameraBehindPlayer(playerid);
	    DeletePVar(playerid,"InWork");
	}
	if(newkeys & KEY_YES && !GetPVarInt(playerid,"MeatCheck") && GetPVarInt(playerid,"InWork") && GetPVarInt(playerid,"OnWork"))
	{
		if(StoreMeat[playerid] == 0)
		{
		    if(GetPVarInt(playerid,"BadMeat"))
		    {
				new Float:x,Float:y,Float:z;
				GetDynamicObjectPos(playerobject[playerid][0],x,y,z);
				if(floatround(y) == 2127)
				{
				    StopDynamicObject(playerobject[playerid][0]);
				    MoveDynamicObject(playerobject[playerid][0],944.204345, y, z,2);
				    SetPVarInt(playerid,"MeatCheck",1);
				    StoreMeat[playerid] -= 1;
				}
				else
				{
					DestroyDynamicObject(playerobject[playerid][0]);
				    GoObject(playerid);
					GameTextForPlayer(playerid,"~r~BAD JOB",500,5);
				}
			}
			else GameTextForPlayer(playerid,"~r~BAD JOB",500,5);
		}
		Info(playerid, "Finish.");
		if(IsValidDynamicObject(playerobject[playerid][0])) DestroyDynamicObject(playerobject[playerid][0]);
		else if(IsValidDynamicObject(playerobject[playerid][1])) DestroyDynamicObject(playerobject[playerid][1]);
		SetPlayerVirtualWorld(playerid,0);
	    TogglePlayerControllable(playerid, 1);
	    SetCameraBehindPlayer(playerid);
	    DeletePVar(playerid,"InWork");
	}
    if((newkeys & KEY_NO) && HasTrash[playerid])
	{
		Trash_ResetPlayer(playerid);
		SendClientMessage(playerid, COLOR_JOB, "TRASHMASTER: {FFFFFF}Trash bag removed.");
	}
    if(Player_Fire_Enabled[playerid])
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if(vehicleid)
			{
				new vehicle_modelid = GetVehicleModel(vehicleid);
				if(FIRE_INFO[vehicle_modelid - 400][fire_VALID])
				{
					if(PRESSED(KEY_SPRINT))
					{
						Player_Key_Sprint_Time[playerid] = gettime();
					}
					else if(RELEASED(KEY_SPRINT))
					{
						if(gettime() - Player_Key_Sprint_Time[playerid] > 1)
						{
							PlayerPlaySound(playerid, 1131, 0.0, 0.0, 0.0);

							new effect_object = CreateObject(18695, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0), effect_object2 = -1;
							AttachDynamicObjectToVehicle
							(
								effect_object, vehicleid,
								FIRE_INFO[vehicle_modelid - 400][fire_OFFSET_X], FIRE_INFO[vehicle_modelid - 400][fire_OFFSET_Y], FIRE_INFO[vehicle_modelid - 400][fire_OFFSET_Z],
								FIRE_INFO[vehicle_modelid - 400][fire_ROT_X], FIRE_INFO[vehicle_modelid - 400][fire_ROT_Y], FIRE_INFO[vehicle_modelid - 400][fire_ROT_Z]
							);

							if(FIRE_INFO[vehicle_modelid - 400][fire_MIRROR])
							{
								effect_object2 = CreateObject(18695, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
								AttachDynamicObjectToVehicle
								(
									effect_object2, vehicleid,
									-FIRE_INFO[vehicle_modelid - 400][fire_OFFSET_X], FIRE_INFO[vehicle_modelid - 400][fire_OFFSET_Y], FIRE_INFO[vehicle_modelid - 400][fire_OFFSET_Z],
									FIRE_INFO[vehicle_modelid - 400][fire_ROT_X], -FIRE_INFO[vehicle_modelid - 400][fire_ROT_Y], -FIRE_INFO[vehicle_modelid - 400][fire_ROT_Z]
								);
							}

							SetTimerEx("DestroyEffectObject", 100, false, "ii", effect_object, effect_object2);
						}
					}
				}
			}
		}
	}
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && (newkeys & KEY_NO))
	{
	    if(pData[playerid][CarryingLumber])
		{
			Player_DropLumber(playerid);
		}
		else if(pData[playerid][CarryingLog] == 0)
		{
			Player_DropLog(playerid, pData[playerid][CarryingLog]);
			Info(playerid, "You dropping metal ore.");
			DisablePlayerCheckpoint(playerid);
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			Player_DropLog(playerid, pData[playerid][CarryingLog]);
			Info(playerid, "You dropping coal ore.");
			DisablePlayerCheckpoint(playerid);
		}
	}
	if((newkeys & KEY_SECONDARY_ATTACK))
    {
		foreach(new did : Doors)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
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
					new params[256];
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
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
			{
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return Error(playerid, "This door only for faction.");
				}

				if(dData[did][dCustom])
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				else
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				pData[playerid][pInDoor] = -1;
				SetPlayerInterior(playerid, dData[did][dExtint]);
				SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
			}
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
			pData[playerid][pInBiz] = -1;
			SetPlayerPositionEx(playerid, bData[inbisnisid][bExtposX], bData[inbisnisid][bExtposY], bData[inbisnisid][bExtposZ], bData[inbisnisid][bExtposA]);

			StopAudioStreamForPlayer(playerid);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
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
			pData[playerid][pInHouse] = -1;
			SetPlayerPositionEx(playerid, hData[inhouseid][hExtposX], hData[inhouseid][hExtposY], hData[inhouseid][hExtposZ], hData[inhouseid][hExtposA]);

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
	//SAPD Taser/Tazer
	if(newkeys & KEY_FIRE && TaserData[playerid][TaserEnabled] && GetPlayerWeapon(playerid) == 0 && !IsPlayerInAnyVehicle(playerid) && TaserData[playerid][TaserCharged])
	{
  		TaserData[playerid][TaserCharged] = false;

	    new Float: x, Float: y, Float: z, Float: health;
     	GetPlayerPos(playerid, x, y, z);
	    PlayerPlaySound(playerid, 6003, 0.0, 0.0, 0.0);
	    ApplyAnimation(playerid, "KNIFE", "KNIFE_3", 4.1, 0, 1, 1, 0, 0, 1);
		pData[playerid][pActivityTime] = 0;
	    TaserData[playerid][ChargeTimer] = SetTimerEx("ChargeUp", 1000, true, "i", playerid);
		PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Recharge...");
		PlayerTextDrawShow(playerid, ActiveTD[playerid]);
		ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);

	    for(new i, maxp = GetPlayerPoolSize(); i <= maxp; ++i)
		{
	        if(!IsPlayerConnected(i)) continue;
          	if(playerid == i) continue;
          	if(TaserData[i][TaserCountdown] != 0) continue;
          	if(IsPlayerInAnyVehicle(i)) continue;
			if(GetPlayerDistanceFromPoint(i, x, y, z) > 2.0) continue;
			ClearAnimations(i, 1);
			TogglePlayerControllable(i, false);
   			ApplyAnimation(i, "CRACK", "crckdeth2", 4.1, 0, 0, 0, 1, 0, 1);
			PlayerPlaySound(i, 6003, 0.0, 0.0, 0.0);

			GetPlayerHealth(i, health);
			TaserData[i][TaserCountdown] = TASER_BASETIME + floatround((100 - health) / 12);
   			Info(i, "You got tased for %d secounds!", TaserData[i][TaserCountdown]);
			TaserData[i][GetupTimer] = SetTimerEx("TaserGetUp", 1000, true, "i", i);
			break;
	    }
	}
	if((newkeys & KEY_CTRL_BACK ))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			return callcmd::berry(playerid, "pickup");
		}
	}
	//Vehicle
	if((newkeys & KEY_YES ))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			return callcmd::v(playerid, "engine");
		}
	}
	if((newkeys & KEY_NO ))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			return callcmd::v(playerid, "lights");
		}
	}
	if(GetPVarInt(playerid, "UsingSprunk"))
	{
		if(pData[playerid][pEnergy] >= 100 )
		{
  			Info(playerid, " Kamu terlalu banyak minum.");
	   	}
	   	else
	   	{
	   		pData[playerid][pBladder] -= 1;
		    pData[playerid][pEnergy] += 5;
		}
	}
	if(PRESSED( KEY_FIRE ))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsPlayerInAnyVehicle(playerid))
		{
			foreach(new did : Doors)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
				{
					if(dData[did][dGarage] == 1)
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
							new params[256];
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
				}
				new xid = pData[playerid][pInDoor];
				if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[xid][dIntposX], dData[xid][dIntposY], dData[xid][dIntposZ]))
				{
					if(dData[xid][dGarage] == 1)
					{
						if(dData[xid][dFaction] > 0)
						{
							if(dData[xid][dFaction] != pData[playerid][pFaction])
								return Error(playerid, "This door only for faction.");
						}

						if(dData[xid][dCustom])
						{
							SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[xid][dExtposX], dData[xid][dExtposY], dData[xid][dExtposZ], dData[xid][dExtposA]);
						}
						else
						{
							SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[xid][dExtposX], dData[xid][dExtposY], dData[xid][dExtposZ], dData[xid][dExtposA]);
						}
						pData[playerid][pInDoor] = -1;
						SetPlayerInterior(playerid, dData[xid][dExtint]);
						SetPlayerVirtualWorld(playerid, dData[xid][dExtvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, WorldWeather);
					}
				}
			}
		}
	}
	//if(IsKeyJustDown(KEY_CTRL_BACK,newkeys,oldkeys))
	if(PRESSED( KEY_CTRL_BACK ))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && pData[playerid][pCuffed] == 0)
		{
			ClearAnimations(playerid);
			StopLoopingAnim(playerid);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			TextDrawHideForPlayer(playerid, txtAnimHelper);
		}
    }
	if(IsKeyJustDown(KEY_SECONDARY_ATTACK, newkeys, oldkeys))
	{
		if(GetPVarInt(playerid, "UsingSprunk"))
		{
			DeletePVar(playerid, "UsingSprunk");
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
	}
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	//trasher
	if(newstate == PLAYER_STATE_DRIVER)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);
	    if(GetVehicleModel(vehicleid) == 408)
	    {
		    if(LoadedTrash[vehicleid] > 0)
		    {
		        new string[128];
		        format(string, sizeof(string), "TRASHMASTER: {FFFFFF}This vehicle has {F39C12}%d {FFFFFF}trash bags which is worth {2ECC71}$%d.", LoadedTrash[vehicleid], LoadedTrash[vehicleid] * TRASH_BAG_VALUE);
				SendClientMessage(playerid, COLOR_JOB, string);
				SendClientMessage(playerid, COLOR_JOB, "TRASHMASTER: {FFFFFF}You can sell your trash bags to recycling factories marked by a truck icon.");

				for(new i; i < sizeof(FactoryData); i++)
				{
				    FactoryIcons[playerid][i] = CreateDynamicMapIcon(FactoryData[i][FactoryX], FactoryData[i][FactoryY], FactoryData[i][FactoryZ], 51, 0, _, _, playerid, 8000.0, MAPICON_GLOBAL);
					TogglePlayerDynamicCP(playerid, FactoryData[i][FactoryCP], 1);
				}
		    }
		    else
		    {
		        SendClientMessage(playerid, COLOR_JOB, "TRASHMASTER: {FFFFFF}You can collect trash and sell them at recycling factories.");
		        SendClientMessage(playerid, COLOR_JOB, "TRASHMASTER: {FFFFFF}Find trash cans or dumpsters and use '/pickup'.");
		    }

			Trash_ShowCapacity(playerid);
		}
		SetPVarInt(playerid, "LastVehicleID", vehicleid);
	}

	if(oldstate == PLAYER_STATE_DRIVER)
	{
		for(new i; i < sizeof(FactoryData); i++)
		{
		    if(IsValidDynamicMapIcon(FactoryIcons[playerid][i]))
		    {
		        DestroyDynamicMapIcon(FactoryIcons[playerid][i]);
		        FactoryIcons[playerid][i] = -1;
		    }

			TogglePlayerDynamicCP(playerid, FactoryData[i][FactoryCP], 0);
		}

		PlayerTextDrawHide(playerid, CapacityText[playerid]);
		HidePlayerProgressBar(playerid, CapacityBar[playerid]);
	}
	Trash_ResetPlayer(playerid);
	//electrican
	if(newstate == PLAYER_STATE_DRIVER)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);
	    if(GetVehicleModel(vehicleid) == 552)
	    {
		   	SendClientMessage(playerid, 0x2ECC71FF, "ELECTRICAN: {FFFFFF}.");
		}
		SetPVarInt(playerid, "LastVehicleID", vehicleid);
	}
	if(newstate == PLAYER_STATE_WASTED && pData[playerid][pJail] < 1)
    {
		if(pData[playerid][pInjured] == 0)
        {
            pData[playerid][pInjured] = 1;
            SetPlayerHealthEx(playerid, 99999);

            pData[playerid][pInt] = GetPlayerInterior(playerid);
            pData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);

            GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
            GetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
        }
        else
        {
            pData[playerid][pHospital] = 1;
        }
	}
	//Spec Player
	new vehicleid = GetPlayerVehicleID(playerid);
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		if(pData[playerid][playerSpectated] != 0)
		{
			foreach(new ii : Player)
			{
				if(pData[ii][pSpec] == playerid)
				{
					PlayerSpectatePlayer(ii, playerid);
					Servers(ii, ,"%s(%i) is now on foot.", pData[playerid][pName], playerid);
				}
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
		if(pData[playerid][pInjured] == 1)
        {
            //RemoveFromVehicle(playerid);
			RemovePlayerFromVehicle(playerid);
            SetPlayerHealthEx(playerid, 99999);
        }
		foreach (new ii : Player) if(pData[ii][pSpec] == playerid)
		{
            PlayerSpectateVehicle(ii, GetPlayerVehicleID(playerid));
        }
	}
	if(oldstate == PLAYER_STATE_PASSENGER)
	{
		TextDrawHideForPlayer(playerid, TextFare);
		TextDrawHideForPlayer(playerid, DPvehfare[playerid]);
	}
	if(oldstate == PLAYER_STATE_DRIVER)
    {
		if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CARRY || GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED)
            return RemovePlayerFromVehicle(playerid);/*RemoveFromVehicle(playerid);*/

		PlayerTextDrawHide(playerid, DPvehname[playerid]);
        PlayerTextDrawHide(playerid, DPvehengine[playerid]);
        PlayerTextDrawHide(playerid, DPvehspeed[playerid]);
        PlayerTextDrawHide(playerid, HBEC[playerid]);

		TextDrawHideForPlayer(playerid, DPvehfare[playerid]);
		TextDrawHideForPlayer(playerid, VehBox);
        for(new txd; txd < 6; txd++)
		{
			TextDrawHideForPlayer(playerid, HudVeh[txd]);
		}
		//HBE textdraw Simple
		PlayerTextDrawHide(playerid, SPvehname[playerid]);
        PlayerTextDrawHide(playerid, SPvehengine[playerid]);
        //PlayerTextDrawHide(playerid, SPvehspeed[playerid]);
        PlayerTextDrawHide(playerid, DGHBEC[playerid]);
        for(new txd; txd < 3; txd++)
		{
			TextDrawHideForPlayer(playerid, DGhudveh[txd]);
		}

		if(pData[playerid][pTaxiDuty] == 1)
		{
			pData[playerid][pTaxiDuty] = 0;
			SetPlayerColor(playerid, COLOR_WHITE);
			Servers(playerid, "You are no longer on taxi duty!");
		}
		if(pData[playerid][pFare] == 1)
		{
			KillTimer(pData[playerid][pFareTimer]);
			Info(playerid, "Anda telah menonaktifkan taxi fare pada total: {00FF00}%s", FormatMoney(pData[playerid][pTotalFare]));
			pData[playerid][pFare] = 0;
			pData[playerid][pTotalFare] = 0;
		}

        HidePlayerProgressBar(playerid, pData[playerid][fuelbar]);
        HidePlayerProgressBar(playerid, pData[playerid][damagebar]);

        HidePlayerProgressBar(playerid, pData[playerid][spfuelbar]);
        HidePlayerProgressBar(playerid, pData[playerid][spdamagebar]);
	}
	/*mt speedo
	if(newstate != PLAYER_STATE_DRIVER)
	{
		DestroyPlayerObject(playerid,PlayerSpeedObject[playerid]);
		DestroyPlayerObject(playerid,PlayerSpeedObject2[playerid]);
	}*/
	else if(newstate == PLAYER_STATE_DRIVER)
    {
		foreach(new pv : PVehicles)
		{
			if(vehicleid == pvData[pv][cVeh])
			{
				if(IsABike(vehicleid) || GetVehicleModel(vehicleid) == 424)
				{
					if(pvData[pv][cLocked] == 1)
					{
						RemovePlayerFromVehicle(playerid);
						//new Float:slx, Float:sly, Float:slz;
						//GetPlayerPos(playerid, slx, sly, slz);
						//SetPlayerPos(playerid, slx, sly, slz);
						Error(playerid, "This bike is locked by owner.");
						return 1;
					}
				}
			}
		}
		if(newstate == PLAYER_STATE_DRIVER)
	    {
	        if(VehicleLastEnterTime[playerid] > gettime())
	        {
	            Warning[playerid]++;
	            if(Warning[playerid] >= 3)
	                AutoBan(playerid);
	        }
	        VehicleLastEnterTime[playerid] = gettime() + 2;
	    }
	    if(IsADmvVeh(vehicleid))
        {
            if(pData[playerid][pSekolahSim] == 0)
            {
                RemovePlayerFromVehicle(playerid);
                Error(playerid, "Anda Tidak Memulai {FFFF00}DMV {FFFFFF}Test");
			}
		}
		if(IsATrashVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_TRASH, DIALOG_STYLE_MSGBOX, "Side Job - Trashmaster", "Anda akan bekerja sebagai pengangkut sampah?", "Start Job", "Close");
		}
		if(IsAForVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_FORKLIFT, DIALOG_STYLE_MSGBOX, "Side Job - Forklift", "Anda akan bekerja sebagai pemuat barang dengan Forklift?", "Start Job", "Close");
		}
		if(IsASweeperVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_SWEEPER, DIALOG_STYLE_MSGBOX, "Side Job - Sweeper", "Anda akan bekerja sebagai pembersih jalan?", "Start Job", "Close");
		}
		if(IsAPizzaVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_PIZZA, DIALOG_STYLE_MSGBOX, "Side Job - Pizza", "Anda akan bekerja sebagai pengantar Pizza?", "Start Job", "Close");
		}
		if(IsABusVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_BUS, DIALOG_STYLE_LIST, "Side Job - Bus", "1.Route A\tLos Santos Bank\n2.Route B\tOcean Docks\n3.Route C\tEast Side\n", "Start Job", "Close");
		}
		if(!IsEngineVehicle(vehicleid))
        {
            SwitchVehicleEngine(vehicleid, true);
        }
		if(IsEngineVehicle(vehicleid) && pData[playerid][pDriveLic] <= 0)
        {
            Info(playerid, "Anda tidak memiliki {FFFF00}Driving Licenses{FFFFFF}, berhati-hatilah.");
        }
		if(pData[playerid][pHBEMode] == 1)
		{
			for(new txd; txd < 3; txd++)
			{
				TextDrawShowForPlayer(playerid, DGhudveh[txd]);
			}
            RefreshDGHbec(playerid);
			PlayerTextDrawShow(playerid, SPvehname[playerid]);
			PlayerTextDrawShow(playerid, SPvehengine[playerid]);
			//PlayerTextDrawShow(playerid, SPvehspeed[playerid]);
			ShowPlayerProgressBar(playerid, pData[playerid][spfuelbar]);
			ShowPlayerProgressBar(playerid, pData[playerid][spdamagebar]);
			/*mt speedo
			if(PlayerSpeed[playerid]==0) return 1;
			UpdateSpeedo(playerid);
			if(newstate == PLAYER_STATE_DRIVER)
			{
				PlayerSpeedObject[playerid] =CreatePlayerObject(playerid, 19327,0.0,0.0,-1000.0,0.0,0.0,0.0,100.0);
				SetPlayerObjectMaterial(playerid, PlayerSpeedObject[playerid], 0, 8487, "ballyswater", "waterclear256", 0x00000000);
				PlayerSpeedObject2[playerid] =CreatePlayerObject(playerid, 19327,0.0,0.0,-1000.0,0.0,0.0,180.0,100.0);
				SetPlayerObjectMaterial(playerid, PlayerSpeedObject2[playerid], 0, 8487, "ballyswater", "waterclear256", 0x00000000);
				new vehid = GetPlayerVehicleID(playerid);
				AttachSpeedBoard(playerid,vehid);
			}*/
		}
		else if(pData[playerid][pHBEMode] == 2)
		{
			RefreshHbec(playerid);
			for(new txd; txd < 6; txd++)
			{
				TextDrawShowForPlayer(playerid, HudVeh[txd]);
			}
			TextDrawShowForPlayer(playerid, VehBox);
			PlayerTextDrawShow(playerid, DPvehname[playerid]);
			PlayerTextDrawShow(playerid, DPvehengine[playerid]);
			PlayerTextDrawShow(playerid, DPvehspeed[playerid]);
			ShowPlayerProgressBar(playerid, pData[playerid][fuelbar]);
			ShowPlayerProgressBar(playerid, pData[playerid][damagebar]);
		}
		else
		{

		}
		new Float:health;
        GetVehicleHealth(GetPlayerVehicleID(playerid), health);
        VehicleHealthSecurityData[GetPlayerVehicleID(playerid)] = health;
        VehicleHealthSecurity[GetPlayerVehicleID(playerid)] = true;

		if(pData[playerid][playerSpectated] != 0)
  		{
			foreach(new ii : Player)
			{
    			if(pData[ii][pSpec] == playerid)
			    {
        			PlayerSpectateVehicle(ii, vehicleid);
				    Servers(ii, "%s(%i) is now driving a %s(%d).", pData[playerid][pName], playerid, GetVehicleModelName(GetVehicleModel(vehicleid)), vehicleid);
				}
			}
		}
		SetPVarInt(playerid, "LastVehicleID", vehicleid);
	}
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	switch(weaponid){ case 0..18, 39..54: return 1;} //invalid weapons
	if(1 <= weaponid <= 46 && pData[playerid][pGuns][g_aWeaponSlots[weaponid]] == weaponid)
	{
		pData[playerid][pAmmo][g_aWeaponSlots[weaponid]]--;
		if(pData[playerid][pGuns][g_aWeaponSlots[weaponid]] != 0 && !pData[playerid][pAmmo][g_aWeaponSlots[weaponid]])
		{
			pData[playerid][pGuns][g_aWeaponSlots[weaponid]] = 0;
		}
	}
	if(hittype == BULLET_HIT_TYPE_PLAYER && IsPlayerConnected(hitid) && !IsPlayerNPC(hitid))
    {
        new Float:Shot[3], Float:Hit[3];
        GetPlayerLastShotVectors(playerid, Shot[0], Shot[1], Shot[2], Hit[0], Hit[1], Hit[2]);

        new playersurf = GetPlayerSurfingVehicleID(playerid);
        new hitsurf = GetPlayerSurfingVehicleID(hitid);
        new Float:targetpackets = NetStats_PacketLossPercent(hitid);
        new Float:playerpackets = NetStats_PacketLossPercent(playerid);

        if(~(playersurf) && ~(hitsurf) && !IsPlayerInAnyVehicle(playerid) && !IsPlayerInAnyVehicle(hitid))
        {
            if(!IsPlayerAimingAtPlayer(playerid, hitid) && !IsPlayerInRangeOfPoint(hitid, 5.0, Hit[0], Hit[1], Hit[2]))
            {
                new String[10000], issuer[24];
                GetPlayerName(playerid, issuer, 24);
                AimbotWarnings[playerid] ++;

                format(String, sizeof(String), "{FFFFFF}Player %s warning of aimbot or lag [Target PL: %f | Shooter PL:%f]!", issuer, targetpackets, playerpackets);

                for(new p; p < MAX_PLAYERS;p++)
                    if(IsPlayerConnected(p) && IsPlayerAdmin(p))
                         SendClientMessage(p, -1, String);

                if(AimbotWarnings[playerid] > 10)
                {
                    if(targetpackets < 1.2 && playerpackets < 1.2) return Kick(playerid);
                    else
                    {
                        format(String, sizeof(String), "{FFFFFF}Player %s is probably using aimbot [Target PL: %f | Shooter PL:%f]!", issuer, targetpackets, playerpackets);
                        for(new p; p < MAX_PLAYERS;p++) if(IsPlayerConnected(p) && IsPlayerAdmin(p)) SendClientMessage(p, -1, String);
                    }
                }
                return 0;
            }
            else return 1;
        }
        else return 1;
    }
	return 1;
}

stock GivePlayerHealth(playerid,Float:Health)
{
	new Float:health; GetPlayerHealth(playerid,health);
	SetPlayerHealth(playerid,health+Health);
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	new
        Float: vehicleHealth,
        playerVehicleId = GetPlayerVehicleID(playerid);

    new Float:health = GetPlayerHealth(playerid, health);
    GetVehicleHealth(playerVehicleId, vehicleHealth);
    new panels, doors, lights, tires;
    GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
    UpdateVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
    // if(pData[playerid][pSeatBelt] == 0 || pData[playerid][pHelmetOn] == 0)
    // {
    // 	if(GetVehicleSpeed(vehicleid) <= 20)
    // 	{
    // 		GivePlayerHealth(playerid, -8);
    // 		return 1;
    // 	}
    // 	if(GetVehicleSpeed(vehicleid) <= 50)
    // 	{
    // 		GivePlayerHealth(playerid, -10);
    // 		return 1;
    // 	}
    // 	if(GetVehicleSpeed(vehicleid) <= 90)
    // 	{
    // 		GivePlayerHealth(playerid, -20);
    // 		return 1;
    // 	}
    // 	return 1;
    // }
    // if(pData[playerid][pSeatBelt] == 1 || pData[playerid][pHelmetOn] == 1)
    // {
    // 	if(GetVehicleSpeed(vehicleid) <= 20)
    // 	{
    // 		GivePlayerHealth(playerid, -1);
    // 		return 1;
    // 	}
    // 	if(GetVehicleSpeed(vehicleid) <= 50)
    // 	{
    // 		GivePlayerHealth(playerid, -3);
    // 		return 1;
    // 	}
    // 	if(GetVehicleSpeed(vehicleid) <= 100)
    // 	{
    // 		GivePlayerHealth(playerid, -8);
    // 		return 1;
    // 	}
    // }
    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{

	return 1;
}

public OnPlayerUpdate(playerid)
{
	//SAPD Tazer/Taser
	UpdateTazer(playerid);
	//Afk
	p_tick[playerid]++;
	//SAPD Road Spike
	CheckPlayerInSpike(playerid);
	return 1;
}

task VehicleUpdate[40000]()
{
	for (new i = 1; i != MAX_VEHICLES; i ++) if(IsEngineVehicle(i) && GetEngineStatus(i))
    {
        if(GetVehicleFuel(i) > 0)
        {
			new fuel = GetVehicleFuel(i);
            SetVehicleFuel(i, fuel - 15);

            if(GetVehicleFuel(i) >= 1 && GetVehicleFuel(i) <= 200)
            {
               Info(GetVehicleDriver(i), "This vehicle is low on fuel. You must visit a fuel station!");
            }
        }
        if(GetVehicleFuel(i) <= 0)
        {
            SetVehicleFuel(i, 0);
            SwitchVehicleEngine(i, false);
        }
    }
	foreach(new ii : PVehicles)
	{
		if(IsValidVehicle(pvData[ii][cVeh]))
		{
			if(pvData[ii][cPlateTime] != 0 && pvData[ii][cPlateTime] <= gettime())
			{
				format(pvData[ii][cPlate], 32, "NoHave");
				SetVehicleNumberPlate(pvData[ii][cVeh], pvData[ii][cPlate]);
				pvData[ii][cPlateTime] = 0;
			}
			if(pvData[ii][cRent] != 0 && pvData[ii][cRent] <= gettime())
			{
				pvData[ii][cRent] = 0;
				new query[128];
				mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[ii][cID]);
				mysql_tquery(g_SQL, query);
				if(IsValidVehicle(pvData[ii][cVeh])) DestroyVehicle(pvData[ii][cVeh]);
				Iter_SafeRemove(PVehicles, ii, ii);
			}
		}
		if(pvData[ii][cClaimTime] != 0 && pvData[ii][cClaimTime] <= gettime())
		{
			pvData[ii][cClaimTime] = 0;
		}
	}
}

public OnVehicleSpawn(vehicleid)
{
	//trasher
    LoadedTrash[vehicleid] = 0;
    //end

	foreach(new ii : PVehicles)
	{
		if(vehicleid == pvData[ii][cVeh] && pvData[ii][cRent] == 0)
		{
			/*if(pvData[ii][cClaim] != 0)
			{
				foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
				{
					Info(pid, "Anda masih memiliki claim kendaraan, silahkan ambil di city hall!");
				}
				if(IsValidVehicle(pvData[ii][cVeh]))
					DestroyVehicle(pvData[ii][cVeh]);
					
				return 1;
			}*/
			if(pvData[ii][cInsu] > 0)
    		{
				pvData[ii][cInsu]--;
				pvData[ii][cClaim] = 1;
				pvData[ii][cClaimTime] = gettime() + (1 * 86400);
				foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
        		{
            		Info(pid, "Kendaraan anda hancur dan anda masih memiliki {FFFF00}insuransi{FFFFFF}, silahkan ambil di kantor sags setelah 24 jam.");
				}
				if(IsValidVehicle(pvData[ii][cVeh]))
					DestroyVehicle(pvData[ii][cVeh]);
				
				pvData[ii][cVeh] = 0;
			}
			else
			{
				foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
        		{
					new query[128];
					mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[pid][cID]);
					mysql_tquery(g_SQL, query);
					if(IsValidVehicle(pvData[ii][cVeh]))
						DestroyVehicle(pvData[ii][cVeh]);
            		Info(pid, "Kendaraan anda hancur dan tidak memiliki {FFFF00}insuransi.");
					Iter_SafeRemove(PVehicles, ii, ii);
				}
			}
		}
	}
	return 1;
}

ptask PlayerVehicleUpdate[200](playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsValidVehicle(vehicleid))
	{
		if(!GetEngineStatus(vehicleid) && IsEngineVehicle(vehicleid))
		{
			SwitchVehicleEngine(vehicleid, false);
		}
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new Float:fHealth;
			GetVehicleHealth(vehicleid, fHealth);
			if(IsValidVehicle(vehicleid) && fHealth <= 350.0)
			{
				SetValidVehicleHealth(vehicleid, 300.0);
				SwitchVehicleEngine(vehicleid, false);
				GameTextForPlayer(playerid, "~r~Totalled!", 2500, 3);
			}
		}
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			if(pData[playerid][pHBEMode] == 1)
			{
			    new Float:fDamage, fFuel, color1, color2;
				new tstr[64];

				GetVehicleColor(vehicleid, color1, color2);

				GetVehicleHealth(vehicleid, fDamage);

				//fDamage = floatdiv(1000 - fDamage, 10) * 1.42999;

				if(fDamage <= 350.0) fDamage = 0.0;
				else if(fDamage > 1000.0) fDamage = 1000.0;

				fFuel = GetVehicleFuel(vehicleid);

				if(fFuel < 0) fFuel = 0;
				else if(fFuel > 1000) fFuel = 1000;

				if(!GetEngineStatus(vehicleid))
				{
					PlayerTextDrawSetString(playerid, SPvehengine[playerid], "~r~OFF");
				}
				else
				{
					PlayerTextDrawSetString(playerid, SPvehengine[playerid], "~g~ON");
				}

				SetPlayerProgressBarValue(playerid, pData[playerid][spfuelbar], fFuel);
				SetPlayerProgressBarValue(playerid, pData[playerid][spdamagebar], fDamage);

				format(tstr, sizeof(tstr), "%s", GetVehicleName(vehicleid));
				PlayerTextDrawSetString(playerid, SPvehname[playerid], tstr);

				//format(tstr, sizeof(tstr), "%.0f Mph", GetVehicleSpeed(vehicleid));
				//PlayerTextDrawSetString(playerid, SPvehspeed[playerid], tstr);
			}
			else if(pData[playerid][pHBEMode] == 2)
			{
				new Float:fDamage, fFuel, color1, color2;
				new tstr[64];

				GetVehicleColor(vehicleid, color1, color2);

				GetVehicleHealth(vehicleid, fDamage);

				//fDamage = floatdiv(1000 - fDamage, 10) * 1.42999;

				if(fDamage <= 350.0) fDamage = 0.0;
				else if(fDamage > 1000.0) fDamage = 1000.0;

				fFuel = GetVehicleFuel(vehicleid);

				if(fFuel < 0) fFuel = 0;
				else if(fFuel > 1000) fFuel = 1000;

				if(!GetEngineStatus(vehicleid))
				{
					PlayerTextDrawSetString(playerid, DPvehengine[playerid], "~r~OFF");
				}
				else
				{
					PlayerTextDrawSetString(playerid, DPvehengine[playerid], "~g~ON");
				}

				SetPlayerProgressBarValue(playerid, pData[playerid][fuelbar], fFuel);
				SetPlayerProgressBarValue(playerid, pData[playerid][damagebar], fDamage);

				format(tstr, sizeof(tstr), "%s", GetVehicleName(vehicleid));
				PlayerTextDrawSetString(playerid, DPvehname[playerid], tstr);

				format(tstr, sizeof(tstr), "%.0f Mph", GetVehicleSpeed(vehicleid));
				PlayerTextDrawSetString(playerid, DPvehspeed[playerid], tstr);
			}
			else
			{

			}
		}
	}
}

PlayerUpDateNeedBar(playerid)
{
	new str[10];

	format(str,sizeof(str),"%i", pData[playerid][pHunger]);
	PlayerTextDrawSetString(playerid, DigiHunger[playerid],str);str="";

	format(str,sizeof(str),"%i", pData[playerid][pEnergy]);
	PlayerTextDrawSetString(playerid, DigiEnergi[playerid],str);str="";

	format(str,sizeof(str),"%i", pData[playerid][pBladder]);
	PlayerTextDrawSetString(playerid, DigiBladdy[playerid],str);
	return true;
}

ptask PlayerUpdate[999](playerid)
{
	//Anti-Money Hack
	if(GetPlayerMoney(playerid) > pData[playerid][pMoney])
	{
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, pData[playerid][pMoney]);
		//SendAdminMessage(COLOR_RED, "Possible money hacks detected on %s(%i). Check on this player. "LG_E"($%d).", pData[playerid][pName], playerid, GetPlayerMoney(playerid) - pData[playerid][pMoney]);
	}
	// if(GetPlayerPing(playerid) > 800) // Ping Player
    // {
    //     FixedKick(playerid);
    // }
	//Anti Armour Hacks
	new Float:A;
	GetPlayerArmour(playerid, A);
	if(A > 98)
	{
		new fmt_msg[128];
		SetPlayerArmourEx(playerid, 0);
		SendClientMessageToAllEx(COLOR_BAN, "BotCmd: %s(%i) has been kicked by BOT.", pData[playerid][pName], playerid);
		format(fmt_msg, sizeof fmt_msg, "Reason: Armour Hacks");
        SendClientMessageToAll(COLOR_BAN, fmt_msg);
		FixedKick(playerid);
		//AutoBan(playerid);
	}
	//Weapon AC
	if(pData[playerid][pSpawned] == 1)
    {
        if(GetPlayerWeapon(playerid) != pData[playerid][pWeapon])
        {
            pData[playerid][pWeapon] = GetPlayerWeapon(playerid);

            if(pData[playerid][pWeapon] >= 1 && pData[playerid][pWeapon] <= 45 && pData[playerid][pWeapon] != 42 && pData[playerid][pWeapon] != 2 && pData[playerid][pGuns][g_aWeaponSlots[pData[playerid][pWeapon]]] != GetPlayerWeapon(playerid))
            {
                SendAdminWarn(COLOR_YELLOW, "%s (%d) has possibly used weapon hacks (%s), Please to check /spec this player first!", pData[playerid][pName], playerid, ReturnWeaponName(pData[playerid][pWeapon]));
                SetWeapons(playerid); //Reload old weapons
                //AutoBan(playerid);
            }
        }
    }
	//Weapon Atth
	if(NetStats_GetConnectedTime(playerid) - WeaponTick[playerid] >= 250)
	{
		static weaponid, ammo, objectslot, count, index;

		for (new i = 2; i <= 7; i++) //Loop only through the slots that may contain the wearable weapons
		{
			GetPlayerWeaponData(playerid, i, weaponid, ammo);
			index = weaponid - 22;

			if (weaponid && ammo && !WeaponSettings[playerid][index][Hidden] && IsWeaponWearable(weaponid) && EditingWeapon[playerid] != weaponid)
			{
				objectslot = GetWeaponObjectSlot(weaponid);

				if (GetPlayerWeapon(playerid) != weaponid)
					SetPlayerAttachedObject(playerid, objectslot, GetWeaponModel(weaponid), WeaponSettings[playerid][index][Bone], WeaponSettings[playerid][index][Position][0], WeaponSettings[playerid][index][Position][1], WeaponSettings[playerid][index][Position][2], WeaponSettings[playerid][index][Position][3], WeaponSettings[playerid][index][Position][4], WeaponSettings[playerid][index][Position][5], 1.0, 1.0, 1.0);

				else if (IsPlayerAttachedObjectSlotUsed(playerid, objectslot)) RemovePlayerAttachedObject(playerid, objectslot);
			}
		}
		for (new i = 4; i <= 8; i++) if (IsPlayerAttachedObjectSlotUsed(playerid, i))
		{
			count = 0;

			for (new j = 22; j <= 38; j++) if (PlayerHasWeapon(playerid, j) && GetWeaponObjectSlot(j) == i)
				count++;

			if(!count) RemovePlayerAttachedObject(playerid, i);
		}
		WeaponTick[playerid] = NetStats_GetConnectedTime(playerid);
	}
	if(pData[playerid][pJail] <= 0)
	{
		if(pData[playerid][pHunger] > 100)
		{
			pData[playerid][pHunger] = 100;
		}
		if(pData[playerid][pHunger] < 0)
		{
			pData[playerid][pHunger] = 0;
		}
		if(pData[playerid][pEnergy] > 100)
		{
			pData[playerid][pEnergy] = 100;
		}
		if(pData[playerid][pEnergy] < 0)
		{
			pData[playerid][pEnergy] = 0;
		}
		if(pData[playerid][pBladder] > 100)
		{
			pData[playerid][pBladder] = 100;
		}
		if(pData[playerid][pBladder] < 0)
		{
			pData[playerid][pBladder] = 0;
		}
		/*if(pData[playerid][pHealth] > 100)
		{
			SetPlayerHealthEx(playerid, 100);
		}*/
	}
	if(pData[playerid][pHBEMode] == 2 && pData[playerid][IsLoggedIn] == true)
	{
		SetPlayerProgressBarValue(playerid, pData[playerid][hungrybar], pData[playerid][pHunger]);
		SetPlayerProgressBarColour(playerid, pData[playerid][hungrybar], ConvertHBEColor(pData[playerid][pHunger]));
		SetPlayerProgressBarValue(playerid, pData[playerid][energybar], pData[playerid][pEnergy]);
		SetPlayerProgressBarColour(playerid, pData[playerid][energybar], ConvertHBEColor(pData[playerid][pEnergy]));
		SetPlayerProgressBarValue(playerid, pData[playerid][bladdybar], pData[playerid][pBladder]);
		SetPlayerProgressBarColour(playerid, pData[playerid][bladdybar], ConvertHBEColor(pData[playerid][pBladder]));
		new strings[64], tstr[64];
		format(strings, sizeof(strings), "%s", pData[playerid][pName]);
		PlayerTextDrawSetString(playerid, DPname[playerid], strings);
		PlayerTextDrawShow(playerid, DPname[playerid]);
		format(tstr, sizeof(tstr), "Gold: %d", pData[playerid][pGold]);
		PlayerTextDrawSetString(playerid, DPcoin[playerid], tstr);
		PlayerTextDrawShow(playerid, DPcoin[playerid]);
		PlayerTextDrawSetString(playerid, DPmoney[playerid], FormatMoney(GetPlayerMoney(playerid)));
  		PlayerTextDrawShow(playerid, DPmoney[playerid]);
	}
	if(pData[playerid][pTDMode] == 1 && pData[playerid][IsLoggedIn] == true)
	{
		RefreshDigiHealt(playerid);
	}
	else if(pData[playerid][pTDMode] == 2 && pData[playerid][IsLoggedIn] == true)
	{
		SetPlayerProgressBarValue(playerid, pData[playerid][BarHp], pData[playerid][pHealth]);
		SetPlayerProgressBarValue(playerid, pData[playerid][BarArmour], pData[playerid][pArmour]);
	}
	if(pData[playerid][pHospital] == 1)
    {
		if(pData[playerid][pInjured] == 1)
		{
			SetPlayerPosition(playerid, -2028.32, -92.87, 1067.43, 275.78, 1);

			SetPlayerInterior(playerid, 1);
			SetPlayerVirtualWorld(playerid, playerid + 100);

			SetPlayerCameraPos(playerid, -2024.67, -93.13, 1066.78);
			SetPlayerCameraLookAt(playerid, -2028.32, -92.87, 1067.43);
			ResetPlayerWeaponsEx(playerid);
			TogglePlayerControllable(playerid, 0);
			pData[playerid][pInjured] = 0;
		}
		pData[playerid][pHospitalTime]++;
		new mstr[64];
		format(mstr, sizeof(mstr), "~n~~n~~n~~w~Recovering... %d", 15 - pData[playerid][pHospitalTime]);
		InfoTD_MSG(playerid, 1000, mstr);

		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
        if(pData[playerid][pHospitalTime] >= 15)
        {
            pData[playerid][pHospitalTime] = 0;
            pData[playerid][pHospital] = 0;
			pData[playerid][pHunger] = 50;
			pData[playerid][pEnergy] = 50;
			pData[playerid][pBladder] = 50;
			SetPlayerHealthEx(playerid, 50);
			pData[playerid][pSick] = 0;
			GivePlayerMoneyEx(playerid, -20000);
			SetPlayerHealthEx(playerid, 50);

            for (new i; i < 20; i++)
            {
                SendClientMessage(playerid, -1, "");
            }

			SendClientMessage(playerid, COLOR_GREY, "--------------------------------------------------------------------------------------------------------");
            SendClientMessage(playerid, COLOR_WHITE, "Kamu telah keluar dari rumah sakit, kamu membayar {00FF00}$200.00 {FFFFFF}kerumah sakit.");
            SendClientMessage(playerid, COLOR_GREY, "--------------------------------------------------------------------------------------------------------");

			SetPlayerPosition(playerid, 1182.8778, -1324.2023, 13.5784, 269.8747);

            TogglePlayerControllable(playerid, 1);
            SetCameraBehindPlayer(playerid);

            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerInterior(playerid, 0);
			ClearAnimations(playerid);
			pData[playerid][pSpawned] = 1;
			SetPVarInt(playerid, "GiveUptime", -1);
		}
    }
	if(pData[playerid][pInjured] == 1 && pData[playerid][pHospital] != 1)
    {
		new mstr[64];
        format(mstr, sizeof(mstr), "/death for spawn to hospital");
		InfoTD_MSG(playerid, 1000, mstr);

		if(GetPVarInt(playerid, "GiveUptime") == -1)
		{
			SetPVarInt(playerid, "GiveUptime", gettime());
		}

		if(GetPVarInt(playerid,"GiveUptime"))
        {
            if((gettime()-GetPVarInt(playerid, "GiveUptime")) > 100)
            {
                Info(playerid, "Now you can spawn, type '/death' for spawn to hospital.");
                SetPVarInt(playerid, "GiveUptime", 0);
            }
        }

        ApplyAnimation(playerid, "CRACK", "null", 4.0, 0, 0, 0, 1, 0, 1);
        ApplyAnimation(playerid, "PED", "KO_skid_front", 4.0, 0, 0, 0, 1, 0, 1);
        SetPlayerHealthEx(playerid, 99999);
    }
	if(pData[playerid][pInjured] == 0 && pData[playerid][pGender] != 0) //Pengurangan Data
	{
		if(++ pData[playerid][pHungerTime] >= 150)
        {
            if(pData[playerid][pHunger] > 0)
            {
                pData[playerid][pHunger]--;
            }
            else if(pData[playerid][pHunger] <= 0)
            {
                //SetPlayerHealth(playerid, health - 10);
          		//SetPlayerDrunkLevel(playerid, 8000);
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pHungerTime] = 0;
        }
        if(++ pData[playerid][pEnergyTime] >= 120)
        {
            if(pData[playerid][pEnergy] > 0)
            {
                pData[playerid][pEnergy]--;
            }
            else if(pData[playerid][pEnergy] <= 0)
            {
                //SetPlayerHealth(playerid, health - 10);
          		//SetPlayerDrunkLevel(playerid, 8000);
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pEnergyTime] = 0;
        }
        if(++ pData[playerid][pBladderTime] >= 100)
        {
            if(pData[playerid][pBladder] > 0)
            {
                pData[playerid][pBladder]--;
            }
            else if(pData[playerid][pBladder] <= 0)
            {
                //SetPlayerHealth(playerid, health - 10);
          		//SetPlayerDrunkLevel(playerid, 8000);
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pBladderTime] = 0;
        }
		if(pData[playerid][pSick] == 1)
		{
			if(++ pData[playerid][pSickTime] >= 200)
			{
				if(pData[playerid][pSick] >= 1)
				{
					new Float:hp;
					GetPlayerHealth(playerid, hp);
					SetPlayerDrunkLevel(playerid, 8000);
					ApplyAnimation(playerid,"CRACK","crckdeth2",4.1,0,1,1,1,1,1);
					Info(playerid, "Sepertinya anda sakit, segeralah pergi ke dokter.");
					SetPlayerHealth(playerid, hp - 3);
					pData[playerid][pSickTime] = 0;
				}
			}
		}
	}

	//Jail Player
	if(pData[playerid][pJail] > 0)
	{
		if(pData[playerid][pJailTime] > 0)
		{
			pData[playerid][pJailTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "~b~~h~You will be unjail in ~w~%d ~b~~h~seconds.", pData[playerid][pJailTime]);
			InfoTD_MSG(playerid, 1000, mstr);
		}
		else
		{
			pData[playerid][pJail] = 0;
			pData[playerid][pJailTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1482.0356,-1724.5726,13.5469,750, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E" %s(%d) have been un-jailed by the server. (times up)", pData[playerid][pName], playerid);
		}
	}
	//Arreset Player
	if(pData[playerid][pArrest] > 0)
	{
		if(pData[playerid][pArrestTime] > 0)
		{
			pData[playerid][pArrestTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "~b~~h~You will be released in ~w~%d ~b~~h~seconds.", pData[playerid][pArrestTime]);
			InfoTD_MSG(playerid, 1000, mstr);
		}
		else
		{
			pData[playerid][pArrest] = 0;
			pData[playerid][pArrestTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1526.69, -1678.05, 5.89, 267.76, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			Info(playerid, "You have been auto release. (times up)");
		}
	}
	PlayerUpDateNeedBar(playerid);
}

CMD:pos(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
		if(pData[playerid][pHelper] == 0)
			return PermissionError(playerid);

	new Float: x, Float: y, Float: z, interior, virtual_world;

	if(sscanf(params, "P<,>fff", x, y, z))
		return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /pos [x y z]");

	sscanf(params, "P<,>{fff}dd", interior, virtual_world);

	SetPlayerPosition(playerid, x, y, z, interior, virtual_world);
	return 1;
}

//trasher
public FillTrash(id)
{
	TrashData[id][TrashLevel]++;
	if(TrashData[id][TrashType] == TYPE_BIN && TrashData[id][TrashLevel] > 1) TrashData[id][TrashLevel] = 1;

	if(TrashData[id][TrashType] == TYPE_DUMPSTER) {
		if(TrashData[id][TrashLevel] == 1) TrashData[id][TrashTimer] = SetTimerEx("FillTrash", REFILL_TIME * 1000, false, "i", id);
		if(TrashData[id][TrashLevel] >= 2)
		{
			TrashData[id][TrashLevel] = 2;
			KillTimer(TrashData[id][TrashTimer]);
			TrashData[id][TrashTimer] = -1;
		}

		Streamer_SetIntData(STREAMER_TYPE_3D_TEXT_LABEL, TrashData[id][TrashLabel], E_STREAMER_COLOR, (TrashData[id][TrashLevel] == 1) ? 0xF39C12FF : 0x2ECC71FF);
		return 1;
	}

	Streamer_SetIntData(STREAMER_TYPE_3D_TEXT_LABEL, TrashData[id][TrashLabel], E_STREAMER_COLOR, 0x2ECC71FF);
	return 1;
}
CMD:pickup(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid)) return Error(playerid, "You can't do at this moment.");
	new vehicleid = GetPVarInt(playerid, "LastVehicleID");
	if(GetVehicleModel(vehicleid) != 408) return Error(playerid, "Your last vehicle has to be a Trashmaster.");
    if(HasTrash[playerid]) return Error(playerid, "You're already carrying a trash bag.");
	new id = Trash_Closest(playerid);
	if(id == -1) return Error(playerid, "You're not near any trash.");
	if(TrashData[id][TrashLevel] < 1) return Error(playerid, "There's nothing here.");
    new Float: x, Float: y, Float: z;
    GetVehicleBoot(vehicleid, x, y, z);
    if(GetPlayerDistanceFromPoint(playerid, x, y, z) >= 30.0) return Error(playerid, "You're not near your Trashmaster.");
	TrashData[id][TrashLevel]--;
	KillTimer(TrashData[id][TrashTimer]);
    TrashData[id][TrashTimer] = SetTimerEx("FillTrash", REFILL_TIME * 1000, false, "i", id);
	TrashCP[playerid] = CreateDynamicCP(x, y, z, 3.0, .playerid = playerid);
	HasTrash[playerid] = true;
	ApplyAnimation(playerid, "CARRY", "liftup105", 4.1, 0, 0, 0, 0, 0);
	SetPlayerAttachedObject(playerid, ATTACHMENT_INDEX, 1264, 6, 0.222, 0.024, 0.128, 1.90, -90.0, 0.0, 0.5,0.5, 0.5);

	Streamer_SetIntData(STREAMER_TYPE_3D_TEXT_LABEL, TrashData[id][TrashLabel], E_STREAMER_COLOR, (TrashData[id][TrashLevel] == 0) ? 0xE74C3CFF : 0xF39C12FF);
	SendClientMessage(playerid, COLOR_JOB, "TRASHMASTER: {FFFFFF}You can press {FFFF00}N {FFFFFF}to remove the trash bag.");
	return 1;
}
CMD:trash(playerid, params[])
{
	new id = Trash_Closest(playerid);
	if(id == -1) return Error(playerid, "You're not near any trash.");
	if(TrashData[id][TrashLevel] < 1) return Error(playerid, "There's nothing here.");
    if(pData[playerid][pTrash] < 0)
				return Error(playerid, "Kamu tidak mempunyai sampah di inventory mu!.");
	pData[playerid][pTrash] -= 1;
	GivePlayerMoneyEx(playerid, 50);
	Servers(playerid, "Kamu Telah membuang sampah ke tempatnya dan mendapatkan uang {00FF00}$0.50!");
	return 1;
}
CMD:getmeat(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid)) return Error(playerid, "You can't do at this moment.");

    if(GetMeatBag[playerid]) return Error(playerid, "You're already put a meat bag.");

	StoremeatCP[playerid] = CreateDynamicCP(942.3542, 2117.8999, 1011.0303, 3.0, .playerid = playerid);
	GetMeatBag[playerid] = true;
	ApplyAnimation(playerid, "CARRY", "liftup105", 4.1, 0, 0, 0, 0, 0);
	SetPlayerAttachedObject(playerid, ATTACHMENT_INDEX, 2805, 6, 0.222, 0.024, 0.128, 1.90, -90.0, 0.0, 0.5,0.5, 0.5);
	Meat--;
	Server_Save();
	return 1;
}
CMD:cu(playerid, params[])
{
    //for(new idx = 0; idx < MAX_TELEPON; idx ++)
	{
	    if(IsPlayerInRangeOfPoint(playerid,5.0,1773.6583, -1015.3002, 23.9609) || IsPlayerInRangeOfPoint(playerid,5.0,1254.7303, -2059.5728, 59.5827))
		{
		    GivePlayerMoneyEx(playerid, -5);
			new ph;

			if(sscanf(params, "d", ph))
			{
				Usage(playerid, "/cu [phone number] 933 - Taxi Call | 911 - SAPD Crime Call | 922 - SAMD Medic Call");
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

				new Float:x, Float:y, Float:z;
				GetPlayerPos(playerid, x, y, z);
				Info(playerid, "Warning: This number for emergency crime only! please wait for SAPD respon!");
				SendFactionMessage(1, COLOR_BLUE, "[EMERGENCY CALL] "WHITE_E"%s calling the emergency crime! Ph: ["GREEN_E"Telp Umum"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));

				pData[playerid][pCallTime] = gettime() + 60;
			}
			if(ph == 922)
			{
				if(pData[playerid][pCallTime] >= gettime())
					return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());

				new Float:x, Float:y, Float:z;
				GetPlayerPos(playerid, x, y, z);
				Info(playerid, "Warning: This number for emergency medical only! please wait for SAMD respon!");
				SendFactionMessage(3, COLOR_PINK2, "[EMERGENCY CALL] "WHITE_E"%s calling the emergency medical! Ph: ["GREEN_E"Telp Umum"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));

				pData[playerid][pCallTime] = gettime() + 60;
			}
			if(ph == 933)
			{
				if(pData[playerid][pCallTime] >= gettime())
					return Error(playerid, "You must wait %d seconds before sending another call.", pData[playerid][pCallTime] - gettime());

				new Float:x, Float:y, Float:z;
				GetPlayerPos(playerid, x, y, z);
				Info(playerid, "Your calling has sent to the taxi driver. please wait for respon!");
				pData[playerid][pCallTime] = gettime() + 60;
				foreach(new tx : Player)
				{
					if(pData[tx][pJob] == 1 || pData[tx][pJob2] == 1)
					{
						SendClientMessageEx(tx, COLOR_YELLOW, "[TAXI CALL] "WHITE_E"%s calling the taxi for order! Ph: ["GREEN_E"Telp Umum"WHITE_E"] | Location: %s", ReturnName(playerid), pData[playerid][pPhone], GetLocation(x, y, z));
					}
				}
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
		}
	}

	return 1;
}

public OnVehicleSirenStateChange(playerid, vehicleid, newstate)
{
        if(newstate)
        {
            FlashTime[vehicleid] = SetTimerEx("OnLightFlash", flashtime, true, "d", vehicleid);
        }
        if(!newstate)
        {
        	new panels, doors, lights, tires;

			KillTimer(FlashTime[vehicleid]);

			GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
            UpdateVehicleDamageStatus(vehicleid, panels, doors, 0, tires);
        }
        return 1;
}

public DoGMX()
{
	SendRconCommand("gmx");
	return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	//butcher
    if(areaid == meatsp)
	{
	    if(!GetPVarInt(playerid,"OnWork"))
	    {
	    	ShowPlayerDialog(playerid,D_WORK,DIALOG_STYLE_MSGBOX,"Butcher Job","Do you want to start working on the Assembly line?","Yes","");
	    }
	    else ShowPlayerDialog(playerid,D_WORK,DIALOG_STYLE_MSGBOX,"Butcher Job","Do you want to finish working on the Assembly line?","Yes","");
	}
    foreach(new i : Player)
	{
	    if(GetPVarType(i, "BBArea"))
	    {
	        if(areaid == GetPVarInt(i, "BBArea"))
	        {
	            new station[256];
	            GetPVarString(i, "BBStation", station, sizeof(station));
	            if(!isnull(station))
				{
					PlayStream(playerid, station, GetPVarFloat(i, "BBX"), GetPVarFloat(i, "BBY"), GetPVarFloat(i, "BBZ"), 30.0, 1);
				 	Servers(playerid, "You Enter The Boombox Area");
	            }
				return 1;
	        }
	    }
	}
	for(new i; i < sizeof(pTollArea); i++)
	{
		if(areaid == pTollArea[i] && IsPlayerInAnyVehicle(playerid))
		{
			GameTextForPlayer(playerid, "~w~Pay Toll Area~n~~w~ Type ~r~'/paytoll' ~w~Or Press~r~ H", 1000, 3);
		}
	}
	return 1;
}

forward OnSecondTimer();
public OnSecondTimer()
{
	new minute;
	gettime(_, minute);

	foreach(new playerid : Player)
	{
		CallLocalFunction("OnPlayerTimer", "i", playerid);
	}
}

forward OnPlayerTimer(playerid);
public OnPlayerTimer(playerid)
{
	if(pData[playerid][IsLoggedIn] == true)
	{	
		if(pData[playerid][pJob] == 8 || pData[playerid][pJob2] == 8)
		{
			if(packet == 1)
			{
				pData[playerid][pSmugglerTimer]++;

				if(pData[playerid][pSmugglerTimer] == 25)
					SendClientMessage(playerid, COLOR_LOGS, "JOB: {FFFFFF}Smuggling job is currently active!, use "YELLOW_E"'/findpacket'"WHITE_E" to trace the package"),
					pData[playerid][pSmugglerTimer] = 0;
			}
		}
		if(pData[playerid][pJob] == 8 || pData[playerid][pJob2] == 8)
		{
			if(packet == 2)
			{
				pData[playerid][pSmugglerTimer]++;

				if(pData[playerid][pSmugglerTimer] == 25)
					SendClientMessage(playerid, COLOR_LOGS, "JOB: {FFFFFF}Smuggling job is currently active!, use "YELLOW_E"'/findpacket'"WHITE_E" to trace the package"),
					pData[playerid][pSmugglerTimer] = 0;
			}
		}
	}
    return 1;
}

forward OnMinuteTimer();
public OnMinuteTimer()
{
	new hour, minute, second;
	gettime(hour, minute, second);

//	UpdateBet();

	switch(minute)
	{
		case 0:
		{
			if(hour == 0 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 2;
		        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
			
			if(hour == 1 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		    
		    if(hour == 2 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		    
		    if(hour == 7 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 2;
		        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		    
		    if(hour == 8 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		    
		    if(hour == 10 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }

            if(hour == 11 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 2;
		        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		    
		    if(hour == 13 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 2;
		        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		    
		    if(hour == 15 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 2;
		        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		    
		    if(hour == 17 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		    
		    if(hour == 20 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		}
	 	case 30:
		{
		    if(hour == 4 && taked == 0)
		    {
				DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		}
		case 20:
		{
		    if(hour == 12 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 2;
		        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		}
		case 22:
		{
      		if(hour == 21 && taked == 0)
		    {
		        DestroyDynamicObject(objectpacket);
		        packet = 1;
		        objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		        taked = 0;
		    }
		}
		case 40:
		{
		    if(hour == 4)
		    {
		        new msg[500];
		        format(msg, sizeof(msg), "**BOT Pengingat Sholat\nAssalamualaikum Semuanya Warga BremX Share GM\nBagi Yang Ber Agama Islam Jangan Lupa Sholat Subuh Yaa!\nSekarang Sudah Jam %d:%02d WIB\n@everyone**", hour, minute);
	    		DCC_SendChannelMessage(g_Discord_Information, msg);
		    }
		}
		case 9:
		{
		    if(hour == 12)
		    {
		        new msg[500];
		        format(msg, sizeof(msg), "**BOT Pengingat Sholat\nAssalamualaikum Semuanya Warga BremX Share GM\nBagi Yang Ber Agama Islam Jangan Lupa Sholat Dzuhur Yaa!\nSekarang Sudah Jam %d:%02d WIB\n@everyone**", hour, minute);
	    		DCC_SendChannelMessage(g_Discord_Information, msg);
		    }
		}
		case 25:
		{
		    if(hour == 15)
		    {
		        new msg[500];
		        format(msg, sizeof(msg), "**BOT Pengingat Sholat\nAssalamualaikum Semuanya Warga BremX Share GM\nBagi Yang Ber Agama Islam Jangan Lupa Sholat Ashar Yaa!\nSekarang Sudah Jam %d:%02d WIB\n@everyone**", hour, minute);
	    		DCC_SendChannelMessage(g_Discord_Information, msg);
		    }
		    else if(hour == 19)
		    {
		        new msg[500];
		        format(msg, sizeof(msg), "**BOT Pengingat Sholat\nAssalamualaikum Semuanya Warga BremX Share GM\nBagi Yang Ber Agama Islam Jangan Lupa Sholat Isya Yaa!\nSekarang Sudah Jam %d:%02d WIB\n@everyone**", hour, minute);
	    		DCC_SendChannelMessage(g_Discord_Information, msg);
		    }
		}
		case 15:
		{
		    if(hour == 18)
		    {
		        new msg[500];
		        format(msg, sizeof(msg), "**BOT Pengingat Sholat\nAssalamualaikum Semuanya Warga BremX Share GM\nBagi Yang Ber Agama Islam Jangan Lupa Sholat Maghrib Yaa!\nSekarang Sudah Jam %d:%02d WIB\n@everyone**", hour, minute);
	    		DCC_SendChannelMessage(g_Discord_Information, msg);
		    }
		}
	}

	SetWorldTime(WorldTime);
	OnPlayersWorldTimeInit(hour, minute);

	return 1;
}

forward OnPlayersWorldTimeInit(hour, minute);
public OnPlayersWorldTimeInit(hour, minute)
{
	foreach(new playerid : Player)
	{
		SetPlayerTime(playerid, hour, minute);
	}
}

forward Packet(packetid);
public Packet(packetid)
{
	switch(packetid)
	{
		case 1:
		{
		    DestroyDynamicObject(objectpacket);
		    packet = 1;
		    objectpacket = CreateDynamicObject(11745, -1304.212036, 2525.925537, 87.532722-1, 0.0, 0.0, 0.0, 0);
		    taked = 0;
		}
		case 2:
		{
		    DestroyDynamicObject(objectpacket);
	        packet = 2;
	        objectpacket = CreateDynamicObject(11745, -127.492500, 2258.050048, 28.337009-1, 0.0, 0.0, 0.0, 0);
	        taked = 0;
		}
	}
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
    foreach(new i : Player)
	{
	    if(GetPVarType(i, "BBArea"))
	    {
	        if(areaid == GetPVarInt(i, "BBArea"))
	        {
	            StopStream(playerid);
	            Servers(playerid, "You Has Been Leave Boombox Area");
				return 1;
	        }
	    }
	}
	return 1;
}

forward splits(const strsrc[], strdest[][], delimiter);
public splits(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
		if(strsrc[i]==delimiter || i==strlen(strsrc)){
			len = strmid(strdest[aNum], strsrc, li, i, 128);
			strdest[aNum][len] = 0;
			li = i+1;
			aNum++;
		}
		i++;
	}
	return 1;
}

CMD:setskill(playerid, params[])
{
	new choice[128], String[50], giveplayerid, amount;
	if(sscanf(params, "s[128]dd", choice, giveplayerid, amount))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "USE: /setskill [trucker, mechanic, smuggler] [playerid] [amount]");
		return 1;
	}
	if(strcmp(choice, "mechanic", true) == 0)
	{
		pData[giveplayerid][pMechSkill] = amount;
		format(String, sizeof(String), "SKILLINFO: You've set %s mechanic Skill to Level %d", pData[giveplayerid][pName], amount);

		SendClientMessage(playerid, COLOR_WHITE, String);
	}
	else if(strcmp(choice, "trucker", true) == 0)
	{
		pData[giveplayerid][pTruckSkill] = amount;
		format(String, sizeof(String), "SKILLINFO: You've set %s trucker Skill to Level %d", pData[giveplayerid][pName], amount);

		SendClientMessage(playerid, COLOR_WHITE, String);
	}
	else if(strcmp(choice, "smuggler", true) == 0)
	{
		pData[giveplayerid][pSmuggSkill] = amount;
		format(String, sizeof(String), "SKILLINFO: You've set %s smuggler Skill to Level %d", pData[giveplayerid][pName], amount);

		SendClientMessage(playerid, COLOR_WHITE, String);
	}
	return 1;
}
ptask AfkCheck[1000](playerid)  {
	new str[300];
    if(p_tick[playerid] > 0) {
        p_tick[playerid] = 0, p_afktime[playerid] = 0;
        return 1;
    }
    if(p_tick[playerid] == 0) {
        p_afktime[playerid]++;
    }
    /*if(p_afktime[playerid] > 0) {
        format(str, sizeof str,"[ATIP] %d Second(s)",p_afktime[playerid]);
        SetPlayerChatBubble(playerid, str, COLOR_YELLOW, 10.0, 1000);
    }*/
    new afk_minutes = ConvertUnixTime(p_afktime[playerid], CONVERT_TIME_TO_MINUTES);
	new afk_seconds = ConvertUnixTime(p_afktime[playerid]);

	if(afk_minutes > 0)
	{
		format(str, sizeof str, "[ATIP] %d:%02d Minute(s).", afk_minutes, afk_seconds);
	}
	else format(str, sizeof str, "[ATIP] %d Seconds(s).", afk_seconds);
	SetPlayerChatBubble(playerid, str, COLOR_SYSTEM, 10.0, 1000);
    return 1;
}
stock ConvertUnixTime(unix_time, type = CONVERT_TIME_TO_SECONDS)
{
	switch(type)
	{
		case CONVERT_TIME_TO_SECONDS:
		{
			unix_time %= 60;
		}
		case CONVERT_TIME_TO_MINUTES:
		{
			unix_time = (unix_time / 60) % 60;
		}
		case CONVERT_TIME_TO_HOURS:
		{
			unix_time = (unix_time / 3600) % 24;
		}
		case CONVERT_TIME_TO_DAYS:
		{
			unix_time = (unix_time / 86400) % 30;
		}
		case CONVERT_TIME_TO_MONTHS:
		{
			unix_time = (unix_time / 2629743) % 12;
		}
		case CONVERT_TIME_TO_YEARS:
		{
			unix_time = (unix_time / 31556926) + 1970;
		}
		default:
			unix_time %= 60;
	}
	return unix_time;
}

