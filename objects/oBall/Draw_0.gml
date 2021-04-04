if (altitude > 0) {
	draw_sprite(sBallShadow, -1, x, y);
}

draw_sprite(sBall, -1, x, y - altitude);
