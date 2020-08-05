tests
testNeitherAnyOfValidComplex
	self
		assertInvalid: '{"foo":2,"bar":"quux"}'
		description: 'neither anyOf valid (complex)'