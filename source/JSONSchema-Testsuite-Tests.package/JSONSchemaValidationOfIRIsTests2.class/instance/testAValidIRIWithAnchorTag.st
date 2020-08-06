tests
testAValidIRIWithAnchorTag
	self
		assertValid: '"http://ƒøø.ßår/?∂éœ=πîx#πîüx"'
		description: 'a valid IRI with anchor tag'