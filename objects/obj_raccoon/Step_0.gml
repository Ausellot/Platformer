/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x,y,obj_player)){
	if(keyboard_check_pressed(vk_space)){
		mydialogue = CreateDialogue();
		AddDialogue(mydialogue, "Hello stranger, what a lovely day to go hiking, yes?");
		AddDialogue(mydialogue, "Be careful, I heard that some debris has fallen on the path up ahead ");
		AddDialogue(mydialogue, "You might need to find a way around it");
		PlayDialogue(mydialogue);
		}
}