tests
testAnInvalidUriTemplate
	self
		assertInvalid: '"http://example.com/dictionary/{term:1}/{term"'
		description: 'an invalid uri-template'