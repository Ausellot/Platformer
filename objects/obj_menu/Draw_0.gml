

var i = 0;
repeat(buttons)
{
	draw_set_font(font_main);
	draw_set_halign(fa_center);
	draw_set_color(c_ltgray);
	
	if (menu_index == i) draw_set_color(c_red);
	
	draw_sprite(spr_start,0,x,y);
	draw_sprite(spr_quit,0,x,y);
	
	draw_text(menu_x, menu_y + button_h * i, button[i]);
	i++;
}