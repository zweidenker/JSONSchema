tests
testValidButWouldHaveBeenInvalidThroughThen
	self
		assertValid: '-100'
		description: 'valid, but would have been invalid through then'