tests
testBothValidInvalid
	self
		assertInvalid: '{"foo":1,"bar":2,"baz":3}'
		description: 'both valid - invalid'