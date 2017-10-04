if flash > 0
{
    coloroverlay = make_color_rgb(255,random_range(0,255),random_range(0,255));
}
else
{
    coloroverlay = c_white;
}

draw_sprite_ext(sprite_index,0,x,y,sprXscale,sprYscale,sprRotation,coloroverlay,1); //making x sprX and y sprY introduces some weirdness here