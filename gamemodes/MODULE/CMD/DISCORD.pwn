new DCC_Channel:g_Admin_Command;

function DJailPlayer(NameToJail[], jailTime, jailReason[])
{
	if(cache_num_rows() < 1)
	{
		DCC_SendChannelMessage(inchanel, "This Account Does Not Exist!");
	}
	else
	{
	    new RegID, JailMinutes = jailTime * 60;
		cache_get_value_index_int(0, 0, RegID);

		SendClientMessageToAllEx(COLOR_RED, "BotCmd: "WHITE_E"jail(offline) player %s selama %d menit.", NameToJail, jailTime);
		SendClientMessageToAllEx(COLOR_RED, "[Reason: "WHITE_E"%s]", jailReason);
		DCC_SendChannelMessage(inchanel, "Succesfull Jail This Player!");
		new query[512];
		mysql_format(g_SQL, query, sizeof(query), "UPDATE players SET jail=%d WHERE reg_id=%d", JailMinutes, RegID);
		mysql_tquery(g_SQL, query);
	}
	return 1;
}
function DcOnUnbanQueryData(BannedName[])
{
	if(cache_num_rows() > 0)
	{
		new banIP[16], query[128];
		cache_get_value_name(0, "ip", banIP);
		mysql_format(g_SQL, query, sizeof(query), "DELETE FROM banneds WHERE ip = '%s'", banIP);
		mysql_tquery(g_SQL, query);
	}
	else
	{
		DCC_SendChannelMessage(inchanel, "This Account Does Not found on ban list!");
	}
	return 1;
}
//Discord Command
DCMD:dcmd(user, channel, params[])
{
 	DCC_SendChannelMessage(channel, "Admin Cmd : !ojail , !unban");
}
DCMD:players(user, channel, params[])
{
 	new strl[124];
 	format(strl, sizeof(strl), "> **Fierro City Roleplay** - **%s** Player's In Game", number_format(Iter_Count(Player)));
 	
 	DCC_SendChannelMessage(channel,strl);
}

DCMD:rategay(user, channel, params[])
{
	new rate, strl[124];
	rate = random(100);
	format(strl, sizeof(strl), "```Your Gay Rate is %s```", number_format(rate));
 
 	DCC_SendChannelMessage(channel,strl);
}

DCMD:ojail(user, channel, params[])
{
 	new player[24], datez, tmp[50], PlayerName[MAX_PLAYER_NAME];
 	inchanel = channel;
 	if(sscanf(params, "s[24]ds[50]", player, datez, tmp))

    if(channel == g_Admin_Command)
	{
		foreach(new ii : Player)
		{
			GetPlayerName(ii, PlayerName, MAX_PLAYER_NAME);

		    if(strfind(PlayerName, player, true) != -1)
			{
				DCC_SendChannelMessage(channel, "This Player is Online!");
		  	}
		}
		new query[512];
		mysql_format(g_SQL, query, sizeof(query), "SELECT reg_id FROM players WHERE username='%e'", player);
		mysql_tquery(g_SQL, query, "DJailPlayer", "sis", player, datez, tmp);
	}
}
DCMD:unban(user, channel, params[])
{
	new tmp[24];
	if(sscanf(params, "s[24]", tmp))

	if(channel == g_Admin_Command)
	{
		new query[128];
		mysql_format(g_SQL, query, sizeof(query), "SELECT name,ip FROM banneds WHERE name = '%e'", tmp);
		mysql_tquery(g_SQL, query, "DcOnUnbanQueryData", "s", tmp);
	}

	return 1;
}
