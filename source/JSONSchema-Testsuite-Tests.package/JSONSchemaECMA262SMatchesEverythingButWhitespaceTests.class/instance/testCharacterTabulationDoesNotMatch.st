tests
testCharacterTabulationDoesNotMatch
	self
		assertInvalid: '"\t"'
		description: 'Character tabulation does not match'