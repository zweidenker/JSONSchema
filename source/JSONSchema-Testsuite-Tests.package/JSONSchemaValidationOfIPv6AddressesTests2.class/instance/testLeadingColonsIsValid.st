tests
testLeadingColonsIsValid
	self
		assertValid: '"::42:ff:1"'
		description: 'leading colons is valid'