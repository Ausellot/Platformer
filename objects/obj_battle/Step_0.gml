/// @description Insert description here
if(state == "INIT"){
	if(ds_exists(ds_messages,ds_type_list)){
	ds_list_destroy(ds_messages);	
	}
	monsterHP = 1;

	selected_option = 0; // shows the arrow hovering over the options
	playerTurn = true;

	ds_messages = ds_list_create();
	messageCounter = 0; // tracks the message
	showBattleText = false; // displays battle text or not
 
	messageTimer = 0;

	enemytimer = 0;
	battleOption = 0; // which option selected

	playerDead = false;
	battle = false;
	victory = false;
	victorySoundPlayed = false;

	battleSpawnTimer = 0;

	//screenshake
	shakeTimer = 0;
	
	state = "READY"
}

//next battle
if (!battle){
	battleSpawnTimer ++;	
	
	if(battleSpawnTimer >= timeTillBattleSpawns){
		battle = true;
	}
}

if(battle == true) && (state == "READY"){

#region SELECT OPTION

if (playerTurn) && (!showBattleText){

	if(!showItemOptions){
		if (keyboard_check_pressed(vk_down)){
			// if arrow not at the last option go down one
			if (selected_option+1) <= (array_length_1d(a_text) - 1){
				selected_option ++;
			}
			// go back to first option
			else{
				selected_option = 0;
			}
			// play sound
			audio_play_sound(snd_menu_switch, 1, false); 
		}

		// if arrow not at the last option go up one
		if (keyboard_check_pressed(vk_up)){
		if ((selected_option-1) >= 0){
			selected_option --;
		}
		// go to last option
		 else {
			selected_option = array_length_1d(a_text) - 1;
		}
		// play sound
			audio_play_sound(snd_menu_switch, 1, false); 
		}
		// if option pressed
		if (keyboard_check_pressed(vk_space)){
			messageCounter = 0;
			if (!ds_exists(ds_messages, ds_type_list)){
			ds_messages = ds_list_create();	
			}
			// Attack
			if (selected_option == 0){
				ds_messages[|0] = "Flute Bash";
				roll = choose("Hit!", "MISS!")
			
				if(roll = "MISS!"){
					ds_messages[|1] = "But it misses...";
				}else{
					dmg = irandom(1) + 1;
				
					monsterHP -= dmg;
				
					if(monsterHP <= 0){
						victory = true;
						ds_messages[|2] = "You have won!";
						xpGained = 2;
						goldGained = 2;
					
						ds_messages[|3] = "You have gained" + string(xpGained) + " xp!";
						ds_messages[|4] = "You have gained" + string(goldGained) + " gold!";
					}
				
					ds_messages[|1]	= "It hits for " + string(dmg) + " damage ~!";
				}
			
				battleOption = 0;
			}
			// Defend
			if (selected_option == 1){
				ds_messages[|0] = "Curled Up";
					battleOption = 1;
			}
			// Item
			if (selected_option == 2){
				ds_messages[|0] = "Eats Donut";
					battleOption = 2;
			}
			// Run
			if (selected_option == 3){
				ds_messages[|0] = "Curled Up";
					battleOption = 3;
			}
		
			if(selected_option !=2) && (selected_option !=3){
			showBattleText = true;
			}else{
				//	show item menu
				if(selected_option == 2){
					showItemOptions = true;
				}
			
			}
			audio_play_sound(snd_menu_switch, 1, false);
		}
	}else{
		// SHOWS ITEM MENU
		if(showItemOptions){
			
			if (keyboard_check_pressed(vk_down)){
		// if arrow not at the last option go down one
		if (item_option+1) <= (array_length_1d(a_item_text) - 1){
			item_option ++;
		}
		// go back to first option
		else{
			item_option = 0;
		}
		// play sound
		audio_play_sound(snd_menu_switch, 1, false); 
	}

		// if arrow not at the last option go up one
		if (keyboard_check_pressed(vk_up)){
		if ((item_option-1) >= 0){
			item_option --;
		}
		// go to last option
		 else {
			item_option = array_length_1d(a_item_text) - 1;
		}
		// play sound
			audio_play_sound(snd_menu_switch, 1, false); 
		}	
		// choose item
		if(keyboard_check_pressed(vk_space)){
				itemCost = ga_item[item_option, 3];
			
				if(playerIP >= itemCost){
					
					healNade = scr_healNade(item_option);
					
				//HEAL
				if(item_option == 0){
					ds_messages[|0] = "EATS DONUT" + a_item_text[item_option];
					ds_messages[|1] = " AND HEALS FOR " + string(healNade) + " HP!";
					if(playerHP + healNade) <= playerMAX_HP{
						playerHP += healNade;	
					}else{
						playerHP = playerMAX_HP;	
					}
				}
				//Cookie Grenade
				if(item_option == 1){
					ds_messages[|0]= "Used COOKIENADE " + a_item_text[item_option];
					ds_messages[|1]= " AND ENEMY TAKES " + string(-healNade) + " DMG!";
					
					monsterHP += healNade; 
					
					if(monsterHP <= 0){
						victory = true;
						ds_messages[|2] = "You have won!";
						xpGained = 2;
						goldGained = 2;
					
						ds_messages[|3] = "You have gained" + string(xpGained) + " xp!";
						ds_messages[|4] = "You have gained" + string(goldGained) + " gold!";
					}
				}
				
				playerIP -=	itemCost;
				
			}else{
				// NOT ENOUGH IP - loses turn
				ds_messages[|0] = "TRIES TO USE ITEM...";
				ds_messages[|1] = " NO ITEMS LEFT";
			}
			
			// Continues battle
			showBattleText = true;
			showItemOptions = false;
		}
		}
	}
	
}

#endregion

#region MESSAGES

// cycle messages
	if (showBattleText){
	messageTimer ++;
	
	// wait a few secs before accepting player input
	if (messageTimer >= timeBeforeButtonAccepted){
		if (keyboard_check_pressed(vk_space)){
			// go to next message
			if(messageCounter+1) <= (ds_list_size(ds_messages)-1){
				messageCounter ++;
			// otherwise enemy takes turn
			}else { 
			//messages all shown				
				if (playerDead) || (victory){
					battle = false;
					showBattleText = false;
					obj_player.disabled = false;
					state = "INIT";

			}else{	
				playerTurn = !playerTurn;			
				messageCounter = 0;
				
				if (ds_exists(ds_messages, ds_type_list)){
				ds_list_destroy(ds_messages);	
				}
			
				showBattleText = false;
				}
			}
			messageTimer = 0;
			
			// if an attack
			if (battleOption == 0){
				if(!playerTurn){
					if(messageCounter == 1) && (roll == "Hits"){
						playerHP -= dmg;
						screenShake = true;
					}
				}
			}
			
			// healing
			if(battleOption == 2) && (playerTurn) && (messageCounter == 1){
				if(playerHP + healNade) <= playerMAX_HP{
					playerHP += healNade;
				}else{
					playerHP = playerMAX_HP;	
				}
				
			}
			
			//playerdead
			if (playerHP <= 0) && (!playerDead){
				playerDead = true;
				ds_messages[|2] = "You are knocked out...";
			}
			// play sounds
			if (victory){
				if(messageCounter == 2) && (!victorySoundPlayed){
					audio_play_sound(snd_menu_switch, 1, false);
					victorySoundPlayed = true;
				}
				if(messageCounter == 3) || (messageCounter == 4){
					audio_play_sound(snd_menu_switch, 1, false);	
				}
			}
		}
	}
}
#endregion


#region SHAKE
if(screenShake == true){
	shakeTimer ++;
	
	shakeX = irandom_range(-maxShakeX, maxShakeX);
	shakeY = irandom_range(-maxShakeY, maxShakeY);
	
	if(shakeTimer >= timeTillShakeEnds){
		screenShake = false;
		shakeTimer = 0
		shakeX = 0;
		shakeY = 0;
	}
}
#endregion

#region ENEMY TURN

if (!playerTurn) && (!showBattleText){
	enemytimer ++;
	
	if (enemytimer >= timeTillEnemyAttacks){
		if(!ds_exists(ds_messages, ds_type_list)){
			ds_messages = ds_list_create();	
		}
		messageCounter = 0;
		showBattleText = true;
		enemytimer = 0;
		
		ds_messages[|0] = "Attacks ~!";
		battleOption = 0;

		roll = choose("Hits", "Misses");
			
		if(roll == "Hits"){
			dmg = irandom(1) + 1;
			ds_messages[|1] = "It hits for"	+ string(dmg) + " damage ~!";
				
		}else{
			ds_messages[|1] = "Attack misses!";
		}
	}
}

#endregion
}