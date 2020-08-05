tests
testAStringIsNotABoolean
	self assertInvalid: '"foo"' description: 'a string is not a boolean'