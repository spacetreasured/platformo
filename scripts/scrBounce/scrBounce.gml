action = "bounce";
instance_create_depth(x,y,0,fxShake);
if freeze == 0
{
    freeze = 15;
}

flash = 5;

//vsp = oControl.jumpvar * 0.35; //makes it bounce
hsp = 0; //stops horizontal movement when you hit the ground

if sprXscale > 0 //if you're facing right
{
	sprXscale = 1.7;
}
else
{
	sprXscale = -1.7;	
}
sprYscale = 0.3;

invincible = 0;