tests
testAnInvalidIRIReference
	self
		assertInvalid: '"\\\\WINDOWS\\filëßåré"'
		description: 'an invalid IRI Reference'