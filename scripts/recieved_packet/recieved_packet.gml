// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function recieved_packet(_buffer){
	//buffer = argument0
	msgid = buffer_read(_buffer,buffer_u8)
	
	switch(msgid)
	{
		case network.move:
			var sock = buffer_read(_buffer,buffer_u8)
			var move_x = buffer_read(_buffer,buffer_u16)
			var move_y = buffer_read(_buffer,buffer_u16)
			
			var inst = ds_map_find_value(socket_to_instanceid,sock)
			
			inst.x = move_x
			inst.y = move_y
			
			break;
		case network.player_connect:
			
			var socket = buffer_read(_buffer,buffer_u8)
			var _x = buffer_read(_buffer,buffer_u16)
			var _y = buffer_read(_buffer,buffer_u16)
			
			var player = instance_create_depth(_x,_y,depth,Obj_player)
			ds_map_add(socket_to_instanceid,socket,player)
			player.socket = socket		
			break;
		case network.player_joined:
			var socket = buffer_read(_buffer,buffer_u8)
			var _x = buffer_read(_buffer,buffer_u16)
			var _y = buffer_read(_buffer,buffer_u16)
			
			var slave = instance_create_depth(_x,_y,depth,Obj_enemys)
			ds_map_add(socket_to_instanceid,socket,slave)
			slave.socket = socket		
			break
	}
}