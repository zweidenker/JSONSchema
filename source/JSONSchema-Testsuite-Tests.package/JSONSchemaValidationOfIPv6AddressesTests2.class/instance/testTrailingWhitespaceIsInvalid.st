tests
testTrailingWhitespaceIsInvalid
	self
		assertInvalid: '"::1  "'
		description: 'trailing whitespace is invalid'