if !freeze
{
	grounded = scrCheckbelow();

	if !grounded
	{
		if canwalljump && vsp > 0 && action != "dive"
		{
			vsp = grav * 1.5;
		}
		else if action != "dive"
		{
			vsp += grav;
		}
	}
}