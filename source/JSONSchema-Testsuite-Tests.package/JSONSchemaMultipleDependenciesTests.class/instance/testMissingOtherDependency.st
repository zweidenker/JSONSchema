tests
testMissingOtherDependency
	self
		assertInvalid: '{"quux":2,"bar":1}'
		description: 'missing other dependency'