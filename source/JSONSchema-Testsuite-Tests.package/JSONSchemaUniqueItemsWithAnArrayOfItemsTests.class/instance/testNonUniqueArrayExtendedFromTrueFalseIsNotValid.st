tests
testNonUniqueArrayExtendedFromTrueFalseIsNotValid
	self
		assertInvalid: '[true,false,"foo","foo"]'
		description: 'non-unique array extended from [true, false] is not valid'