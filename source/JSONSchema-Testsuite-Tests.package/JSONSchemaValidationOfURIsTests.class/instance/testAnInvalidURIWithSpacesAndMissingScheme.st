tests
testAnInvalidURIWithSpacesAndMissingScheme
	self
		assertInvalid: '":// should fail"'
		description: 'an invalid URI with spaces and missing scheme'