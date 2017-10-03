if flash > 0
{
    coloroverlay = make_color_rgb(255,random_range(0,255),random_range(0,255));
}
else
{
    coloroverlay = c_white;
}

draw_sprite_ext(sprite_index,0,x,y,sprXscale,sprYscale,0,coloroverlay,1);