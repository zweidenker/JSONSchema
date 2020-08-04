tests
testAValidRegularExpression
	self
		assertValid: '"([abc])+\\s+$"'
		description: 'a valid regular expression'