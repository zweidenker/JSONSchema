tests
testExtraItemsAreInvalidEvenIfUnique
	self
		assertInvalid: '[false,true,null]'
		description: 'extra items are invalid even if unique'