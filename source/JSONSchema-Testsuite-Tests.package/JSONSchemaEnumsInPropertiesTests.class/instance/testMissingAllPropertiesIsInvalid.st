tests
testMissingAllPropertiesIsInvalid
	self
		assertInvalid: '{}'
		description: 'missing all properties is invalid'