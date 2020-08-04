tests
testNonUniqueArrayOfIntegersIsValid
	self
		assertValid: '[1,1]'
		description: 'non-unique array of integers is valid'