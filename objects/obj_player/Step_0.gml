/// @description Insert description here
// You can write your code in this editor

move_x = (keyboard_check(vk_right) - keyboard_check(vk_left))*5
move_y = (keyboard_check(vk_down) - keyboard_check(vk_up))*5
if(keyboard_check(vk_space))
{
	var player_opr = {
		cmd: "shoot",
		player_id: Client.player_id,
		dir: point_direction(x,y,mouse_x,mouse_y)
	}
	send_player_data(player_opr);
}
//show_debug_message("move x="+string(move_x)+" y="+string(move_y))
if(move_x!=0 || move_y!=0){
	var player_opr = {
		cmd: "move",
		player_id: Client.player_id,
		x: x + move_x,
		y: y + move_y
	}
	send_player_data(player_opr);
}else{
	image_index = 6;
}
