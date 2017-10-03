alarm[0]=10;

if instance_exists(oPlayer)
{
	if oPlayer.x > room_width * 0.5
	{
		tilt = "left";
	}
	else
	{
		tilt = "right";
	}
}