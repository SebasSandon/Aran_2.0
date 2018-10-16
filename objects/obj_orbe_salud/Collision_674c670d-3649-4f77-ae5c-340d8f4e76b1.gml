if not instance_exists(other) exit;
with(other){
	if hp < hp_max {
		hp += 5;
	}
}
instance_destroy();