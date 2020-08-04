tests
testRemoteRefInvalid
	self
		assertInvalid: '{"minLength":-1}'
		description: 'remote ref invalid'