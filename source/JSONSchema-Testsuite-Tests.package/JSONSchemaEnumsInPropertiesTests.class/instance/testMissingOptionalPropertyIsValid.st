tests
testMissingOptionalPropertyIsValid
	self
		assertValid: '{"bar":"bar"}'
		description: 'missing optional property is valid'