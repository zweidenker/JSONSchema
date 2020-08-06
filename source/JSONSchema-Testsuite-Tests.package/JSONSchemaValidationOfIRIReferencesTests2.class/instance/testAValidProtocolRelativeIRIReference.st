tests
testAValidProtocolRelativeIRIReference
	self
		assertValid: '"//ƒøø.ßår/?∂éœ=πîx#πîüx"'
		description: 'a valid protocol-relative IRI Reference'