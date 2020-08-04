tests
testBothOneOfValidComplex
	self
		assertInvalid: '{"foo":"baz","bar":2}'
		description: 'both oneOf valid (complex)'