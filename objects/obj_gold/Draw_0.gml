/// @description Insert description here
// You can write your code in this editor
//physics_world_draw_debug(phy_debug_render_shapes);
event_inherited();

draw_set_color(c_orange);
//physics_draw_debug();
draw_self();

draw_text(x,y-30,phy_active);
draw_text(x,y-50,phy_sleeping);