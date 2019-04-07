/// @description Insert description here
// You can write your code in this editor
//o_persistant.morality++;

if(o_persistant.morality >=15)
{
	instance_create_layer(x, y, "End", o_heaven);
	alarm[0]=room_speed*1.5;
	

}
else if(o_persistant.morality <=-15)
{
	instance_create_layer(x, y, "End", o_hell);
	alarm[0]=room_speed*1.5;
}
else
{
	room_restart();
}