tests
testObjectWithPropertyMatchingSchemaFalseIsInvalid
	self
		assertInvalid: '{"bar":2}'
		description: 'object with property matching schema false is invalid'