tests
testNoAdditionalPropertiesIsValid
	self
		assertValid: '{"foo":1}'
		description: 'no additional properties is valid'