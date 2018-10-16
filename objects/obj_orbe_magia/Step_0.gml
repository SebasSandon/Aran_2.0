if not instance_exists(obj_aran) exit;
var dir = point_direction(x,y,obj_aran.x, obj_aran.y);
var acceleration = 0.25;
motion_add(dir,acceleration);