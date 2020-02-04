
menu_x = x;
menu_y = y;
button_h = 32; 

// buttons
button[0] = draw_sprite(spr_start,0,x,y);
button[1] = draw_sprite(spr_quit,0,x,y);

buttons = array_length_1d(button);

menu_index = 0;
last_selected = 0;