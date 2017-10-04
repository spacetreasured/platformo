if canwalljump == 0
{
    if jumpbuffer > 0 //If you are allowed to jump by the jumpbuffer
    {
        if action != "jump" && action != "bounce" //If you haven't jumped yet (can't double jump)
        {
            vsp = oControl.jumpvar;
			if sprXscale > 0 //If you're facing right
			{
				sprXscale = 0.2;
				sprYscale = 1.8;
			}
			else //If you're facing left
			{
				sprXscale = -0.2;
				sprYscale = 1.8;
			}
            action = "jump"; //Then jump
        }
        else //If you have jumped already
        {
            if action != "bounce" //If you haven't bounced (can't dribble)
            {
                freeze = 6;
				charge = 6;
                flash = 5;
                vsp = oControl.divevar;
				hsp = 0;
                action = "dive"; //Then dive
                canparry = 0;
            }
        }
    }
    else //If you aren't allowed to jump by the jumpbuffer
    {
        if action != "jump" && action != "bounce" //If you aren't already jumping and you haven't bounced
        {
            freeze = 6;
			charge = 6;
            flash = 5;
            vsp = oControl.divevar;
			hsp = 0;
            action = "dive"; //Then dive
            canparry = 0;
        }
    }
}
else
{
    freeze = 2;
    vsp = oControl.jumpvar;
	if sprXscale > 0 //If you're facing right
	{
		sprXscale *= 0.5;
		sprYscale = 1.7;
	}
	else //If you're facing left
	{
		sprXscale *= -0.5;
		sprYscale = 1.7;
	}

    if (keyLeft)
    {
        hsp = 20;
        action = "walljump";
        image_index = 0;
    }
    else
    {           
        hsp = -20;
        action = "walljump";
        image_index = 0;
    }
}