tests
testAnInvalidIRI
	self
		assertInvalid: '"\\\\WINDOWS\\filëßåré"'
		description: 'an invalid IRI'