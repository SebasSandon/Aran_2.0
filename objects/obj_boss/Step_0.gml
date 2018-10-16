switch(state){
	case "quieto":
		#region Estado quieto
		set_state_sprite(spr_mago,0.2,0);
		if not instance_exists(obj_aran) break;
		
		var direction_facing = image_xscale;
		var distancia_a_aran = point_distance(x,y,obj_aran.x,obj_aran.y);
		if distancia_a_aran <= chase_range {
			state = "perseguir";
		}else{
			move_and_collide(0,0);
		}
		#endregion
		break;
	case "perseguir":
		#region Estado persecusion
		set_state_sprite(spr_mago,1,0);
		if not instance_exists(obj_aran) break;
		audio_pause_sound(a_island_aeria);
		audio_play_sound(a_music_boss,1,true);
		image_xscale = sign(obj_aran.x - x);
		if image_xscale == 0 {
			image_xscale = 1;
		}
		
		var direction_facing = image_xscale;
		var distancia_a_aran = point_distance(x,y,obj_aran.x,obj_aran.y);
		if distancia_a_aran <= attack_range {
			state = "atacar";
		}else{
			move_and_collide(direction_facing * chase_speed,0);
		}
		#endregion
		break;
	case "atacar":
		#region Estado ataque
		set_state_sprite(spr_mago_ataque_1,1.2,0);
		
		if animation_hit_frame(0){
			obj_boss.x += sign(obj_aran.x - obj_boss.x) * 50;
			create_hitbox(x,y,self,spr_mago_ataque_1,15,4,20,image_xscale);
		}
		if animation_end(){
			state = "perseguir";
		}
		
		#endregion
		break;
		
	case "especial":
		#region Estado especial
		set_state_sprite(spr_mago_ataque_2,1.2,0);
		
		if animation_hit_frame(0){
			instance_create_layer(x,y,"Instances",obj_poder_mago);
		}
		if animation_end(){
			y += 10;
			state = "perseguir";
		}
		
		#endregion
		break;
		
}