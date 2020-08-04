tests
testAdditionalPropertyValidatesOthers
	self
		assertValid: '{"quux":3}'
		description: 'additionalProperty validates others'