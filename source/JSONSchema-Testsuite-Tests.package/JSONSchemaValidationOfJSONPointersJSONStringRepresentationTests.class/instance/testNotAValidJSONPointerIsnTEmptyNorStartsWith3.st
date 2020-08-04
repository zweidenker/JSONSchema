tests
testNotAValidJSONPointerIsnTEmptyNorStartsWith3
	self
		assertInvalid: '"a/a"'
		description: 'not a valid JSON-pointer (isn''t empty nor starts with /) #3'