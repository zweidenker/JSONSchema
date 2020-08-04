tests
testNonUniqueArrayOfIntegersIsInvalid
	self
		assertInvalid: '[1,1]'
		description: 'non-unique array of integers is invalid'