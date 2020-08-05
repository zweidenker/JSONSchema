tests
testSameObjectWithDifferentPropertyOrderIsValid
	self
		assertValid: '{"foo":"bar","baz":"bax"}'
		description: 'same object with different property order is valid'