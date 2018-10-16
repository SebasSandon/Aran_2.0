var camera_id = view_camera[0];
var view_width = camera_get_view_width(camera_id);
var view_height = camera_get_view_height(camera_id);
display_set_gui_size(view_width, view_height);

if not instance_exists(obj_aran) exit;
draw_hp = obj_aran.hp;
draw_max_hp = obj_aran.hp_max;
draw_mp = obj_aran.mp;
draw_max_mp = obj_aran.mp_max;

audio_play_sound(a_island_aeria,1,true);