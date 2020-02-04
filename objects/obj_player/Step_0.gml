if(disabled == false){
	hspd = (keyboard_check(vk_right) - keyboard_check(vk_left))*spd;
	vspd = (keyboard_check(vk_down) - keyboard_check(vk_up))*spd;

	if(hspd !=0 || vspd!= 0){
	dir = point_direction(0,0, hspd, vspd);
		switch(dir){
			case 0: sprite_index = spr_playerRight; break;
			case 90: sprite_index = spr_playerUp; break;
			case 180: sprite_index = spr_playerLeft; break;
			case 270: sprite_index = spr_playerDown; break;
		}
	}else{
		image_index = 0;
	}

	move_obj();

	state = move_state(hspd, vspd);
}