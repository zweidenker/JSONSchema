tests
testNested1AndTrueAreUnique
	self
		assertValid: '[[[1],"foo"],[[true],"foo"]]'
		description: 'nested [1] and [true] are unique'