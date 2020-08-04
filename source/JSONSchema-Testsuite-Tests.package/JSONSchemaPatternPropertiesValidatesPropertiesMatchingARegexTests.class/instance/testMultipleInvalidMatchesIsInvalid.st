tests
testMultipleInvalidMatchesIsInvalid
	self
		assertInvalid: '{"foo":"bar","foooooo":"baz"}'
		description: 'multiple invalid matches is invalid'