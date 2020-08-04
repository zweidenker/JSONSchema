tests
testPropertyValidatesProperty
	self
		assertValid: '{"foo":[1,2]}'
		description: 'property validates property'