tests
testAValidTelURI
	self
		assertValid: '"tel:+1-816-555-1212"'
		description: 'a valid tel URI'