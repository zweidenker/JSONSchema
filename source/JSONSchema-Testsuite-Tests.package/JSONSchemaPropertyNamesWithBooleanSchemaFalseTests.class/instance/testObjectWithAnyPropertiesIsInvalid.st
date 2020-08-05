tests
testObjectWithAnyPropertiesIsInvalid
	self
		assertInvalid: '{"foo":1}'
		description: 'object with any properties is invalid'