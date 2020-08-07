tests
testAValidDateTimeStringWithoutSecondFraction
	self
		assertValid: '"1963-06-19T08:30:06Z"'
		description: 'a valid date-time string without second fraction'