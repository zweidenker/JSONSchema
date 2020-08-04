tests
testInvalidObject2
	self
		assertInvalid: '{"a":2,"foo\tbar":1}'
		description: 'invalid object 2'