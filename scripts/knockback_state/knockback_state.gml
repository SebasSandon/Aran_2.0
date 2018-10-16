///@arg knockback_sprite
///@arg next_state
var knockback_sprite = argument0;
var next_state = argument1;

set_state_sprite(knockback_sprite,0,0);
image_xscale = -sign(knockback_speed);
move_and_collide(knockback_speed,0);
knockback_speed = approach(knockback_speed,0 ,0.65);
if knockback_speed == 0{
	state = next_state;
}