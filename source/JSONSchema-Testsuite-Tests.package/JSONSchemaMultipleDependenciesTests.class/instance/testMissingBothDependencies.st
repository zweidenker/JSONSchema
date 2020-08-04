tests
testMissingBothDependencies
	self
		assertInvalid: '{"quux":1}'
		description: 'missing both dependencies'