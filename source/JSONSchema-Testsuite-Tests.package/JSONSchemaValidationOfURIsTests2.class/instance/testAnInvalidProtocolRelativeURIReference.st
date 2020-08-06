tests
testAnInvalidProtocolRelativeURIReference
	self
		assertInvalid: '"//foo.bar/?baz=qux#quux"'
		description: 'an invalid protocol-relative URI Reference'