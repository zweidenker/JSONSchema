tests
testNotAValidJSONPointerNotEscaped
	self
		assertInvalid: '"/foo/bar~"'
		description: 'not a valid JSON-pointer (~ not escaped)'