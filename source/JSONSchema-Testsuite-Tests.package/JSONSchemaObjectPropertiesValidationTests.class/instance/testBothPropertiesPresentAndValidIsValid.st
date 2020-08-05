tests
testBothPropertiesPresentAndValidIsValid
	self
		assertValid: '{"foo":1,"bar":"baz"}'
		description: 'both properties present and valid is valid'