tests
testObjectWithAPropertyMatchingBothTrueAndFalseIsInvalid
	self
		assertInvalid: '{"foobar":1}'
		description: 'object with a property matching both true and false is invalid'