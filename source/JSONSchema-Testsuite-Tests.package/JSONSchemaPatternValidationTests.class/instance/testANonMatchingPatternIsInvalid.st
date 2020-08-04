tests
testANonMatchingPatternIsInvalid
	self
		assertInvalid: '"abc"'
		description: 'a non-matching pattern is invalid'