tests
testAdditionalItemsAreNotPermitted
	self
		assertInvalid: '[1,2,3,4]'
		description: 'additional items are not permitted'