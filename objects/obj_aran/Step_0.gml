//Gravedad del juego
if (!place_meeting(x,y+1,obj_platform)){
	vspeed_ += gravity_;
	}else{
	saltos = saltos_max;
	if keyboard_check_pressed(vk_up) and (saltos > 0){
		saltos -= 1;
		vspeed_ = altura_salto_;
	}
}

if place_meeting(x,y+vspeed_,obj_platform){
	while !place_meeting(x,y+sign(vspeed_),obj_platform){
		y += sign(vspeed_);
	}
	vspeed_ = 0;
}
y += vspeed_;

if y >= 1000 {
	hp -= 1000;
	game_restart();
}

//Estados del personaje
switch (state){
	case "mover":
		#region Estado mover
		if input.right{
			move_and_collide(5,0);
			image_xscale = 1;
			sprite_index = Aran_movimiento_2_0;
			image_speed = 1.2;
		}

		if input.left{
			move_and_collide(-5,0);
			image_xscale = -1;
			sprite_index = Aran_movimiento_2_0;
			image_speed = 0.9;
		}
		
		if not input.right and not input.left{
			sprite_index = Aran_quieto;
			image_speed = 0.9;
		}else{
			if animation_hit_frame(1) and animation_hit_frame(5){
				audio_play_sound(a_caminata_rapida,2,false);
			}
		}
		
		if input.attack{
			state = "atacar";
		}
		
		if input.special{
			state = "especial";
		}
		#endregion
		break;
	case "atacar":
		#region Estado atacar
		set_state_sprite(Aran_ataque_normal,1.7,0);
		
		if animation_hit_frame(3){
			audio_play_sound(a_golpe_normal,3,false);
			create_hitbox(x,y,self,Ataque_normal_hit,7,4,25,image_xscale);
		}
		
		if animation_end(){
			state = "mover";
		}
		#endregion
		break;
	case "especial":
		#region Estado especial
		set_state_sprite(Aran_ataque_especial_2_0,0.9,0);
		
		if animation_hit_frame(1){
			mp -= 20;
			audio_play_sound(a_ataque_aqua,3,false);
			if mp > 0 {
				instance_create_layer(x,y,"Instances",obj_lanza_aqua);
			}
			
		}
		
		if animation_end(){
			state = "mover"; 
		}
		#endregion
		break;
	case "retroceso":
		#region Estado retroceso
		audio_play_sound(a_knockback,3,false);
		knockback_state(Aran_retroceso,"mover");
		#endregion
		break;
	
	default:
		show_debug_message("Estado "+state+" no existe.");
		state = "mover";
		break;
}

