tests
testNotAValidJSONPointerIsnTEmptyNorStartsWith2
	self
		assertInvalid: '"0"'
		description: 'not a valid JSON-pointer (isn''t empty nor starts with /) #2'