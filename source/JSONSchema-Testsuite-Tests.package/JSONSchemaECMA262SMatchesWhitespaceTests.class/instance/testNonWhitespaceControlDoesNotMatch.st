tests
testNonWhitespaceControlDoesNotMatch
	self
		assertInvalid: '"\u0001"'
		description: 'Non-whitespace control does not match'