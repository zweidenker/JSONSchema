tests
testParagraphSeparatorDoesNotMatchLineTerminator
	self
		assertInvalid: '" "'
		description: 'paragraph separator does not match (line terminator)'