tests
testAnAdditionalInvalidPropertyIsInvalid
	self
		assertInvalid: '{"quux":12,"foo":1,"bar":2}'
		description: 'an additional invalid property is invalid'