// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_player_data(player_opr){
	
	var data = json_stringify(player_opr);
	buffer_seek(Client.client_buffer, buffer_seek_start, 0);
	buffer_write(Client.client_buffer, buffer_string, data);
	network_send_packet(Client.client, Client.client_buffer, string_length(data));
	show_debug_message(data);
}