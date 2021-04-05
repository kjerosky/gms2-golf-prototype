enum Clubs {
	WOOD,
	IRON,
	PUTTER,
	LAST
};

clubs[Clubs.WOOD] = {
	name: "WOOD",
	verticalSpeed: 1.75,
	groundSpeed: 3.75
};
clubs[Clubs.IRON] = {
	name: "IRON",
	verticalSpeed: 2.5,
	groundSpeed: 2
};
clubs[Clubs.PUTTER] = {
	name: "PUTTER",
	verticalSpeed: 0,
	groundSpeed: 4
};

// ---------------------------------------------------------------------------

selectedClubIndex = 0;
selectedClub = clubs[selectedClubIndex];
