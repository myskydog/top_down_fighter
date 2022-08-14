/// @description Insert description here
// You can write your code in this editor

if(current_player!=noone){
	
	if(abs(mouse_y-current_player.y)>5 and abs(mouse_x-current_player.x)>5){
		var player_opr = {
			cmd: "move",
			player_id: Client.player_id,
			dir: arctan2(mouse_y-current_player.y, mouse_x-current_player.x)
		}
		send_player_data(player_opr);
	}
}