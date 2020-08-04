tests
testValidObject3
	self
		assertValid: '{"foo''bar":1,"foo\"bar":2}'
		description: 'valid object 3'