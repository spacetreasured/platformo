if !freeze
{
var h,v,colide,slow;
hcounter += hsp;
vcounter += vsp;
h = round(hcounter);
v = round(vcounter);
hcounter -= h;
vcounter -= v;
hcollide = false;
slope = false;
repeat (abs(h))
{
    if(place_meeting(x+sign(h),y,oHardground))
    {
        if (!place_meeting(x+sign(h), y-1, oHardground))
        {
            y -= 1;//running up a slope
            x += sign(h);
            slope = true;
        }
        else
        {
            hcollide = true;//hit a wall
            break;
        }
    }
    else
    {
        if(grounded)
        {
            if(!place_meeting(x+sign(h),y+1,oHardground) && place_meeting(x+sign(h),y+2,oHardground))
            {
                y += 1;
            }
        }
        x += sign(h);
    }
}

if (hcollide)
{
    event_perform(ev_other, ev_user0); //ev_user0 is for horizontal collision
}
else
{
    cantjump = 0;
}

vcollide = false;
repeat (abs(v))
{
    if (vsp <= 0)
    {
        if (place_meeting(x,y+sign(v),oHardground))
        {
            vcollide = true;
            break;
        }
        else
        {
            y+= sign(v);
        }
    }
    else if (scrCheckbelow())
    {
        vcollide = true;
		if action != "bounce"
		{
			sprYscale = 0.5;
			sprXscale = 1.5;
		}
        break;
    }
    else
    {
        y += sign(v);
    }
}

if (vcollide)
{
    event_perform(ev_other, ev_user1);//ev_user1 is for vertical collisions
}
}