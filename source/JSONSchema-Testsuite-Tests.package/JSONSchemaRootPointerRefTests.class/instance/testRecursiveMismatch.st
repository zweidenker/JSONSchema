tests
testRecursiveMismatch
	self
		assertInvalid: '{"foo":{"bar":false}}'
		description: 'recursive mismatch'