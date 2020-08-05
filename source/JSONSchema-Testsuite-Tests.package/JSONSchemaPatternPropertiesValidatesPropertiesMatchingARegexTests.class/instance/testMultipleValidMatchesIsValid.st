tests
testMultipleValidMatchesIsValid
	self
		assertValid: '{"foo":1,"foooooo":2}'
		description: 'multiple valid matches is valid'