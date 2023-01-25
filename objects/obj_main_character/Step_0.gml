/// player movement

//keys
moveRight = keyboard_check(ord("D"));
moveLeft = keyboard_check(ord("A"));
moveDown = keyboard_check(ord("S"));
moveUp = keyboard_check(ord("W"));


//movement
vx = ((moveRight - moveLeft)*walkSpeed);
vy = ((moveDown - moveUp)*walkSpeed);


//idle
if (vx == 0 && vy==0) {
    //switch idle sprites
    switch dir {
    case 0: sprite_index = spr_main_char_idle_right; break;
    case 1: sprite_index = spr_main_char_idle_up; break;
    case 2: sprite_index = spr_main_char_idle_left; break;
    case 3: sprite_index = spr_main_character_boy_idle; break;
    }
}
//collision

if (place_meeting(x+vx, y, obj_wall))
{
	vx = 0;	
}
if (place_meeting(x, y+vy, obj_wall))
{
	vy = 0;	
}

//moving
if (vx!= 0 || vy!=0) {
    x += vx;
    y += vy;
}

if(keyboard_check_pressed(vk_escape))
{
	if (text_box_visible == 0)
	{
		text_box_visible = 1;
	} 
	else if (text_box_visible == 1)
	{
		text_box_visible = 0;
	}

} 

if (text_box_visible == 1)
{
	instance_create_layer(0, 0, "Instances", obj_exitGame);
	instance_create_layer(room_width/3 - sprite_width, room_height/3 - sprite_height, "Instances_1", obj_esc_text);
}
   
   
if (text_box_visible == 0)
{
	instance_destroy(obj_esc_text);
	instance_destroy(obj_exitGame);
}

//change of walking sprites
if (vx > 0) {
    sprite_index = spr_main_char_walking_right;
    dir = 0
}
if (vx < 0) {
    sprite_index = spr_main_char_walking_left;
    dir = 2;
}
if (vy < 0) {
    sprite_index = spr_main_char_walking_up;
    dir = 1 ;
}
if (vy > 0) {
    sprite_index = spr_main_character_boy_walking_down;
    dir = 3;
}


x += vx;
y += vy;
//move in only four directions

