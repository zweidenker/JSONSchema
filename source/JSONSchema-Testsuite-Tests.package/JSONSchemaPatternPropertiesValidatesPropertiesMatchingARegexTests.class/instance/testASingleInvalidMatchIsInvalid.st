tests
testASingleInvalidMatchIsInvalid
	self
		assertInvalid: '{"fooooo":2,"foo":"bar"}'
		description: 'a single invalid match is invalid'