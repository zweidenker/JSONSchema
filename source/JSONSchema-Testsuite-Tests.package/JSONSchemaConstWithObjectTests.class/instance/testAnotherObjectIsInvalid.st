tests
testAnotherObjectIsInvalid
	self
		assertInvalid: '{"foo":"bar"}'
		description: 'another object is invalid'