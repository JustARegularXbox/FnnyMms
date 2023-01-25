/// @description texbox appear when main character is next to npc 

if (place_meeting(x, y, obj_main_character)){
	instance_create_layer(x, y, "Instances", obj_text_box);
}


