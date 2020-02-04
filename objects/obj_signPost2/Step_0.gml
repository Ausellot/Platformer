if(place_meeting(x,y,obj_player)){
	if(keyboard_check_pressed(vk_space)){
		mydialogue = CreateDialogue1();
		AddDialogue1(mydialogue, "Please take the cave to the left");

		PlayDialogue1(mydialogue);
		}
}