tests
testAnIPAddressAsAnIntegerDecimal
	self
		assertInvalid: '"2130706433"'
		description: 'an IP address as an integer (decimal)'