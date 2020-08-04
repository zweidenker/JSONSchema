tests
testObjectWithBothPropertiesIsInvalid
	self
		assertInvalid: '{"foo":1,"bar":2}'
		description: 'object with both properties is invalid'