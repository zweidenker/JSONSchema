tests
testNonUniqueArrayOfObjectsIsValid
	self
		assertValid: '[{"foo":"bar"},{"foo":"bar"}]'
		description: 'non-unique array of objects is valid'