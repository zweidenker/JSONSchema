tests
testAboveTheMaximumIsInvalid
	self
		assertInvalid: '300.5'
		description: 'above the maximum is invalid'