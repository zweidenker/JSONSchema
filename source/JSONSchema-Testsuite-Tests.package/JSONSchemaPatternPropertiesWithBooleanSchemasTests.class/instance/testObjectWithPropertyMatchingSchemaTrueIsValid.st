tests
testObjectWithPropertyMatchingSchemaTrueIsValid
	self
		assertValid: '{"foo":1}'
		description: 'object with property matching schema true is valid'