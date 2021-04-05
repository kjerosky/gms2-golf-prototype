if (state == BallState.IDLE) {
	//TODO: This is just temporary to be able to see what direction we're facing.
	draw_set_color(c_red);
	var arrowPointX = x + lengthdir_x(20, direction);
	var arrowPointY = y + lengthdir_y(20, direction);
	draw_arrow(x, y, arrowPointX, arrowPointY, 4);
}

if (altitude > 0) {
	draw_sprite(sBallShadow, -1, x, y);
}

draw_set_color(c_white);
draw_sprite(sBall, -1, x, y - altitude);
