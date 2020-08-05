tests
testPropertyInvalidatesProperty
	self
		assertInvalid: '{"foo":[1,2,3,4]}'
		description: 'property invalidates property'