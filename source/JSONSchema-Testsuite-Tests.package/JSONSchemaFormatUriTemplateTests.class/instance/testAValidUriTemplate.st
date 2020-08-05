tests
testAValidUriTemplate
	self
		assertValid: '"http://example.com/dictionary/{term:1}/{term}"'
		description: 'a valid uri-template'