tests
testObjectWithPropertyHavingSchemaFalseIsInvalid
	self
		assertInvalid: '{"bar":2}'
		description: 'object with property having schema false is invalid'