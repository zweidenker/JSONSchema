tests
testNeitherOneOfValidComplex
	self
		assertInvalid: '{"foo":2,"bar":"quux"}'
		description: 'neither oneOf valid (complex)'