tests
testUniqueArrayExtendedFromFalseTrueIsValid
	self
		assertValid: '[false,true,"foo","bar"]'
		description: 'unique array extended from [false, true] is valid'