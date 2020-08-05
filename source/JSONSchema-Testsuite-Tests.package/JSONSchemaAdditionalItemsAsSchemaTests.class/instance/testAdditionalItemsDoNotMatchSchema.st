tests
testAdditionalItemsDoNotMatchSchema
	self
		assertInvalid: '[null,2,3,"foo"]'
		description: 'additional items do not match schema'