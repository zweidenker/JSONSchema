tests
testAdditionalPropertyIgnoresProperty
	self
		assertValid: '{"bar":[]}'
		description: 'additionalProperty ignores property'