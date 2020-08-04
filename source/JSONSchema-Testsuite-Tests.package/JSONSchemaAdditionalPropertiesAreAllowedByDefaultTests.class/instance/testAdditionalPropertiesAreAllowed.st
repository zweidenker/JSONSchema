tests
testAdditionalPropertiesAreAllowed
	self
		assertValid: '{"quux":true,"foo":1,"bar":2}'
		description: 'additional properties are allowed'