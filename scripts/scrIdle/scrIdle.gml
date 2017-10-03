if grounded
{    
    if hsp > 0
    {
        hsp -= 2;
    }
    
    if hsp < 0
    {
        hsp += 2;
    }
    
    if action != "bounce" && action != "dodge"
    {
        action = "idle";
    }
}
else
{
    if action != "jump" && action != "dive" && action != "bounce" && action != "parry" && action != "walljump"
    {
        action = "idle";
    }
}

canwalljump = 0;

walkbob = "down";
walktimer = 0;