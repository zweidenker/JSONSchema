tests
testDotBeforeLocalPartIsNotValid
	self
		assertInvalid: '".test@example.com"'
		description: 'dot before local part is not valid'