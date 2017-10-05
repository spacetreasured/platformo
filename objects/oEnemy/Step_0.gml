if place_meeting(x,y,oPlayer)
{
	if oPlayer.action == "jump"
	{
		snaptoplayer = 1;
	}
}

if snaptoplayer == 1
{
	y = oPlayer.y;
	if oPlayer.sprXscale > 0
	{
		x = oPlayer.x + 90;
	}
	else
	{
		x = oPlayer.x - 90;
	}
	
	if oPlayer.action == "dive" or oPlayer.action == "bounce"
	{
		sprite_index = sSquarecharge;
		sprXscale = oPlayer.sprXscale;
		sprYscale = oPlayer.sprYscale;
	}
}

if oPlayer.action == "idle"
{
	snaptoplayer = 0;
}