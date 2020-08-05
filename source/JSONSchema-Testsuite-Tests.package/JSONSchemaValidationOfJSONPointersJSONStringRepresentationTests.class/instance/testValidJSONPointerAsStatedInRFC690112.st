tests
testValidJSONPointerAsStatedInRFC690112
	self
		assertValid: '"/m~0n"'
		description: 'valid JSON-pointer as stated in RFC 6901 #12'