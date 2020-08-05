tests
testValidJSONPointerAsStatedInRFC69012
	self
		assertValid: '"/foo"'
		description: 'valid JSON-pointer as stated in RFC 6901 #2'