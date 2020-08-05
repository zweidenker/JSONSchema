tests
testValidJSONPointerAsStatedInRFC69016
	self
		assertValid: '"/c%d"'
		description: 'valid JSON-pointer as stated in RFC 6901 #6'