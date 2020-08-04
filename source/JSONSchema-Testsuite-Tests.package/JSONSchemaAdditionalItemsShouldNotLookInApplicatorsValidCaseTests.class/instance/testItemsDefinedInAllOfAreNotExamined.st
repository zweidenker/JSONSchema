tests
testItemsDefinedInAllOfAreNotExamined
	self
		assertValid: '[1,null]'
		description: 'items defined in allOf are not examined'