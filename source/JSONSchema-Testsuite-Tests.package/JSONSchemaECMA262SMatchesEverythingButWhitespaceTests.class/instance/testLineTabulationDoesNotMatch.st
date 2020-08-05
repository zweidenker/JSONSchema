tests
testLineTabulationDoesNotMatch
	self
		assertInvalid: '"\u000B"'
		description: 'Line tabulation does not match'