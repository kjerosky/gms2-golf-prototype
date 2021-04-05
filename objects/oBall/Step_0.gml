//TODO: Remove this temporary reset button when done testing!
if (keyboard_check_pressed(ord("R"))) {
	state = BallState.IDLE;

	x = xstart;
	y = ystart;
	altitude = 0;	

	verticalSpeed = 0;
	xGroundSpeed = 0;
	yGroundSpeed = 0;
}



var swingButtonWasPressed = keyboard_check_pressed(vk_space);
var ballStoppedBouncing = abs(altitude) < 0.1 && abs(verticalSpeed) < 0.1;
var ballStoppedRolling = point_distance(0, 0, xGroundSpeed, yGroundSpeed) < 0.1;

if (state == BallState.IDLE && swingButtonWasPressed) {
	state = BallState.IN_AIR;

	//TODO: Replace these values with ones using the selected club and the player's swing performance.
	verticalSpeed = 2.5;
	var groundSpeed = 2;

	xGroundSpeed = lengthdir_x(groundSpeed, direction);
	yGroundSpeed = lengthdir_y(groundSpeed, direction);
} else if (state == BallState.IN_AIR && ballStoppedBouncing) {
	state = BallState.ROLLING;

	altitude = 0;

	verticalSpeed = 0;
} else if (state == BallState.ROLLING && ballStoppedRolling) {
	state = BallState.IDLE;

	altitude = 0;

	verticalSpeed = 0;
	xGroundSpeed = 0;
	yGroundSpeed = 0;
}



x += xGroundSpeed;
y += yGroundSpeed;



switch (state) {
	case BallState.IDLE: {
		// nothing to do for now
	} break;

	case BallState.IN_AIR: {
		altitude = altitude + verticalSpeed;

		if (altitude < 0) {
			altitude = abs(altitude);
			verticalSpeed = abs(verticalSpeed) * BALL_BOUNCE_DAMPENING_FACTOR;
		}

		verticalSpeed -= BALL_GRAVITY;
	} break;

	case BallState.ROLLING: {
		//TODO: The friction magnitude should be based on what the current ground type is (fairway, rough, etc.).
		var frictionMagnitude = FAIRWAY_FRICTION;
		var frictionDirection = point_direction(xGroundSpeed, yGroundSpeed, 0, 0);
		xGroundSpeed += lengthdir_x(frictionMagnitude, frictionDirection);
		yGroundSpeed += lengthdir_y(frictionMagnitude, frictionDirection);
	} break;
}
