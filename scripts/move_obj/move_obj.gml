

// hpush
if (place_meeting(x+hspd/2,y, obj_block)) {
	var block = instance_place(x+hspd/2, y, obj_block);
	with (block){
		move_state(obj_player.hspd/2, 0);
	}
	hspd /= 2; 
}

// vpush
if (place_meeting(x,y+vspd/2, obj_block)) {
	var block = instance_place(x, y+vspd/2, obj_block);
	with (block){
		move_state(0, obj_player.vspd/2);
	}
	vspd /= 2; 
}