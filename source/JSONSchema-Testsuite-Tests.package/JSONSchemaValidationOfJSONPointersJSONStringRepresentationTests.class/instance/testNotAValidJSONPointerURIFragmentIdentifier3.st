tests
testNotAValidJSONPointerURIFragmentIdentifier3
	self
		assertInvalid: '"#a"'
		description: 'not a valid JSON-pointer (URI Fragment Identifier) #3'