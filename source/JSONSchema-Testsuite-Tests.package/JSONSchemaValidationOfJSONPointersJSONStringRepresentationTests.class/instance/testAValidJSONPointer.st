tests
testAValidJSONPointer
	self
		assertValid: '"/foo/bar~0/baz~1/%a"'
		description: 'a valid JSON-pointer'