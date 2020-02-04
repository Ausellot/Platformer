/// @description Insert description here
if (battle == true){
	
	x1 = 0;
	y1 = 0;
	x2 = x1 + room_width;
	y2 = y1 + room_height;
	
	draw_set_color(c_black);
	draw_rectangle(x1, y1, x2, y2, false);
	
	optionX = 32;
	optionY = 16;
	draw_set_font(font_combat);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);

	font_size = font_get_size(font_combat);
	var BUFFER = 4;

	if(!showItemOptions){
		for (var i = 0; i < array_length_1d(a_text); i++) {
			text = a_text[i];
			if (selected_option == i){
				if(playerTurn) && (!showBattleText){
				draw_sprite(spr_arrow, 0, optionX - sprite_get_width(spr_arrow), optionY + ((font_size + BUFFER) * i));
				} 
			}
			draw_text(optionX + shakeX, optionY + ((font_size + BUFFER) *i) + shakeX, text);
		}
	}else{
		var itemX = optionX + 100;
		var itemY = optionY;
		
		for (var k = 0; k < array_length_1d(a_item_text); k++){
			text = a_item_text[k];
			if(item_option == k){
				draw_sprite(spr_arrow, 0, itemX - sprite_get_width(spr_arrow), itemY + ((font_size + BUFFER) * k));
			}
			draw_text(itemX, itemY + ((font_size + BUFFER) * k), text);	

		}
	}

	// Draw Messages
	guiX = surface_get_width(application_surface)/2;
	guiY = surface_get_height(application_surface);

	draw_sprite(spr_battleText, 0, guiX, guiY);

	if (showBattleText){
		textX = guiX - ((sprite_get_width(spr_battleText)/2) - BUFFER);
		textY = guiY - (sprite_get_height(spr_battleText) - BUFFER);
	
		sep = (font_size + BUFFER);
		w = sprite_get_width(spr_battleText) - (BUFFER * 6);
		
		var totalMessageSize = 0;
		
		for (var i = 0; i <= messageCounter; i++){
		draw_text_ext(textX + shakeX, textY + totalMessageSize + shakeY, ds_messages[|i], (font_size + BUFFER), w);
		totalMessageSize += string_height_ext(ds_messages[|i],sep, w);
		}

		maxMessageHeight = sprite_get_height(spr_battleText) - (BUFFER * 6);
		// make sure can fit message in textbox
		while (totalMessageSize > maxMessageHeight){
			totalMessageSize -= string_height_ext(ds_messages[|0],sep, w);
			ds_list_delete(ds_messages, 0);
			messageCounter --;
		}
	}

	// Draw Player HP
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_left);
	hpX = BUFFER;
	hpY = surface_get_height(application_surface) - BUFFER;

	draw_text(hpX + shakeX, hpY + shakeY, string(playerHP)+ " /" + string(playerMAX_HP));
	
	// Draw Enemy
	mX = surface_get_width(application_surface)/2;
	mY = surface_get_height(application_surface)/2;

	draw_sprite_ext(spr_bird, 0, mX, mY, 4, 4, 0, c_white, 1);

}
