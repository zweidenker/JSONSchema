tests
testAValidURI
	self
		assertValid: '"http://foo.bar/?baz=qux#quux"'
		description: 'a valid URI'