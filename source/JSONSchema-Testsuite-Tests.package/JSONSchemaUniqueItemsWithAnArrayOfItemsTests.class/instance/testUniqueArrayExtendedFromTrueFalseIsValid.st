tests
testUniqueArrayExtendedFromTrueFalseIsValid
	self
		assertValid: '[true,false,"foo","bar"]'
		description: 'unique array extended from [true, false] is valid'