tests
testBothOneOfValid
	self
		assertInvalid: '{"foo":"foo","bar":8}'
		description: 'both oneOf valid'