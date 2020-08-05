tests
testObjectWithPropertyHavingSchemaTrueIsValid
	self
		assertValid: '{"foo":1}'
		description: 'object with property having schema true is valid'