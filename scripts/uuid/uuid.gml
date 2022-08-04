// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function uuid(){
	var _config_data = os_get_info();
	var _uuid = md5_string_unicode(string(get_timer()*current_second*current_minute*current_hour*current_day*current_month)+_config_data[? "udid"]+string(_config_data[? "video_adapter_subsysid"]));
	ds_map_destroy(_config_data);

	return _uuid;
}