tests
testMismatchBaseSchema
	self
		assertInvalid: '{"foo":"quux","baz":null}'
		description: 'mismatch base schema'