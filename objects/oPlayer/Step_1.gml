if !freeze
{
	grounded = scrCheckbelow();

	if !grounded
	{
		if canwalljump && vsp > 0 && action != "dive"
		{
			vsp = grav * 1.5; //slows falling during wallgrab
			if keyLeft
			{
				sprXscale = 1;
			}
			else
			{
				sprXscale = -1;
			}
		}
		else if action != "dive"
		{
			vsp += grav;
		}
	}
}