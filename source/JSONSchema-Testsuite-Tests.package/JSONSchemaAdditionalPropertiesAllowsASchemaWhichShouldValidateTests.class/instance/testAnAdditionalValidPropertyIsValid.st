tests
testAnAdditionalValidPropertyIsValid
	self
		assertValid: '{"quux":true,"foo":1,"bar":2}'
		description: 'an additional valid property is valid'