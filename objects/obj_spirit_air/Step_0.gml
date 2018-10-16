switch(state){
	case "quieto":
		#region Estado quieto
		set_state_sprite(spr_spirit_air,0.2,0);
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
		set_state_sprite(spr_spirit_air,0.7,0);
		if not instance_exists(obj_aran) break;
		
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
		set_state_sprite(spr_spirit_air_attack,0.7,0);
		
		if animation_hit_frame(1){
			create_hitbox(x,y,self,spr_spirit_air_hit_attack,4,4,5,image_xscale);
		}
		if animation_end(){
			state = "perseguir";
		}
		
		#endregion
		break;
		
	case "retroceso":
		#region Estado retroceso
		knockback_state(spr_spirit_air_stunt,"perseguir");
		#endregion
		break;
	default:
		show_debug_message("Estado "+state+" no existe.");
		state = "quieto";
		break;
}