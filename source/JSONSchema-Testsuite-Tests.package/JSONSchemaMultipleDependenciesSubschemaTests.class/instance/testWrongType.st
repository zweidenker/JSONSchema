tests
testWrongType
	self
		assertInvalid: '{"foo":"quux","bar":2}'
		description: 'wrong type'