if (image_index == 7)
{
    image_speed = 0;
}
if (destroy_timer > 0)
{
	destroy_timer -= 1;
}
if (destroy_timer == 0)
{
	instance_destroy(obj_textbox_interaction)
}
show_debug_message(destroy_timer);