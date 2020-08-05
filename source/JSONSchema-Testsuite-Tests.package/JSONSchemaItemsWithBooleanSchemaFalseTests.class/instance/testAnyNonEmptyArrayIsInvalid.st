tests
testAnyNonEmptyArrayIsInvalid
	self
		assertInvalid: '[1,"foo",true]'
		description: 'any non-empty array is invalid'