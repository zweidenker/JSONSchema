tests
testAValidUriTemplateWithoutVariables
	self
		assertValid: '"http://example.com/dictionary"'
		description: 'a valid uri-template without variables'