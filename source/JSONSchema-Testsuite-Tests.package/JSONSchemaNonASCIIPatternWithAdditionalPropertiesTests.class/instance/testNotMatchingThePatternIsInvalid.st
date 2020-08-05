tests
testNotMatchingThePatternIsInvalid
	self
		assertInvalid: '{"élmény":2}'
		description: 'not matching the pattern is invalid'