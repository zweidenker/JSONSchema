tests
testZeroWidthWhitespaceDoesNotMatch
	self
		assertInvalid: '""'
		description: 'zero-width whitespace does not match'