// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_player_by_id(player_list, player_id){
	
	for(var i=0; i<array_length(player_list); i++){
		var p = player_list[i];
		show_debug_message(p.player_id);
		if(p.player_id==player_id)
			return p;
	}
	return noone;
}