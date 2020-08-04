tests
testNested0AndFalseAreUnique
	self
		assertValid: '[[[0],"foo"],[[false],"foo"]]'
		description: 'nested [0] and [false] are unique'