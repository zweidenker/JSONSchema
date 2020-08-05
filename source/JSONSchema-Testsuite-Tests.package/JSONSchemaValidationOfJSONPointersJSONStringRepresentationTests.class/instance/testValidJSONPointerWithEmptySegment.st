tests
testValidJSONPointerWithEmptySegment
	self
		assertValid: '"/foo//bar"'
		description: 'valid JSON-pointer with empty segment'