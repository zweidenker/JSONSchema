tests
testNotAValidJSONPointerWrongEscapeCharacter1
	self
		assertInvalid: '"/~2"'
		description: 'not a valid JSON-pointer (wrong escape character) #1'