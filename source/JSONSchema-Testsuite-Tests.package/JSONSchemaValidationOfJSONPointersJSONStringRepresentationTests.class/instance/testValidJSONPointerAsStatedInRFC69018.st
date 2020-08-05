tests
testValidJSONPointerAsStatedInRFC69018
	self
		assertValid: '"/g|h"'
		description: 'valid JSON-pointer as stated in RFC 6901 #8'