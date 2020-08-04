tests
testNotAValidJSONPointerWrongEscapeCharacter2
	self
		assertInvalid: '"/~-1"'
		description: 'not a valid JSON-pointer (wrong escape character) #2'