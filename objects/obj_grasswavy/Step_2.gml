/// apply skewed movement or wind

xskew = approach(xskew, xset, 0.5);

if (parent) {
    x = parent.x + dx;
    y = parent.y + dy;
}

xset += 0.5;
xset = min(xset, skewmax);

// should probably reset angle to 0 when delay gets reset...
angle += angleIncrement;

// this simulates wind, but it's too random...
delay -= 1;
if (delay <=0) {
    //skewmax = random_range(4,8);
    
    // sine wave movement back and forth, 4 to 8
    // angle += angleIncrement;
    skewmax = sin(angle) * angleMultiplier;
    
    
    //skewMax = 0; // was 4
    delay = 4;
}