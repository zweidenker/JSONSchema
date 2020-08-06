tests
testAValidURLWithAnchorTag
	self
		assertValid: '"http://foo.bar/?baz=qux#quux"'
		description: 'a valid URL with anchor tag'