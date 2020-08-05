tests
testTooLongIsInvalid
	self
		assertInvalid: '{"foo":1,"bar":2,"baz":3}'
		description: 'too long is invalid'