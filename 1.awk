BEGIN {
	ret = 0
}

{
	has_first = 0
	first = 0
	last = 0

	for (i = 1; i <= length($0); i++) {
		cur = substr($0, i, 1)
		remaining = substr($0, i)

		if (cur+0 == cur) val = cur
		else if (remaining ~ /^one.*/) val = 1
		else if (remaining ~ /^two.*/) val = 2
		else if (remaining ~ /^three.*/) val = 3
		else if (remaining ~ /^four.*/) val = 4
		else if (remaining ~ /^five.*/) val = 5
		else if (remaining ~ /^six.*/) val = 6
		else if (remaining ~ /^seven.*/) val = 7
		else if (remaining ~ /^eight.*/) val = 8
		else if (remaining ~ /^nine.*/) val = 9
		else val = 0

		if (val > 0 && has_first == 0) {
			first = val
			has_first = 1
		}
		if (val > 0)
			last = val
	}

	ret += int(first last)
}

END {
	print "result is " ret
}
	
