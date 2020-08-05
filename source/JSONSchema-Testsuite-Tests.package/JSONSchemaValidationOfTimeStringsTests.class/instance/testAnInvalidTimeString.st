tests
testAnInvalidTimeString
	self
		assertInvalid: '"08:30:06 PST"'
		description: 'an invalid time string'