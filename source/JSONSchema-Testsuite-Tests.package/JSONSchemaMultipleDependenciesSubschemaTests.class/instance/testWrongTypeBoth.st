tests
testWrongTypeBoth
	self
		assertInvalid: '{"foo":"quux","bar":"quux"}'
		description: 'wrong type both'