tests
testWrongFooValue
	self
		assertInvalid: '{"foo":"foot","bar":"bar"}'
		description: 'wrong foo value'