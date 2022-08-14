/// @description Insert description here
// You can write your code in this editor

type_event = ds_map_find_value(async_load,"type")

switch(type_event)
{
	case network_type_data:
		buffer = ds_map_find_value(async_load,"buffer")
		buffer_seek(buffer,buffer_seek_start,0)
		var data = buffer_read(buffer, buffer_string);
		var player_info_list = json_parse(data)
		
		//show_debug_message(data);
		
		for(var i=0; i<array_length(player_info_list); i++){
			var pd = player_info_list[i];
			var player = find_player_by_id(players_in_client ,pd.player_id);
			if(player==noone){ //create new opponent
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
				
				if(player.player_id==player_id) {
					current_player = player;
				}
			}
			player.x=pd.pos.x;
			player.y=pd.pos.y;
			
			if(variable_struct_exists(pd, "bullet"))
			{
				with(instance_create_depth(pd.pos.x,pd.pos.y,depth,obj_bullet))
				{
					direction = pd.bullet.dir;
					range = pd.bullet.range;
				}
			}
			
		}
		//delete the player who has left
		for(var i=0; i<array_length(players_in_client); i++)
		{
			var player_render = players_in_client[i];
			if(find_player_by_id(player_info_list, player_render.player_id)==noone)
			{
				array_delete(players_in_client, i,1);
			}
		}
		break;
}

