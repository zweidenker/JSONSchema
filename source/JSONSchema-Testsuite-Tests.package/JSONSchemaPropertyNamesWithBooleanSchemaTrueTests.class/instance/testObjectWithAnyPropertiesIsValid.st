tests
testObjectWithAnyPropertiesIsValid
	self
		assertValid: '{"foo":1}'
		description: 'object with any properties is valid'