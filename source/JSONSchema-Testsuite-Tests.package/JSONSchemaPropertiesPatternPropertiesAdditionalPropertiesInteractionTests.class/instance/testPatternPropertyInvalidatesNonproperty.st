tests
testPatternPropertyInvalidatesNonproperty
	self
		assertInvalid: '{"fxo":[]}'
		description: 'patternProperty invalidates nonproperty'