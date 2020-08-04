tests
testBelowTheMaximumIsInvalid
	self
		assertValid: '299.97'
		description: 'below the maximum is invalid'