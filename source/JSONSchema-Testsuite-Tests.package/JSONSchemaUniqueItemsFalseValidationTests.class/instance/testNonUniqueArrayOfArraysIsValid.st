tests
testNonUniqueArrayOfArraysIsValid
	self
		assertValid: '[["foo"],["foo"]]'
		description: 'non-unique array of arrays is valid'