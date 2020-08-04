tests
testAnyNonEmptyArrayIsValid
	self
		assertValid: '["foo"]'
		description: 'any non-empty array is valid'