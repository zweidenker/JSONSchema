tests
testTwoSubsequentDotsInsideLocalPartAreNotValid
	self
		assertInvalid: '"te..st@example.com"'
		description: 'two subsequent dots inside local part are not valid'