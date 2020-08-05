tests
testSameObjectIsValid
	self
		assertValid: '{"foo":"bar","baz":"bax"}'
		description: 'same object is valid'