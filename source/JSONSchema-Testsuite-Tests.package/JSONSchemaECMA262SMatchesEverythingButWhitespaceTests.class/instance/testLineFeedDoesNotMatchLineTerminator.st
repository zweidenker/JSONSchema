tests
testLineFeedDoesNotMatchLineTerminator
	self
		assertInvalid: '"\n"'
		description: 'line feed does not match (line terminator)'