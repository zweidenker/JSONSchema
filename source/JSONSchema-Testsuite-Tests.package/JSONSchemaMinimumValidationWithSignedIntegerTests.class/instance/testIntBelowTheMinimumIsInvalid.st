tests
testIntBelowTheMinimumIsInvalid
	self
		assertInvalid: '-3'
		description: 'int below the minimum is invalid'