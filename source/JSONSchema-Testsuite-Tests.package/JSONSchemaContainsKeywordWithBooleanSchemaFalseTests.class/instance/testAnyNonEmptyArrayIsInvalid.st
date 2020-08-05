tests
testAnyNonEmptyArrayIsInvalid
	self
		assertInvalid: '["foo"]'
		description: 'any non-empty array is invalid'