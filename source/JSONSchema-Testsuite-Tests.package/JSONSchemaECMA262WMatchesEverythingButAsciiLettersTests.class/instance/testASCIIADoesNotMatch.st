tests
testASCIIADoesNotMatch
	self assertInvalid: '"a"' description: 'ASCII ''a'' does not match'