enum Clubs {
	WOOD,
	IRON,
	PUTTER,
	LAST
};

clubs[Clubs.WOOD] = {
	name: "WOOD",
	maxDistance: 328.125,
	groundSpeedForMaxDistance: 3.75
};
clubs[Clubs.IRON] = {
	name: "IRON",
	maxDistance: 250,
	groundSpeedForMaxDistance: 2
};
clubs[Clubs.PUTTER] = {
	name: "PUTTER",
	maxDistance: 0,
	groundSpeedForMaxDistance: 4
};

// ---------------------------------------------------------------------------

selectedClubIndex = 0;
selectedClub = clubs[selectedClubIndex];
