if not instance_exists(other) exit;
with(other){
	if mp < mp_max {
		mp += 5;
	}
	if mp <= 0 {
		mp = 0;
	}
}
instance_destroy();