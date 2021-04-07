var ballState = oBall.state;
var selectedClubIndex = oGolfBag.selectedClubIndex;
var ballDirection = oBall.direction;

var ballStateChangedToIdle = ballState != previousBallState && ballState == BallState.IDLE;
var selectedClubChanged = selectedClubIndex != previousSelectedClubIndex;
var ballDirectionChanged = ballDirection != previousBallDirection;
var pathRecalculationIsNeeded =
	ballStateChangedToIdle ||
	selectedClubChanged ||
	ballDirectionChanged;

previousBallState = ballState;
previousSelectedClubIndex = selectedClubIndex;
previousBallDirection = ballDirection;

if (!pathRecalculationIsNeeded) {
	exit;
}



var selectedClub = oGolfBag.selectedClub;

// Deriving the final t in the arc:
// Original equation: dx = v0 * t + 1/2 * a * t^2
// Convert to vertical use case: dy = vy0 * t - 1/2 * g * t^2
// Find where the arc meets the ground again (dy = 0): 0 = vy0 * t - 1/2 * g * t^2
// Solve for t:
// 1/2 * g * t^2 = vy0 * t
// 1/2 * g * t = vy0
// t = 2 * vy0 / g
var maxVerticalSpeed = calculateBallInitialVerticalSpeed(oBall.BALL_GRAVITY, selectedClub.maxDistance, selectedClub.groundSpeedForMaxDistance, 1);
tFinal = 2 * maxVerticalSpeed / oBall.BALL_GRAVITY;

var groundSpeed = selectedClub.groundSpeedForMaxDistance;
groundSpeedX = lengthdir_x(groundSpeed, ballDirection);
groundSpeedY = lengthdir_y(groundSpeed, ballDirection);

initialGroundX = oBall.x;
initialGroundY = oBall.y;

initialVerticalVelocity = maxVerticalSpeed;
gravityValue = oBall.BALL_GRAVITY;
