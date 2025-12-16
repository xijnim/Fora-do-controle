image_alpha = lerp(image_alpha, 0, .2);
if image_alpha < .01 {
	instance_destroy();
}