tests
testAnInvalidDueToTheOtherIsInvalid
	self
		assertInvalid: '{"aaaa":31}'
		description: 'an invalid due to the other is invalid'