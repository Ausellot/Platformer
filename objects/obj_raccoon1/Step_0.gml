if(place_meeting(x,y,obj_player)){
	if(keyboard_check_pressed(vk_space)){
		mydialogue = CreateDialogue();
		AddDialogue(mydialogue, "Hejka! I'm the Ferret Guide ");
		AddDialogue(mydialogue, "");
		AddDialogue(mydialogue, "");
		AddDialogue(mydialogue, "");
		PlayDialogue(mydialogue);
		}
}