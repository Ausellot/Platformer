/// @description Insert description here
// You can write your code in this editor
value = ds_queue_dequeue(dialogue);

if(is_undefined(value)){
	instance_destroy();
}

current_message = value;