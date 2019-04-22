// rope drawing

if (hidePlayer) exit;

if (!ropeSetup){
	rope_setup();
}
else {
	if !surface_exists(ropeSurface){
		ropeSurface = surface_create(surfaceWidth,surfaceHeight);	
	}
	surface_set_target(ropeSurface);
	draw_clear_alpha(c_black,0);
		rope_draw_ext(rope, tex, c_white, 1);	
	surface_reset_target();	
	
	shader_set(shd_outline);
		shader_set_uniform_f(SURFACEWIDTH,surfaceWidth);
		shader_set_uniform_f(SURFACEHEIGHT,surfaceHeight);
		shader_set_uniform_color(OUTLINECOLOUR,global.COLOUR1_BLACK,1.0);
		shader_set_uniform_f(STROKEWIDTH,1.0);
		draw_surface(ropeSurface,view_xview,view_yview);
	shader_reset();
}


// draw self
event_inherited();


//draw_text(x,y-50,global.currentlyTalking);
//draw_text(x,y-50,holding);

//draw_text(x,y-30,XSCALE);

// draw propeller
propellerSpriteIndex = (propellerSpriteIndex + image_speed) mod sprite_get_number(propellerSprite);
draw_sprite_ext(propellerSprite,propellerSpriteIndex,x,y,XSCALE,1,0,c_white,1);

// draw croc
draw_sprite_ext(sprite_index,image_index,x,y,XSCALE,1,0,c_white,1);

//draw_sprite_ext(sprite_index,image_index,x,y,1,1,facingDirection,c_white,0.5);
//draw_text(x,y-20,newAngle);
//draw_text(x,y-30,facingDirection);
//draw_text(x,y-40,y);



exit;
draw_text(x,y-120,state);
draw_text(x,y-50,vSpeed);
draw_text(x,y-70,hSpeed);
draw_text(x,y-90,newAngle);


draw_set_colour(c_lime);
draw_arrow(x,y,x + lengthdir_x(64,newAngle), y + lengthdir_y(64,newAngle), 10);


draw_set_colour(c_orange);
draw_arrow(x,y,x + lengthdir_x(64,facingDirection), y + lengthdir_y(64,facingDirection), 10);



//facingDirection



