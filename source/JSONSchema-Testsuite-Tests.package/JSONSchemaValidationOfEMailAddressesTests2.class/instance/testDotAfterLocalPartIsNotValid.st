tests
testDotAfterLocalPartIsNotValid
	self
		assertInvalid: '"test.@example.com"'
		description: 'dot after local part is not valid'