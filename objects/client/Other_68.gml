/// @description Insert description here
// You can write your code in this editor

type_event = ds_map_find_value(async_load,"type")

switch(type_event)
{
	case network_type_data:
		buffer = ds_map_find_value(async_load,"buffer")
		buffer_seek(buffer,buffer_seek_start,0)
		var data = buffer_read(buffer, buffer_string);
		var all_data = json_parse(data)
		var player_info_list = all_data.players;
		var bullets = all_data.bullets;
		//show_debug_message(data);
		
		for(var i=0; i<array_length(players_in_client); i++)
		{
			array_delete(players_in_client, i,1);
		}
		for(var i=0; i<array_length(player_info_list); i++){
			var pd = player_info_list[i];
			var spawn_obj = noone;
			switch(pd.character){
				case "Ruffs":
					spawn_obj = Obj_Ruffs;
					break;
				case "Green":
					spawn_obj = Obj_Green;
					break;
				case "Turtle":
					spawn_obj = Obj_Turtle;
					break;
				default:
					spawn_obj = noone; //Obj_Ruffs;
			}
			player = instance_create_depth(pd.pos.x,pd.pos.y,depth, spawn_obj);
			player.player_id = pd.player_id;
			array_push(players_in_client, player);
			
			if(player.player_id==Client.player_id) {
				current_player = player;
			}
			
			if(player.x!=pd.pos.x or player.y!=pd.pos.y){
				player.image_angle = point_direction(player.x, player.y, pd.pos.x, pd.pos.y);
			}
			player.x=pd.pos.x;
			player.y=pd.pos.y;
			player.health = pd.health;
		}
		for(var i=0; i<array_length(bullets_in_client);i++){
			instance_destroy(bullets_in_client[i]);
		}
		for(var i=0; i<array_length(bullets); i++) {
			var b = bullets[i];
			var new_bullet = instance_create_depth(b.pos.x, b.pos.y, depth, obj_bullet);
			bullet.image_angle = point_direction(b.init_pos.x, b.init_pos.y, b.pos.x, b.pos.y);
			array_push(bullets_in_client, new_bullet);
		}
		
		var srv_cmds = all_data.srv_cmds;
		for(var i=0; i<array_length(srv_cmds); i++) {
			var srv_cmd = srv_cmds[i]
			if(srv_cmd.name == "died" and srv_cmd.player_id == Client.player_id)
			{
				show_message("You Died! º ^ º");
			}
		}
		break;
}

