/// zack bell stuff

if (instance_place(x,y, obj_parent_entity)) {
    with (instance_place(x,y,obj_parent_entity)){
       // check their hSpeed and move accordingly
        if (abs(hSpeed) <= 1 && (abs(vSpeed) <= 1)){
            // not moving so we won't move either
        } else if (abs(hSpeed) <= 1) {
            // if jumping or landing, colliding grass goes random directions
            
            var dir = 1;
            if (other.x < x) dir = -1;
            
            other.xskew = round(random_range(8,12)) * dir;
            
        }   
            
        else
            // if actually moving left or right, use direction for grass movement
            other.xskew = round(random_range(8,12)) * sign(hSpeed);
    
        if (abs(hSpeed) > 1 || abs(vSpeed) > 1)
            other.xset = other.xskew;    
            
    
    }
    
}