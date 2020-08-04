tests
testValidJSONPointerAsStatedInRFC69019
	self
		assertValid: '"/i\\j"'
		description: 'valid JSON-pointer as stated in RFC 6901 #9'