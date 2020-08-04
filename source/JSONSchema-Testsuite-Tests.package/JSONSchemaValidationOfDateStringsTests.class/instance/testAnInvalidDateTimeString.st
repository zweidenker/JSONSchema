tests
testAnInvalidDateTimeString
	self
		assertInvalid: '"06/19/1963"'
		description: 'an invalid date-time string'