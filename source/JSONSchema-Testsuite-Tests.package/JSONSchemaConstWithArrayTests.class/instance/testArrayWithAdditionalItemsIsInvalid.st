tests
testArrayWithAdditionalItemsIsInvalid
	self
		assertInvalid: '[1,2,3]'
		description: 'array with additional items is invalid'