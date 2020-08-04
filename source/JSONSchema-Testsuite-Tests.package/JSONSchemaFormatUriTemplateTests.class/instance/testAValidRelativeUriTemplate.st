tests
testAValidRelativeUriTemplate
	self
		assertValid: '"dictionary/{term:1}/{term}"'
		description: 'a valid relative uri-template'