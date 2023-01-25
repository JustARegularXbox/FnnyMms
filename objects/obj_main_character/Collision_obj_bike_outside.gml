if (should_draw == 1)
{
	should_draw = 0;
	instance_create_layer(100, room_height - 100, "Text", obj_textbox_interaction);
}