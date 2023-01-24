/// @desc

if(keyboard_check(vk_escape))
{
	if (text_box_visible == 0)
	{
		text_box_visible = 1;
	}

} 
	else (keyboard_check(vk_escape))
	{
		if (text_box_visible == 1)
		{
			text_box_visible = 0;
		}
	}

if (text_box_visible == 0)
{
	instance_create_layer(room_width/3 - sprite_width, room_height/3 - sprite_height, "Instances_1", obj_esc_text);
}
    