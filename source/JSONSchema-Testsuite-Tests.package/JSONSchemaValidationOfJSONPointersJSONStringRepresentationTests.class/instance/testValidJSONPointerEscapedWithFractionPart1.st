tests
testValidJSONPointerEscapedWithFractionPart1
	self
		assertValid: '"/~1.1"'
		description: 'valid JSON-pointer (escaped with fraction part) #1'