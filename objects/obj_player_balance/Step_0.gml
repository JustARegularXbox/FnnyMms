y -= m_speed  * (delta_time / 100000) ;

if (m_start_timer == 1)
{
	m_allowed_time = room_speed * 3;
	m_start_timer = 0;
}

show_debug_message(m_allowed_time);

if (m_allowed_time > 0)
{
	m_allowed_time--;
}

if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D")))
{
	m_allowed_time = room_speed * 3;
}

if (m_allowed_time == 0)
{
	m_speed = 0;
	m_start_timer = 0;
}