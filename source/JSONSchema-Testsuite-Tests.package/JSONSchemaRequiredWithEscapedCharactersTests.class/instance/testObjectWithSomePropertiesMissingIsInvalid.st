tests
testObjectWithSomePropertiesMissingIsInvalid
	self
		assertInvalid: '{"foo\nbar":"1","foo\"bar":"1"}'
		description: 'object with some properties missing is invalid'