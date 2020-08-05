tests
testNotAValidJSONPointerIsnTEmptyNorStartsWith1
	self
		assertInvalid: '"a"'
		description: 'not a valid JSON-pointer (isn''t empty nor starts with /) #1'