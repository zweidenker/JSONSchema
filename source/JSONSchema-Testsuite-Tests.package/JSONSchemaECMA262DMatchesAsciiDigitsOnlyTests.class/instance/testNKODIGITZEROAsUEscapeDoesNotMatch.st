tests
testNKODIGITZEROAsUEscapeDoesNotMatch
	self
		assertInvalid: '"߀"'
		description: 'NKO DIGIT ZERO (as \u escape) does not match'