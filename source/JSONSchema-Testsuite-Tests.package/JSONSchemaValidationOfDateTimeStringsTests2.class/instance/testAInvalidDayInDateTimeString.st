tests
testAInvalidDayInDateTimeString
	self
		assertInvalid: '"1990-02-31T15:59:60.123-08:00"'
		description: 'a invalid day in date-time string'