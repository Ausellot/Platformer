option = argument0;

minVal = ga_item[option, 1];
maxVal = ga_item[option, 2];

totalVal = irandom_range(minVal, maxVal);

return(totalVal);

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
					
						ds_messages[|3] = "You have gained nothing!";
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