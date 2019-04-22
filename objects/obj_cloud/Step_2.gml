//var PARALLAX_VAR = 0.9;
//layer_x(MOUNTAINS, PARALLAX_VAR * view_xview);

movementX += movementSpeed;

x = floor(parallaxVar * (view_xview - movementX));



x = wrap(x,0 - sprite_width,room_width + sprite_width);


