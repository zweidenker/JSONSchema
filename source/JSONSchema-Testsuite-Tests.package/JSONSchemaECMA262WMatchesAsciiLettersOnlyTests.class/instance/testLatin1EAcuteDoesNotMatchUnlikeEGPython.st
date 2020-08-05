tests
testLatin1EAcuteDoesNotMatchUnlikeEGPython
	self
		assertInvalid: '"é"'
		description: 'latin-1 e-acute does not match (unlike e.g. Python)'