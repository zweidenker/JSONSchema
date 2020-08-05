tests
testNonUniqueArrayExtendedFromFalseTrueIsValid
	self
		assertValid: '[false,true,"foo","foo"]'
		description: 'non-unique array extended from [false, true] is valid'