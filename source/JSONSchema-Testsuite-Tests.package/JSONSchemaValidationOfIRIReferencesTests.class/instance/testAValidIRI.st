tests
testAValidIRI
	self
		assertValid: '"http://ƒøø.ßår/?∂éœ=πîx#πîüx"'
		description: 'a valid IRI'