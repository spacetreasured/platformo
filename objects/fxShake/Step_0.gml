amount = choose(2,-2);
camera_set_view_pos(view_camera[0],0,(0+amount));

if camera_get_view_angle(view_camera) > 1
{
	tilt = "left"
}

if camera_get_view_angle(view_camera) < -1
{
	tilt = "right"

}

if tilt == "left"
{
	camera_set_view_angle(view_camera[0],(camera_get_view_angle(view_camera)-0.5));
}
else
{
	camera_set_view_angle(view_camera[0],(camera_get_view_angle(view_camera)+0.5));	
}