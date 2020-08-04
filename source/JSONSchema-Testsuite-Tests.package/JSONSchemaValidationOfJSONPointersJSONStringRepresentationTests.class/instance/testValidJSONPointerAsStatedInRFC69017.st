tests
testValidJSONPointerAsStatedInRFC69017
	self
		assertValid: '"/e^f"'
		description: 'valid JSON-pointer as stated in RFC 6901 #7'