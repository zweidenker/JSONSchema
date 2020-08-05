tests
testWrongBarValue
	self
		assertInvalid: '{"foo":"foo","bar":"bart"}'
		description: 'wrong bar value'