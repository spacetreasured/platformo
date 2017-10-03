draw_text(200,200,"fps: " + string(fps_real));
draw_text(200,300,"instances: " + string(instance_count));
draw_text(50,50,"jumpvar: " + string(jumpvar));
draw_text(50,75,"divevar: " + string(divevar));
if instance_exists(oPlayer)
{
    draw_text(50,100,"action: " + oPlayer.action);
    draw_text(50,125,"jumpbuffer: " + string(oPlayer.jumpbuffer));
    draw_text(50,150,"invincible: " + string(oPlayer.invincible));
    draw_text(50,175,"hsp: " + string(oPlayer.hsp));
    draw_text(50,200,"vsp: " + string(oPlayer.vsp));
    draw_text(50,225,"walljump: " + string(oPlayer.canwalljump));
    draw_text(50,250,"wjcounter: " + string(oPlayer.wjcounter));
    draw_text(50,275,"pcounter: " + string(oPlayer.pcounter));
    draw_text(50,300,"charge: " + string(oPlayer.charge));
	draw_text(50,325,"walktimer: " + string(oPlayer.walktimer));
	draw_text(50,350,"walkbob: " + string(oPlayer.walkbob));
}