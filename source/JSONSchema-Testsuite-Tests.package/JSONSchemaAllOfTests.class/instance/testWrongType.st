tests
testWrongType
	self
		assertInvalid: '{"foo":"baz","bar":"quux"}'
		description: 'wrong type'