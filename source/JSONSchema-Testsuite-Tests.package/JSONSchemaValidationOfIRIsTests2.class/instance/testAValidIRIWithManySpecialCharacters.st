tests
testAValidIRIWithManySpecialCharacters
	self
		assertValid: '"http://-.~_!$&''()*+,;=:%40:80%2f::::::@example.com"'
		description: 'a valid IRI with many special characters'