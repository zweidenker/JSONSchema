tests
testAnAdditionalPropertyIsInvalid
	self
		assertInvalid: '{"quux":"boom","foo":1,"bar":2}'
		description: 'an additional property is invalid'