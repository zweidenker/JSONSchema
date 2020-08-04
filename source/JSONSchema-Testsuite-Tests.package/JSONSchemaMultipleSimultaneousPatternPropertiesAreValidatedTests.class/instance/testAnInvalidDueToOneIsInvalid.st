tests
testAnInvalidDueToOneIsInvalid
	self
		assertInvalid: '{"a":"bar"}'
		description: 'an invalid due to one is invalid'