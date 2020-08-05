tests
testNotAValidJSONPointerURIFragmentIdentifier2
	self
		assertInvalid: '"#/"'
		description: 'not a valid JSON-pointer (URI Fragment Identifier) #2'