/// @description rope_create(x, y, dir, width, height, segments, mask, density, collision_group);
/// @param x
/// @param  y
/// @param  dir
/// @param  width
/// @param  height
/// @param  segments
/// @param  mask
/// @param  density
/// @param  collision_group

var LINEAR_DAMPING = 2; // 0.1
var ANGULAR_DAMPING = 2; // 0.1



var _x, _y, _dir, _segments, _mask, _density, _group, i, _dis, _w_half, _phy, _a_x, _a_y, inst1, inst2;

rp_index += 1;

_x = argument0;
_y = argument1;
_dir = argument2;
rp_width[rp_index] = argument3;
rp_height[rp_index] = argument4;
_segments = argument5;
_mask = argument6;
_density = argument7;
_group = argument8;
_x += lengthdir_x(rp_width[@ rp_index]/2, _dir);
_y += lengthdir_y(rp_width[@ rp_index]/2, _dir)
_w_half = other.rp_width[other.rp_index]/2;
rp_cuts[rp_index] = ds_list_create();
ds_list_add(rp_cuts[@ rp_index], 0, _segments);

for (i=0; i<_segments; i++) {
  _dis = rp_width[@ rp_index]*i;
  rp_segment[rp_index, i] = instance_create(_x+lengthdir_x(_dis, _dir), _y+lengthdir_y(_dis, _dir), o_rope_segment);
  with (rp_segment[@ rp_index, i]) {
    image_angle = _dir;
    mask_index = _mask;
    rp_number = i;
    rp_id = other.rp_index;
    _phy = physics_fixture_create();
    physics_fixture_set_density(_phy, _density);
    physics_fixture_set_box_shape(_phy, _w_half, other.rp_height[@ other.rp_index]/2);
    physics_fixture_set_restitution(_phy, 0.1);
    physics_fixture_set_collision_group(_phy, _group);
    physics_fixture_set_linear_damping(_phy, LINEAR_DAMPING);
    physics_fixture_set_angular_damping(_phy, ANGULAR_DAMPING);
    physics_fixture_set_friction(_phy, 0.2);
    physics_fixture_bind(_phy, id);
    physics_fixture_delete(_phy);
    if (i != 0) {
      _a_x = x-lengthdir_x(_w_half, _dir);
      _a_y = y-lengthdir_y(_w_half, _dir);
      _inst1 = other.rp_segment[@ other.rp_index, i-1];
      _inst2 = other.rp_segment[@ other.rp_index, i];
      rp_joint[0] = physics_joint_revolute_create(_inst1, _inst2, _a_x, _a_y, 0, 0, 0, 0, 0, 0, 0);
      rp_joint[1] = physics_joint_distance_create(_inst1, _inst2, _inst1.x, _inst1.y, _inst2.x, _inst2.y, 0);
    }
  }
}

return(rp_index);
