tests
testObjectsAreNonUniqueDespiteKeyOrder
	self
		assertInvalid: '[{"a":1,"b":2},{"b":2,"a":1}]'
		description: 'objects are non-unique despite key order'