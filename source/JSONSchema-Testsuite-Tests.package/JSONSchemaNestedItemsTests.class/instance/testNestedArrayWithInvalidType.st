tests
testNestedArrayWithInvalidType
	self
		assertInvalid: '[[[["1"]],[[2],[3]]],[[[4],[5],[6]]]]'
		description: 'nested array with invalid type'