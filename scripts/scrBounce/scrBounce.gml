action = "bounce";
instance_create_depth(x,y,0,fxShake);
if freeze == 0
{
    freeze = 1;
}

flash = 5;

//vsp = oControl.jumpvar * 0.75; //makes it bounce
hsp = 0; //stops horizontal movement when you hit the ground

sprYscale = 0.2;
sprXscale = 1.8;
invincible = 0;