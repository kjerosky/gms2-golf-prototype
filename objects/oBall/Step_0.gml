if (keyboard_check_pressed(ord("R"))) {
	x = xstart;
	y = ystart;
	direction = 0;
	altitude = 0;
	
	state = BallState.IDLE;
}

if (state == BallState.IDLE && keyboard_check_pressed(vk_space)) {
	state = BallState.IN_AIR;

	altitude = 0.1;
	altitudeSpeed = 2.5;
	altitudeGravity = 0.04;
	
	var groundSpeed = 2;
	xSpeed = lengthdir_x(groundSpeed, direction);
	ySpeed = lengthdir_y(groundSpeed, direction);
} else if (state == BallState.IN_AIR && abs(altitude) < 0.1 && abs(altitudeSpeed) < 0.1) {
	state = BallState.ROLLING;

	altitude = 0;
	altitudeSpeed = 0;
} else if (state == BallState.ROLLING && point_distance(0, 0, xSpeed, ySpeed) < 0.1) {
	state = BallState.IDLE;
	
	xSpeed = 0;
	ySpeed = 0;
}

switch (state) {
	case BallState.IDLE: {
		// do nothing
	} break;
	
	case BallState.IN_AIR: {
		var ballBounceDampeningFactor = 0.6;
	
		x += xSpeed;
		y += ySpeed;
		altitude = altitude + altitudeSpeed;
	
		if (altitude < 0) {
			altitude = abs(altitude);
			altitudeSpeed = abs(altitudeSpeed) * ballBounceDampeningFactor;
		}
	
		altitudeSpeed -= altitudeGravity;
	} break;
	
	case BallState.ROLLING: {
		x += xSpeed;
		y += ySpeed;
		
		var frictionAmount = 0.025;
		var frictionDirection = point_direction(0, 0, -xSpeed, -ySpeed);
		xSpeed += lengthdir_x(frictionAmount, frictionDirection);
		ySpeed += lengthdir_y(frictionAmount, frictionDirection);
	} break;
}
