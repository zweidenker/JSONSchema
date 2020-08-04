tests
testAStringIsStillNotAnIntegerEvenIfItLooksLikeOne
	self
		assertInvalid: '"1"'
		description: 'a string is still not an integer, even if it looks like one'