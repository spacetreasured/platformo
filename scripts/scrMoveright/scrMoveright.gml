if grounded
{ 
    if action != "bounce"
    {
        if action != "dodge"
        {
            hsp += 2;
        }
        action = "run";
    }
	
	if hsp < 0
	{
		walkbob = "up";
		walktimer = 0;
	}
	
	if abs(hsp) > 0
	{
		if walktimer < 5
		{
			walktimer += 1;
		}

		if walktimer == 5 
		{
			walktimer = 0;
			if walkbob == "down"
			{
				walkbob = "up";
			}
			else
			{
				walkbob = "down";
			}
		}

		if walkbob == "down"
		{
			sprYscale = 0.8;
			sprXscale = 1.2;
		
		}
		else
		{
			sprYscale = 1;
			sprXscale = 1;
		}
	}
}
else
{
    if action != "walljump" && action != "dive"
    {
        hsp += 2;
		if canwalljump == 0
		{
			sprXscale = 1;//sets direction in air
		}
    }
	
}