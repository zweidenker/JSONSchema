tests
testAStringIsStillNotANumberEvenIfItLooksLikeOne
	self
		assertInvalid: '"1"'
		description: 'a string is still not a number, even if it looks like one'