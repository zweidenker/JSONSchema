tests
testNotAValidJSONPointerMultipleCharactersNotEscaped
	self
		assertInvalid: '"/~~"'
		description: 'not a valid JSON-pointer (multiple characters not escaped)'