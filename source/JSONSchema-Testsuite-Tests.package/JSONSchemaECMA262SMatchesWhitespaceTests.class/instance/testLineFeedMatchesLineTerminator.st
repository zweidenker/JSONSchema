tests
testLineFeedMatchesLineTerminator
	self
		assertValid: '"\n"'
		description: 'line feed matches (line terminator)'