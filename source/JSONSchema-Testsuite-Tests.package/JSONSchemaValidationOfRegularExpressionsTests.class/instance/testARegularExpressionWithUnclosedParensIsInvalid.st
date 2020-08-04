tests
testARegularExpressionWithUnclosedParensIsInvalid
	self
		assertInvalid: '"^(abc]"'
		description: 'a regular expression with unclosed parens is invalid'