//TODO: Allowing club selection should probably depend on a general game state instead of the ball's state.
if (oBall.state != BallState.IDLE) {
	exit;
}

if (keyboard_check_pressed(vk_up)) {
	selectedClubIndex--;
	if (selectedClubIndex < 0) {
		selectedClubIndex = Clubs.LAST - 1;
	}
} else if (keyboard_check_pressed(vk_down)) {
	selectedClubIndex++;
	if (selectedClubIndex >= Clubs.LAST) {
		selectedClubIndex = 0;
	}
}

selectedClub = clubs[selectedClubIndex];
