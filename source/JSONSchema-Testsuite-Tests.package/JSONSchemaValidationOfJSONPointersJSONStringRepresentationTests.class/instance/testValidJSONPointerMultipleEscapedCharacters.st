tests
testValidJSONPointerMultipleEscapedCharacters
	self
		assertValid: '"/~1~0~0~1~1"'
		description: 'valid JSON-pointer (multiple escaped characters)'