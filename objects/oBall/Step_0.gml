//TODO: Remove this temporary reset button when done testing!
if (oInput.resetWasPressed) {
	state = BallState.IDLE;

	x = xstart;
	y = ystart;
	altitude = 0;	

	verticalSpeed = 0;
	xGroundSpeed = 0;
	yGroundSpeed = 0;
}



var swingButtonWasPressed = oInput.swingWasPressed;
var ballStoppedBouncing = abs(altitude) < 0.1 && abs(verticalSpeed) < 0.1;
var ballStoppedRolling = point_distance(0, 0, xGroundSpeed, yGroundSpeed) < 0.1;

if (state == BallState.IDLE && swingButtonWasPressed) {
	state = BallState.IN_AIR;

	//TODO: Adjust these values based on the player's swing performance.
	var fractionOfMaxDistance = 1;
	verticalSpeed = calculateBallInitialVerticalSpeed(BALL_GRAVITY, oGolfBag.selectedClub.maxDistance, oGolfBag.selectedClub.groundSpeedForMaxDistance, fractionOfMaxDistance);
	var groundSpeed = oGolfBag.selectedClub.groundSpeedForMaxDistance * sqrt(fractionOfMaxDistance);

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
		var turnDirection = oInput.turnLeftIsPressed - oInput.turnRightIsPressed;
		direction += turnDirection * TURN_AMOUNT;
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
