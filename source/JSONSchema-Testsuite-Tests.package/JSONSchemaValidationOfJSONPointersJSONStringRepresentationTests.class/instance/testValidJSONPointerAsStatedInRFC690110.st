tests
testValidJSONPointerAsStatedInRFC690110
	self
		assertValid: '"/k\"l"'
		description: 'valid JSON-pointer as stated in RFC 6901 #10'