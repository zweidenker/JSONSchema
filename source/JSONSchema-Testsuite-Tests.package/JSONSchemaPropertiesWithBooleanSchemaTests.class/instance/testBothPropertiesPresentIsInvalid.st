tests
testBothPropertiesPresentIsInvalid
	self
		assertInvalid: '{"foo":1,"bar":2}'
		description: 'both properties present is invalid'