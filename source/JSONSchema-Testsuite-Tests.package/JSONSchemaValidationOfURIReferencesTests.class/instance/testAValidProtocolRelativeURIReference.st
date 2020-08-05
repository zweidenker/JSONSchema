tests
testAValidProtocolRelativeURIReference
	self
		assertValid: '"//foo.bar/?baz=qux#quux"'
		description: 'a valid protocol-relative URI Reference'