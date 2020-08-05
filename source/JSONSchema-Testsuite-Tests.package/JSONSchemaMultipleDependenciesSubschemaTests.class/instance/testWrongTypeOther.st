tests
testWrongTypeOther
	self
		assertInvalid: '{"foo":2,"bar":"quux"}'
		description: 'wrong type other'