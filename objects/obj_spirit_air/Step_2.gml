if hp <= 0 {
	instance_destroy();
	obj_aran.puntaje += 100;
	repeat(5){
		instance_create_layer(x+random_range(-2,2), y+random_range(-2,2),"Effects",obj_orbe_salud);
		instance_create_layer(x+random_range(-2,2), y+random_range(-2,2),"Effects",obj_orbe_magia);
	}
}