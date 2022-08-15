/// @description Insert description here
// You can write your code in this editor
ammo = 3
max_ammo = 3
reload_interval = 0.5 //time_span
first_shoot = true
client = network_create_socket(network_socket_ws)
var result = network_connect_raw(client,"127.0.0.1",8787)
if(result<0){
	show_message("Connect server failed. Quit...");
	game_end()
}
client_buffer = buffer_create(1024,buffer_fixed,1)

player_id = uuid()


//user login
var player_opr = {
	cmd:"login",
	character: "Turtle",
	player_id: player_id,
}

var data = json_stringify(player_opr);
buffer_seek(Client.client_buffer, buffer_seek_start, 0);
buffer_write(Client.client_buffer, buffer_string, data);
network_send_raw(client,client_buffer,string_length(data),network_send_text);
//network_send_packet(client,client_buffer,string_length(data));

// initialize data
players_in_client = [];
bullets_in_client = [];
//socket_to_instanceid = ds_map_create()
player_list = [];
current_player = noone;