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
		
		show_debug_message(data);
		
		for(var i=0; i<array_length(player_info_list); i++){
			var pd = player_info_list[i];
			
			var player = noone;
			
			if(pd.player_id!=Client.player_id){
				player = find_player_by_id(opponents_in_client ,pd.player_id);
				if(player==noone){ //create new opponent
					player = instance_create_depth(pd.pos.x,pd.pos.y,depth,Obj_enemys);
					player.player_id = pd.player_id;
					array_push(opponents_in_client, player);
				}
			}else{
				player = Obj_player;
			}
			
			player.x = pd.pos.x;
			player.y = pd.pos.y;
			
			
			//check wether generate bullet
			if(variable_struct_exists(pd, "bullet"))
			{
				with(instance_create_depth(pd.pos.x,pd.pos.y,depth,obj_bullet))
				{
					direction = pd.bullet.dir;
				}
			}
			
		}
		//delete the player who has left
		for(var i=0; i<array_length(opponents_in_client); i++)
		{
			var player_render = opponents_in_client[i];
			if(find_player_by_id(player_info_list, player_render.player_id)==noone)
			{
				array_delete(opponents_in_client, i,1);
			}
		}
		break;
}

