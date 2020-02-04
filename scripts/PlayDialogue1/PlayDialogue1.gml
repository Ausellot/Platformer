if(instance_exists(obj_dialogue_system1)){
	show_debug_message("You can't have more than one!");	
} else{

	with(instance_create_depth(0, 0, 0, obj_dialogue_system1)){
		dialogue = argument0;
		event_user(0);
	}
	
}
	