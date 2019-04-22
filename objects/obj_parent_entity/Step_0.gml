/// @description  collision: call last after all other code

//event_inherited();


update_audio_component();


// checks horizontal collision left and right
//scr_entity_collision();

// for future checks, only react on the first frame of collision
eCollisionLastFrame = collidingEntity;

// now check for collisions with other entities
collidingEntity = instance_place(x,y,obj_parent_entity);
if collidingEntity {
    with collidingEntity {
        // take note of the entity's direction, then react to it
        other.collisionDirection = point_direction(other.x,other.y,x,y);
        
        //theirName = object_get_name(other.collidingEntity.object_index);
        // if we just collided with another entity this frame...
        //scr_armor_check(offenseLevel);
        //scr_armor_check(collidingOffense);
    }
}
else { 
    collidingEntity = -4;
    collidingOffense = -4;
    collisionDirection = -4;
    eCollisionLastFrame = -4;
}



