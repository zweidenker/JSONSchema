tests
testPatternPropertyInvalidatesProperty
	self
		assertInvalid: '{"foo":[]}'
		description: 'patternProperty invalidates property'