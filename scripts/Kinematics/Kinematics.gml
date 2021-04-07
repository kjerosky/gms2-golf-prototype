// For the ball to travel a specified distance to the first ground impact:
//
// dx = v_0 * t + 1/2 * a * t^2
//
// distance = groundSpeed * t + 1/2 * 0 * t^2
// distance = groundSpeed * t
// t = distance / groundSpeed
//
// dy = v_0 * t + 1/2 * a * t^2
// 0 = initialVerticalSpeed * t - 1/2 * gravity * t^2
// initialVerticalSpeed * t = 1/2 * gravity * t^2
// initialVerticalSpeed = 1/2 * gravity * t
// initialVerticalSpeed = 1/2 * gravity * (distance / groundSpeed)
// initialVerticalSpeed = gravity * distance / groundSpeed / 2
//
// In order to reduce the distance using a multiplicative factor while keeping the original shape of the trajectory/arc, we need to multiply the distance by the factor, and the groundSpeed by the square root of the factor.
//
// initialVerticalSpeed = gravity * (distance * factor) / (groundSpeed * sqrt(factor)) / 2
// initialVerticalSpeed = gravity * sqrt(factor) * distance / groundSpeed / 2
//
// initialVerticalSpeed = gravity * sqrt(factor) * clubMaxDistance / clubGroundSpeedForMaxDistance / 2

function calculateBallInitialVerticalSpeed(gravity, clubMaxDistance, clubGroundSpeedForMaxDistance, fractionOfMaxDistance) {
	return gravity * sqrt(fractionOfMaxDistance) * clubMaxDistance / clubGroundSpeedForMaxDistance / 2;
}
