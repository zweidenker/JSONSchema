tests
testValidJSONPointerAsStatedInRFC69014
	self
		assertValid: '"/"'
		description: 'valid JSON-pointer as stated in RFC 6901 #4'