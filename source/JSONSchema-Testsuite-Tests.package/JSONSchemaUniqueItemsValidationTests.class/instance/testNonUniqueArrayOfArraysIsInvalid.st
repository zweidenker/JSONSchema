tests
testNonUniqueArrayOfArraysIsInvalid
	self
		assertInvalid: '[["foo"],["foo"]]'
		description: 'non-unique array of arrays is invalid'