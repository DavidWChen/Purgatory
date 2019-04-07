/// @description Insert description here
// You can write your code in this editor
if distance_to_object(o_player) < 70
{
    npc_direction = point_direction(x,y,o_player.x,o_player.y )+ 180;
	x += lengthdir_x(spd+0.2, npc_direction);
	y += lengthdir_y(spd+0.2, npc_direction);

}
else
{
	mp_potential_step(o_player.x, o_player.y, spd, false)
}