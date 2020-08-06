tests
testLeadingWhitespaceIsInvalid
	self
		assertInvalid: '"  ::1"'
		description: 'leading whitespace is invalid'