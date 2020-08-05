tests
testAStringIsStillAStringEvenIfItLooksLikeANumber
	self
		assertValid: '"1"'
		description: 'a string is still a string, even if it looks like a number'