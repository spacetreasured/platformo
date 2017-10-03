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
}
else
{
    if action != "walljump" && action != "dive"
    {
        hsp += 2;
    }
}

image_xscale = 1;