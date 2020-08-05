tests
testUniqueArrayOfObjectsIsValid
	self
		assertValid: '[{"foo":"bar"},{"foo":"baz"}]'
		description: 'unique array of objects is valid'