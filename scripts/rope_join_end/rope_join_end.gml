/// @description rope_join_end(id, inst);
/// @param id
/// @param  inst
function rope_join_end(argument0, argument1) {

	var _id, _inst, _l_x, _l_y;

	_id = argument0;
	_inst = argument1;
	_l_x = lengthdir_x(rp_width[@ _id]/2, rp_segment[@ _id, 0].image_angle);
	_l_y = lengthdir_y(rp_width[@ _id]/2, rp_segment[@ _id, 0].image_angle);

	with (rp_segment[@ _id, array_length_2d(rp_segment, _id)-1]) {
	  phy_position_x = _inst.phy_position_x-_l_x;
	  phy_position_y = _inst.phy_position_y-_l_y;
	  rp_joint[2] = physics_joint_revolute_create(_inst, id, _inst.phy_position_x, _inst.phy_position_y, 0, 0, 0, 0, 0, 0, 0);
	  rp_joint[3] = physics_joint_distance_create(_inst, id, _inst.phy_position_x, _inst.phy_position_y, id.phy_position_x, id.phy_position_y, 0);
	}



}
