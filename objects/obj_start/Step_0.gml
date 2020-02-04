/// @description Insert description here
var range = 12;
var min_scale = 1;
var max_scale = 1.05;

var mouse_hover = distance_to_point(mouse_x, mouse_y) <= range;
var goal_scale = (min_scale * !mouse_hover) + (max_scale * mouse_hover);
var scale_spd = 0.1;

image_index = mouse_hover;
image_xscale = lerp(image_xscale, goal_scale, scale_spd);
image_yscale= lerp(image_yscale, goal_scale, scale_spd);