tests
testAValidJSONDocument
	self
		assertValid: '"{\"foo\": \"bar\"}"'
		description: 'a valid JSON document'