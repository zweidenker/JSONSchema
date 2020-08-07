tests
testTwoSetsOfDoubleColonsIsInvalid
	self
		assertInvalid: '"1::d6::42"'
		description: 'two sets of double colons is invalid'