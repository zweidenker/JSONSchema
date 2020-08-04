tests
testRecursiveMatch
	self
		assertValid: '{"foo":{"foo":false}}'
		description: 'recursive match'