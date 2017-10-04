if action == "dive"
{
	scrBounce();
}
else
{
    spr_yscale = 0.5;
	if sprXscale > 0
	{
		sprXscale = 1.5;
	}
	else
	{
		sprXscale = -1.5;
	}
    vsp = 0;
}