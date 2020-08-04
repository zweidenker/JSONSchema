tests
testArrayWithoutItemsMatchingSchemaIsInvalid
	self
		assertInvalid: '[2,3,4]'
		description: 'array without items matching schema is invalid'