tests
testPatternPropertiesAreNotAdditionalProperties
	self
		assertValid: '{"vroom":2,"foo":1}'
		description: 'patternProperties are not additional properties'