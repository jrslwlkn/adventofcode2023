BEGIN {
	max_red = 12
	max_green = 13
	max_blue = 14

	ret = 0
}

{
	len = split($0, game, ":")
	line = game[2]

	len = split(line, semi_delim, ";")
	r = 0; g = 0; b = 0;
	for (i = 1; i <= len; i++) {
		l = split(semi_delim[i], comma_delim, ",")

		for (j = 1; j <= l; j++) {
			num = 0; color = "";

			if (match(comma_delim[j], /[0-9]+/))
				num = int(substr(comma_delim[j], RSTART, RLENGTH))
			if (match(comma_delim[j], /(red|green|blue)/))
				color = substr(comma_delim[j], RSTART, RLENGTH)

			if (color == "red" && r < num) r = num
			else if (color == "green" && g < num) g = num
			else if (color == "blue" && b < num) b = num
		}
	}

	if (r <= max_red && g <= max_green && b <= max_blue) {
		ret += NR
	}
}

END {
	print "sum of games: " ret
}
