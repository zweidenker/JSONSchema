tests
testAnIPAddressWithOutOfRangeValues
	self
		assertInvalid: '"256.256.256.256"'
		description: 'an IP address with out-of-range values'