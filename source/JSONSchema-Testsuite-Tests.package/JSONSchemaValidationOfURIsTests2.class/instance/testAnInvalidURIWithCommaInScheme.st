tests
testAnInvalidURIWithCommaInScheme
	self
		assertInvalid: '"bar,baz:foo"'
		description: 'an invalid URI with comma in scheme'