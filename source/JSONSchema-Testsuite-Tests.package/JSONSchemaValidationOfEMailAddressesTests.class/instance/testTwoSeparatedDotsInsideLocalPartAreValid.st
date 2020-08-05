tests
testTwoSeparatedDotsInsideLocalPartAreValid
	self
		assertValid: '"te.s.t@example.com"'
		description: 'two separated dots inside local part are valid'