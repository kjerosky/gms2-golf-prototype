if (keyboard_check_pressed(ord("R"))) {
	x = xstart;
	y = ystart;
	altitude = 0;
	inFlight = false;
}

if (!inFlight && keyboard_check_pressed(vk_space)) {
	inFlight = true;
	altitude = 0.1;
	
	altitudeSpeed = 2.5;
	altitudeGravity = 0.05;
	
	direction = 0;
	var groundSpeed = 2;
	xSpeed = lengthdir_x(groundSpeed, direction);
	ySpeed = lengthdir_y(groundSpeed, direction);
	
}

if (inFlight) {
	x += xSpeed;
	y += ySpeed;
	altitude = max(0, altitude + altitudeSpeed);
	
	altitudeSpeed -= altitudeGravity;
	
	if (altitude == 0) {
		inFlight = false;
	}

	exit;
}

var moveHorizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var moveVertical = keyboard_check(ord("S")) - keyboard_check(ord("W"));
x += moveHorizontal;
y += moveVertical;

var adjustAltitude = keyboard_check(vk_up) - keyboard_check(vk_down);
altitude = max(0, altitude + adjustAltitude);
