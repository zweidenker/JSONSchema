tests
testObjectWithStringsIsInvalid
	self
		assertInvalid: '{"foo\"bar":"1"}'
		description: 'object with strings is invalid'