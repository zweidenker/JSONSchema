tests
testNotAValidJSONPointerURIFragmentIdentifier1
	self
		assertInvalid: '"#"'
		description: 'not a valid JSON-pointer (URI Fragment Identifier) #1'