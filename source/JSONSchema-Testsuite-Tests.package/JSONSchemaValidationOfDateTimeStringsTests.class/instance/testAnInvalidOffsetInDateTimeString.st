tests
testAnInvalidOffsetInDateTimeString
	self
		assertInvalid: '"1990-12-31T15:59:60-24:00"'
		description: 'an invalid offset in date-time string'