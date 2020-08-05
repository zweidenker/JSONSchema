tests
testPropertyPresent
	self
		assertInvalid: '{"foo":1,"bar":2}'
		description: 'property present'