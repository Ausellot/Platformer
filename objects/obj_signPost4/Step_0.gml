if(place_meeting(x,y,obj_player)){
	if(keyboard_check_pressed(vk_space)){
		mydialogue = CreateDialogue1();
		AddDialogue1(mydialogue, "The Master Drummer is up ahead!");

		PlayDialogue1(mydialogue);
		}
}