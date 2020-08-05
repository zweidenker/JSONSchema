tests
testMissingDependency
	self
		assertInvalid: '{"quux":2,"foo":1}'
		description: 'missing dependency'