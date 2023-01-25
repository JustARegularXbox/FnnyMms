if (y >= 851 + sprite_height/2)
{
	if (x <= (obj_highway_street.sprite_width / m_very_specific_ratio))
	{
		x = obj_highway_street.sprite_width / m_very_specific_ratio;
	}
}
if (y <= 320)
{
	y = 320;
}
if (x >= window_get_width() - (obj_highway_street.sprite_width / m_very_specific_ratio))
{
	x = window_get_width() - (obj_highway_street.sprite_width / m_very_specific_ratio);
}
if (y >= room_height - 32)
{
	y = room_height - 32;
}

//Add to image angle. If you are holding W then increase speed by amount of <thrust> and rotate direction of movement toward direction you are facing by amount of <turn_lag> or 
//the difference between current bike facing direction and current movement direction, whichever is smaller.
if (keyboard_check(ord("W")))
{
	//accelerate when holding "W"
     m_speed += m_thrust * (delta_time / 100000);
}
else if (keyboard_check(ord("S")) && m_speed > 0)
{
	// allow breaking by pressing "S"
	m_speed -= 10 * m_decel * (delta_time / 100000);
}
else if (m_speed > 0)
{
	// ^^ don't allow spd to be less than 0
	m_speed -= 5 * m_decel  * (delta_time / 100000);
}
if (m_speed > 0)
{
	//Force the bike to only steer when speed is greater than 0
	// Value of _Direction will be either -1, 0, or 1.
	m_rotate = keyboard_check(ord("A")) - keyboard_check(ord("D"));
	// Lerp between current rotation value and direction by 1% (increase to make acceleration / deceleration faster).
	m_rotation = lerp(m_rotation, m_rotate, 1.5);
	image_angle += 10 * m_rotation  * (delta_time / 100000);
	var ang_dif = angle_difference(image_angle, direction);
	direction += min(abs(ang_dif), m_turn_lag) * sign(ang_dif) * 0.5;
}
//don't allow spd to be greater than max_spd
if (m_speed > m_max_spd) 
{
	m_speed = m_max_spd;
}

vx = lengthdir_x(m_speed,direction);
vy = lengthdir_y(m_speed,direction);

//move the x/y to the desired resulting x/y
x = x + vx;
y = y + vy;