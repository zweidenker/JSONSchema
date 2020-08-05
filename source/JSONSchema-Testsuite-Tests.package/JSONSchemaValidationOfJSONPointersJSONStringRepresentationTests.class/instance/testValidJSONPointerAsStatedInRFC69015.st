tests
testValidJSONPointerAsStatedInRFC69015
	self
		assertValid: '"/a~1b"'
		description: 'valid JSON-pointer as stated in RFC 6901 #5'