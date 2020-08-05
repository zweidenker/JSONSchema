tests
testAStringIsNotANumber
	self assertInvalid: '"foo"' description: 'a string is not a number'