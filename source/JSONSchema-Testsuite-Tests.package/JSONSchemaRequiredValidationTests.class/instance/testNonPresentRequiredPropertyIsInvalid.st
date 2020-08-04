tests
testNonPresentRequiredPropertyIsInvalid
	self
		assertInvalid: '{"bar":1}'
		description: 'non-present required property is invalid'