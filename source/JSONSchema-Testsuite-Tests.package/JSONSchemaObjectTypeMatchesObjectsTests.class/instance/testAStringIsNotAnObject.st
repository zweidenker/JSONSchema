tests
testAStringIsNotAnObject
	self assertInvalid: '"foo"' description: 'a string is not an object'