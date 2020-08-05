tests
testItemsDefinedInAllOfAreNotExamined
	self
		assertInvalid: '[1,"hello"]'
		description: 'items defined in allOf are not examined'