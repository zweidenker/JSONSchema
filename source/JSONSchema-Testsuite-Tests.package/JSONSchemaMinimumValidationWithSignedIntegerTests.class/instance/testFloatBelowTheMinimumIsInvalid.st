tests
testFloatBelowTheMinimumIsInvalid
	self
		assertInvalid: '-2.0001'
		description: 'float below the minimum is invalid'