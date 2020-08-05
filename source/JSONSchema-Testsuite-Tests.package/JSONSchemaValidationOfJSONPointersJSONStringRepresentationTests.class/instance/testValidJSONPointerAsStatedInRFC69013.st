tests
testValidJSONPointerAsStatedInRFC69013
	self
		assertValid: '"/foo/0"'
		description: 'valid JSON-pointer as stated in RFC 6901 #3'