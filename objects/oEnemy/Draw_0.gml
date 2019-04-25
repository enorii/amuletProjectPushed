draw_self();

if (flash > 0){
	flash--;
	shader_set(ShWhite);
	draw_self();
	shader_reset();
}