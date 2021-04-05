if (oBall.state != BallState.IDLE) {
	//exit;
}

var groundX = initialGroundX;
var groundY = initialGroundY;
var deltaT = 5;
for (var t = 0; t <= tFinal; t += deltaT) {
	var altitude = initialVerticalVelocity * t - 0.5 * gravityValue * t * t;
	
	var pathPointX = groundX;
	var pathPointY = groundY - altitude;
	draw_sprite(sPathPoint, -1, pathPointX, pathPointY);

	groundX += groundSpeedX * deltaT;
	groundY += groundSpeedY * deltaT;
}
