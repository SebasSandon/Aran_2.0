if not instance_exists(other) exit;
var dir = point_direction(other.x, other.y,x,y);
var acceleration = 0.2;
motion_add(dir,acceleration);
var max_speed = 4;
if speed > max_speed {
	speed = max_speed;
}