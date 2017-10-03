//END GAME
if keyboard_check_pressed(ord("Q"))
{
    game_end();
}

//RESTART GAME
if keyboard_check_pressed(ord("R"))
{
    game_restart();
}

//PAUSE
if gamepad_button_check_pressed(0,gp_start)
{
    if pause == 0
    {
        pause = 1;
    }
    else
    {
        pause = 0;
    }
}

//RESET VIEW ANGLE
if !instance_exists(fxShake)
{
	if camera_get_view_angle(view_camera) > 0
	{
		camera_set_view_angle(view_camera[0],(camera_get_view_angle(view_camera)-0.25));
	}
	
	if camera_get_view_angle(view_camera) < 0
	{
		camera_set_view_angle(view_camera[0],(camera_get_view_angle(view_camera)+0.25));
	}
}