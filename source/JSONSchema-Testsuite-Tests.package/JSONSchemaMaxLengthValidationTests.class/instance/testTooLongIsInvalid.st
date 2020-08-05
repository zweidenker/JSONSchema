tests
testTooLongIsInvalid
	self assertInvalid: '"foo"' description: 'too long is invalid'