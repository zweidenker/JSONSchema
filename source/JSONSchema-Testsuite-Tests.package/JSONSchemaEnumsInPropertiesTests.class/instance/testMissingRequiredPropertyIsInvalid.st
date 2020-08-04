tests
testMissingRequiredPropertyIsInvalid
	self
		assertInvalid: '{"foo":"foo"}'
		description: 'missing required property is invalid'