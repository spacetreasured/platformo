if grounded
{
    flash = 3;
    action = "dodge";
    if sprXscale > 0 //If you're facing right
    {
        hsp = 32;
		sprYscale = 0.3;
		sprXscale = 1.7;
    }
    else //If you're facing left
    {
        hsp = -32;
		sprYscale = 0.3;
		sprXscale = -1.7;
    }
}
else
{
    if action != "dive" && action != "bounce"
    {
        if canparry = 1
        {
            invincible = 1;
            flash = 3;
            action = "parry";
            pcounter = 10;
            vsp = oControl.jumpvar * 0.5;
			if sprXscale > 0
			{
				sprXscale = 0.3;
			}
			else
			{
				sprXscale = -0.3;
			}
            sprYscale = 1.7;
            canparry = 0;
        }
    }
}