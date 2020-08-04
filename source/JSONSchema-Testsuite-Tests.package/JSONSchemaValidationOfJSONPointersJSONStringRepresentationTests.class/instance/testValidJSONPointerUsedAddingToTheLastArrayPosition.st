tests
testValidJSONPointerUsedAddingToTheLastArrayPosition
	self
		assertValid: '"/foo/-"'
		description: 'valid JSON-pointer used adding to the last array position'