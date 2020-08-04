tests
testValidWhenPropertyIsSpecified
	self
		assertValid: '{"bar":"good"}'
		description: 'valid when property is specified'