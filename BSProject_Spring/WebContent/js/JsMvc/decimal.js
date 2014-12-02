var as_integer = function(number) {
	var tagetNumber,
	    exp = 0,
		number = number.split("."),
	    integer = value[0],
	    dig = value[1];
		if (!dig) {
			tagetNumber = integer
		} else {
			tagetNumber = parseInt(number.split(".").join(''), 10);
			exp = dig.length * -1;
		}

        return {
            'tagetNumber': tagetNumber,
            'exp': exp
        };
}
