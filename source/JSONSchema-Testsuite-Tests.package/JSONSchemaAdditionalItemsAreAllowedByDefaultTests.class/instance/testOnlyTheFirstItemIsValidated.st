tests
testOnlyTheFirstItemIsValidated
	self
		assertValid: '[1,"foo",false]'
		description: 'only the first item is validated'