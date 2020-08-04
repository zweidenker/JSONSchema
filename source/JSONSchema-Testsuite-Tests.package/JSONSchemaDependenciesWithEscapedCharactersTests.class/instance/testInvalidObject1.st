tests
testInvalidObject1
	self
		assertInvalid: '{"foo":2,"foo\nbar":1}'
		description: 'invalid object 1'