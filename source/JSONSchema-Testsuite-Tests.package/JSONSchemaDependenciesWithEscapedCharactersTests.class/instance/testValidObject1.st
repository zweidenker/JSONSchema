tests
testValidObject1
	self
		assertValid: '{"foo\nbar":1,"foo\rbar":2}'
		description: 'valid object 1'