tests
testArrayWithTwoItemsIsInvalid
	self
		assertInvalid: '[1,"foo"]'
		description: 'array with two items is invalid'