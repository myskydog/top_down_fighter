/// @description Insert description here
// You can write your code in this editor


for(var i=0; i<array_length(players_in_client); i++)
{
	var player_render = players_in_client[i];
	var cx = player_render.x;
	var cy = player_render.y;
	draw_healthbar(cx-20,cy-20,cx+20,cy-25, player_render.health, c_black, c_red,c_green, 0, true,true);
}