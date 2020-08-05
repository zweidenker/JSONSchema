tests
testNonWhitespaceDoesNotMatch
	self
		assertInvalid: '"–"'
		description: 'Non-whitespace does not match'