tests
testNonUniqueArrayExtendedFromTrueFalseIsValid
	self
		assertValid: '[true,false,"foo","foo"]'
		description: 'non-unique array extended from [true, false] is valid'