tests
testValidJSONPointerAsStatedInRFC690111
	self
		assertValid: '"/ "'
		description: 'valid JSON-pointer as stated in RFC 6901 #11'