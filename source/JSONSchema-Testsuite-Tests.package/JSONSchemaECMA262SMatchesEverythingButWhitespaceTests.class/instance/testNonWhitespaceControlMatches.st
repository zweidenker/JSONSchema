tests
testNonWhitespaceControlMatches
	self
		assertValid: '"\u0001"'
		description: 'Non-whitespace control matches'