tests
testMismatchSecondAllOf
	self
		assertInvalid: '{"foo":"quux","bar":2}'
		description: 'mismatch second allOf'