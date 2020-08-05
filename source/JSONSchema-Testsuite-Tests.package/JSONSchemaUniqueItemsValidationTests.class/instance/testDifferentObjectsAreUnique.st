tests
testDifferentObjectsAreUnique
	self
		assertValid: '[{"a":1,"b":2},{"a":2,"b":1}]'
		description: 'different objects are unique'