if !freeze
{
//CONTROLLER INPUTS
keyRight = gamepad_axis_value(0,gp_axislh) >= 0.5 or gamepad_button_check(0,gp_padr) or keyboard_check(vk_right);
keyLeft = gamepad_axis_value(0,gp_axislh) <= -0.5 or gamepad_button_check(0,gp_padl) or keyboard_check(vk_left);
keyDown = gamepad_axis_value(0,gp_axislv) >= 0.5 or gamepad_button_check(0,gp_padd);
keyJump = gamepad_button_check_pressed(0,gp_face1) or keyboard_check_pressed(vk_up);
keyJumpR = gamepad_button_check_released(0,gp_face1) or keyboard_check_released(vk_up);
keyDodge = gamepad_button_check_pressed(0,gp_face2) or keyboard_check_pressed(vk_down);
keyPickup = gamepad_button_check(0,gp_face3);

//RUN
if action != "dodge"//As long as you're not dodging - this makes it so dodging cancels all movement equations
{
    if (keyRight)
    {
		scrMoveright();
    }
    if (keyLeft)
    {
        scrMoveleft();
    }
    if (!keyRight && !keyLeft)
    {
        scrIdle();
    }
}

//LOCK SPEED
if hsp > oControl.speedvar && action != "dodge"
{
    hsp = oControl.speedvar;
}
if hsp < -(oControl.speedvar) && action != "dodge"
{
    hsp = -(oControl.speedvar);
}

//JUMP
if (keyJump)
{
    scrJump();
}

if(keyJumpR) //If you let go of the jump button, fall back down
{
    if action != "bounce"
    {
        if(vsp < 0)
        {
			vsp -= vsp * 0.5;
        }
    }
}

//STRETCH WHEN DIVING
if action == "dive" && !freeze
{
	sprXscale = 0.3;
    sprYscale += 0.5;
}

//SETTING BACK TO IDLE AFTER BOUNCE
if action == "bounce" && sprXscale == 1
{
	action = "idle";
}

//BUFFER FOR JUMPING OFF LEDGE
if !grounded && action != "jump" //If you're in the air and you are not jumping
{
    if jumpbuffer > 0
    {
        jumpbuffer -= 1;
    }
}
else //If you are on the ground or you are jumping
{
    jumpbuffer = 4; //This will set the amount of frames you have to execute a jump coming off a ledge
}

//WALLJUMP UNCOMMITMENT AND COUNTDOWN
if action == "walljump" //Starts a counter to exit walljump movement lock
{
    wjcounter -= 1;
}
if wjcounter <= 0
{
    action = "idle";
    wjcounter = 6;
}

if !place_meeting(x,y,oHardground)
{
    canwalljump = 0; //Resets this so you can't wall jump out of thin air
}

//SPRITE SCALING FOR JUMPING (SQUASH AND STRETCH)
if action != "dive"
{
    if sprYscale > 1
    {
        sprYscale -= 0.1;
    }
    if sprYscale < 1
    {
        sprYscale += 0.1;
    }

    if sprXscale > 1
    {
        sprXscale -= 0.1;
    }
    if sprXscale < 1
    {
        sprXscale += 0.1;
    }
}

//DODGE
if (keyDodge) && action != "dodge"
{
   scrDodge();
}

if action == "dodge"
{
    invincible = 1; //Makes you invincible when you're dodging
    if hsp > 0 //Slows you down if you're dodging
    {
        hsp -= 2;
    }
    if hsp < 0
    {
        hsp += 2;
    }
	if abs(hsp) > 5
	{
		instance_create_depth(random_range(x-45,x+45),y,choose(-2,2),fxDodgedust);
	}
}

if (grounded && hsp == 0) or (vsp != 0 && action != "dive") //Set you back to vulnerable/idle after dodging
{
    if pcounter <= 0
    {
        invincible = 0;
        if action != "bounce" && action != "jump" && action != "walljump"
        {
            action = "idle";
        }
    }
}

//PARRY COUNTDOWN && CANPARRY
if pcounter > 0
{
    pcounter -= 1;
}

if grounded
{
    canparry = 1;
}


//LEVEL WRAPPING
if x > 1460
{
    x = -20;
}
if x < -20
{
    x = 1460;
}

/*PLAYER COLLISION
if action == "dive"
{
    if place_meeting(x,y+(vsp * 0.5),oPlayer1) && y < objoyer1.y
    {
        if oPlayer1.invincible = 0
        {
            freeze = 7;
            scrbounce();
            with oPlayer1
            {
                freeze = 7;
                flash = 3;
                if freeze > 0
                {
                    die = 1;
                }
            }
        }
        else //If the target player is invincible AKA parrying in the air
        {
            if oPlayer1.grounded = 0
            {
                freeze = 5;
                with oPlayer1
                {
                    scrParry();
                }
            }
        }
    }
}*/

//DYING WHEN UNFROZEN
if die
{
    scrDie();
}

//DYING WHEN HITTING A HAZARDGROUND
if place_meeting(x,y,oHazardground)
{
    flash = 5;
    freeze = 7;
	if die != 1
	{
		sprXscale = 1;
		sprYscale = 1;
	}
    die = 1;
}
} //This is where being unfrozen ends - put any actions you can only do if you aren't frozen up there ^
else //If you ARE frozen
{
    freeze -= 1;
    if die = 1
    {
        sprXscale += 0.1; //stretches you out when you freeze and die
        sprYscale += 0.1;
    }
}

//FLASH COUNTER FOR WHEN YOU GET HIT
if flash > 0
{
    flash -= 1;
}

//CHARGE COUNTDOWN
if charge > 0
{
	charge -= 1;
	if action == "dive"
	{
		y -= 6;
	}
}