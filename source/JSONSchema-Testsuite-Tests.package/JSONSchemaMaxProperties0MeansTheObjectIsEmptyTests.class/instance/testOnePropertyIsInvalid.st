tests
testOnePropertyIsInvalid
	self
		assertInvalid: '{"foo":1}'
		description: 'one property is invalid'