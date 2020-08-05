tests
testValidJSONPointerEscapedWithFractionPart2
	self
		assertValid: '"/~0.1"'
		description: 'valid JSON-pointer (escaped with fraction part) #2'