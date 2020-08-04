tests
testAnAdditionalInvalidPropertyIsInvalid
	self
		assertInvalid: '{"foo":1}'
		description: 'an additional invalid property is invalid'