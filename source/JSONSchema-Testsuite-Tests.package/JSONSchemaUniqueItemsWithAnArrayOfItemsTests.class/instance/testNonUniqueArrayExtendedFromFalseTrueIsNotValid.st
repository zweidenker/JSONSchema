tests
testNonUniqueArrayExtendedFromFalseTrueIsNotValid
	self
		assertInvalid: '[false,true,"foo","foo"]'
		description: 'non-unique array extended from [false, true] is not valid'