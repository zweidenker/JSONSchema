tests
testObjectWithNumbersIsValid
	self
		assertValid: '{"foo\"bar":1}'
		description: 'object with numbers is valid'