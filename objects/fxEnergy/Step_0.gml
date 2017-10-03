move_towards_point(oPlayer.x, oPlayer.y-45,sp)
sp *= 1.1;

if place_meeting(x,y,oPlayer)
{
	instance_destroy();
}