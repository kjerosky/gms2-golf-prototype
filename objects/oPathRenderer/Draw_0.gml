if (oBall.state != BallState.IDLE) {
	//TODO: Uncomment this to make the path disappear when hitting the ball!
	//exit;
}

var groundX = initialGroundX + groundSpeedX * tOffset;
var groundY = initialGroundY + groundSpeedY * tOffset;
for (var t = tOffset; t <= tFinal; t += T_BETWEEN_POINTS) {
	//dy = vy0 * t - 1/2 * g * t^2
	var altitude = initialVerticalVelocity * t - gravityValue * t * t / 2;
	
	var pathPointX = groundX;
	var pathPointY = groundY - altitude;
	draw_sprite(sPathPoint, -1, pathPointX, pathPointY);

	groundX += groundSpeedX * T_BETWEEN_POINTS;
	groundY += groundSpeedY * T_BETWEEN_POINTS;
}

// Rotate the t offset to produce an animated line of balls on the ideal flight path.
tOffset = (tOffset + T_OFFSET_CHANGE_AMOUNT) % T_BETWEEN_POINTS;

var impactPointX = initialGroundX + groundSpeedX * tFinal;
var impactPointY = initialGroundY + groundSpeedY * tFinal;
draw_sprite(sPathImpactPoint, -1, impactPointX, impactPointY);
