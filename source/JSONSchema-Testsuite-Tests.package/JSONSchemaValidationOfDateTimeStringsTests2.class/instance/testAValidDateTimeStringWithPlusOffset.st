tests
testAValidDateTimeStringWithPlusOffset
	self
		assertValid: '"1937-01-01T12:00:27.87+00:20"'
		description: 'a valid date-time string with plus offset'