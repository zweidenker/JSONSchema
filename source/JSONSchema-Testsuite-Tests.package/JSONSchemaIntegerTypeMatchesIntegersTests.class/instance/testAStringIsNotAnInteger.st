tests
testAStringIsNotAnInteger
	self assertInvalid: '"foo"' description: 'a string is not an integer'