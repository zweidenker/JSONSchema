tests
testAnInvalidURIWithSpaces
	self
		assertInvalid: '"http:// shouldfail.com"'
		description: 'an invalid URI with spaces'