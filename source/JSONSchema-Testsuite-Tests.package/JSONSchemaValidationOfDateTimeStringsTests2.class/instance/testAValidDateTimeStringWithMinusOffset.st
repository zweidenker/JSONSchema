tests
testAValidDateTimeStringWithMinusOffset
	self
		assertValid: '"1990-12-31T15:59:50.123-08:00"'
		description: 'a valid date-time string with minus offset'