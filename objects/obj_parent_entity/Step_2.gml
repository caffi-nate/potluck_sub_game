// handle sub pixel movement

cx += hSpeed; // first take current speed
cy += vSpeed; 
var hSpeedNew = round(cx); // round vSpeed and hSpeed up or down
var vSpeedNew = round(cy); // so that we're only moving whole pixels each frame
cx -= hSpeedNew; // now subtract so that cx and cy only contain decimal numbers
cy -= vSpeedNew;



repeat(abs(hSpeedNew)){
	if (!x_collision()){
		x += sign(hSpeed);	
	}
	else {
		hSpeed = 0;
		break;
	}
}



// keep pushing up or down 1 pixel at a time until reaching vSpeed or a platform
repeat(abs(vSpeedNew)){
    if (!y_collision()){
        y += sign(vSpeed);    
    }
    else {
        vSpeed = 0; // test. usually 0, 0.1 for quicksand
        break;    
    }
}

/// procedural animation

xscale = approach(xscale, 1, 0.05);
yscale = approach(yscale, 1, 0.05);

