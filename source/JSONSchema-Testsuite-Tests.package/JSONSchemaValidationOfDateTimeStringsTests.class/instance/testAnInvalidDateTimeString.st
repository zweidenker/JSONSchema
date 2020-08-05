tests
testAnInvalidDateTimeString
	self
		assertInvalid: '"06/19/1963 08:30:06 PST"'
		description: 'an invalid date-time string'