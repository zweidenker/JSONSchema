tests
testNeitherOneOfValid
	self
		assertInvalid: '{"baz":"quux"}'
		description: 'neither oneOf valid'