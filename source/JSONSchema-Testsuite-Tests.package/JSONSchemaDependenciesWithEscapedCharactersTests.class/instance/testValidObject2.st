tests
testValidObject2
	self
		assertValid: '{"c":4,"a":2,"foo\tbar":1,"b":3}'
		description: 'valid object 2'