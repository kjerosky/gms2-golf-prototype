enum BallState {
	IDLE,
	IN_AIR,
	ROLLING
};

BALL_GRAVITY = 0.04;
BALL_BOUNCE_DAMPENING_FACTOR = 0.6;

FAIRWAY_FRICTION = 0.025;



state = BallState.IDLE;

direction = 0;
altitude = 0;

verticalSpeed = 0;
xGroundSpeed = 0;
yGroundSpeed = 0;
