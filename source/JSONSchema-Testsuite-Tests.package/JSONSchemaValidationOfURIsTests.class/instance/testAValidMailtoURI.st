tests
testAValidMailtoURI
	self
		assertValid: '"mailto:John.Doe@example.com"'
		description: 'a valid mailto URI'