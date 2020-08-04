tests
testValidNestedArray
	self
		assertValid: '[[[[1]],[[2],[3]]],[[[4],[5],[6]]]]'
		description: 'valid nested array'