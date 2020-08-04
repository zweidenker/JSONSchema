tests
testUniqueArrayOfNestedObjectsIsValid
	self
		assertValid: '[{"foo":{"bar":{"baz":true}}},{"foo":{"bar":{"baz":false}}}]'
		description: 'unique array of nested objects is valid'