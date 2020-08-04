tests
testValidJSONPointerUsedAsObjectMemberName
	self
		assertValid: '"/foo/-/bar"'
		description: 'valid JSON-pointer (- used as object member name)'