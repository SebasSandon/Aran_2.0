
var hp_x = 8;
var hp_y = 8;
var hp_width = 198;
var hp_height = 6;

var mp_x = 8;
var mp_y = 18;
var mp_width = 198;
var mp_height = 6;

if instance_exists(obj_aran){
	draw_hp = lerp(draw_hp, obj_aran.hp, 0.2);
	draw_max_hp = obj_aran.hp_max;
	
	if obj_aran.mp >= 0 {
		draw_mp = lerp(draw_mp, obj_aran.mp, 0.2);
		draw_max_mp = obj_aran.mp_max;
	}
}else{
	draw_hp = lerp(draw_hp, 0 , 0.2);
	draw_mp = lerp(draw_mp, 0, 0.2);
}
var hp_percent = draw_hp / draw_max_hp;
var mp_percent = draw_mp / draw_max_mp;
draw_rectangle_color(hp_x,hp_y,hp_x + (hp_width * hp_percent), hp_y + hp_height,c_lime,c_lime,c_lime,c_lime,false);
draw_rectangle_color(hp_x,hp_y,hp_x + hp_width, hp_y + hp_height,c_dkgray,c_dkgray,c_dkgray,c_dkgray,true);

draw_rectangle_color(mp_x, mp_y,mp_x + (mp_width * mp_percent),mp_y + mp_height,c_blue,c_blue,c_blue,c_blue,false);
draw_rectangle_color(mp_x, mp_y,mp_x + mp_width,mp_y + mp_height,c_dkgray,c_dkgray,c_dkgray,c_dkgray,true);