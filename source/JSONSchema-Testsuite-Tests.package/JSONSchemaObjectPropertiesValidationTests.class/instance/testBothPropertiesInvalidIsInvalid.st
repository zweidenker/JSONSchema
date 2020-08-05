tests
testBothPropertiesInvalidIsInvalid
	self
		assertInvalid: '{"foo":[],"bar":{}}'
		description: 'both properties invalid is invalid'