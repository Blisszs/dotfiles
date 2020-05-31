//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
			       {"", "network", 60, 0},
			       {"", "weatherblock", 900, 0},
			       {"", "storage", 0, 0},
			       {"", "clock", 60, 0},

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
