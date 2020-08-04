tests
testASCIIZeroDoesNotMatch
	self assertInvalid: '"0"' description: 'ASCII zero does not match'