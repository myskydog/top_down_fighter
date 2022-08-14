player = find_player_by_id(players_in_client ,Client.player_id);

if(player==noone){
	return;
}
if(!first_shoot && ammo<max_ammo && get_timer()-last_reload_time>=reload_interval * 1000000){
	last_reload_time = get_timer();
	ammo++;
}


if(keyboard_check_pressed(vk_space) && ammo>0)
{
	if(first_shoot) {
		first_shoot = false;
		last_reload_time = get_timer();
	}
	var player_opr = {
		cmd: "shoot",
		player_id: Client.player_id,
		dir: arctan2(mouse_y-player.y, mouse_x-player.x)
		//point_direction(player.x,player.y,mouse_x,mouse_y)
	}
	send_player_data(player_opr);
	ammo-=1;
}