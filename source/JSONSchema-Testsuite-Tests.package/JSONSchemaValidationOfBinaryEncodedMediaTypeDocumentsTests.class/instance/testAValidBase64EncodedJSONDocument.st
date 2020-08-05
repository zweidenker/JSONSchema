tests
testAValidBase64EncodedJSONDocument
	self
		assertValid: '"eyJmb28iOiAiYmFyIn0K"'
		description: 'a valid base64-encoded JSON document'