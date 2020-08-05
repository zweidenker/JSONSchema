tests
testNonUniqueArrayOfNestedObjectsIsInvalid
	self
		assertInvalid: '[{"foo":{"bar":{"baz":true}}},{"foo":{"bar":{"baz":true}}}]'
		description: 'non-unique array of nested objects is invalid'