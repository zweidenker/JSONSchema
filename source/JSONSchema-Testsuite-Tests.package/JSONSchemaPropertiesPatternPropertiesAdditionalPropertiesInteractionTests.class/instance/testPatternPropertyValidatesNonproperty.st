tests
testPatternPropertyValidatesNonproperty
	self
		assertValid: '{"fxo":[1,2]}'
		description: 'patternProperty validates nonproperty'