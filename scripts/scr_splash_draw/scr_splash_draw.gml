///liquid_splash_draw(id)
/*
    ARGUMENTS
        id - real - id of liquid object the splash belongs to
*/
//actually draw the liquid
for (i = 0; i < argument0.splashdrops; i += 1)
{
    //only draw if above the liquid's surface
    if (argument0.splasharray[i, 1] < room_height) // room height temp
    {
        //set colour, alpha & blend mode
        gpu_set_blendmode(argument0.splashdropblend);
        draw_set_colour(argument0.splashdropcolour);
        draw_set_alpha(argument0.splashdropalpha);
            
        //draw the drop
        draw_circle(argument0.splasharray[i, 0], argument0.splasharray[i, 1], argument0.splasharray[i, 4], 0);
            
        //reset alpha & blend mode
        draw_set_alpha(1);
        gpu_set_blendmode(bm_normal);
    }
}