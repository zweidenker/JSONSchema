tests
testPresentRequiredPropertyIsValid
	self
		assertValid: '{"foo":1}'
		description: 'present required property is valid'