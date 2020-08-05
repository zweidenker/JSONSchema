tests
testMismatchFirstAllOf
	self
		assertInvalid: '{"bar":2,"baz":null}'
		description: 'mismatch first allOf'