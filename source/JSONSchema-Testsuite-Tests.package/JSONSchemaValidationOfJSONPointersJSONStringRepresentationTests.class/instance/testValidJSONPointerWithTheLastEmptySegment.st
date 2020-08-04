tests
testValidJSONPointerWithTheLastEmptySegment
	self
		assertValid: '"/foo/bar/"'
		description: 'valid JSON-pointer with the last empty segment'