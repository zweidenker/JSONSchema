tests
testOnlyFalsePropertyPresentIsInvalid
	self
		assertInvalid: '{"bar":2}'
		description: 'only ''false'' property present is invalid'