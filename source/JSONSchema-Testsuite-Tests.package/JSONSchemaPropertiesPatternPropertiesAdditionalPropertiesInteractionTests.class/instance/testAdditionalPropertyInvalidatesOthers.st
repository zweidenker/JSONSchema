tests
testAdditionalPropertyInvalidatesOthers
	self
		assertInvalid: '{"quux":"foo"}'
		description: 'additionalProperty invalidates others'