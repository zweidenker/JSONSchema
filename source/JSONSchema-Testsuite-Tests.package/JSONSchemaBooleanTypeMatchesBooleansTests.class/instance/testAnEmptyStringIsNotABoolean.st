tests
testAnEmptyStringIsNotABoolean
	self
		assertInvalid: '""'
		description: 'an empty string is not a boolean'