tests
testNonUniqueArrayOfObjectsIsInvalid
	self
		assertInvalid: '[{"foo":"bar"},{"foo":"bar"}]'
		description: 'non-unique array of objects is invalid'