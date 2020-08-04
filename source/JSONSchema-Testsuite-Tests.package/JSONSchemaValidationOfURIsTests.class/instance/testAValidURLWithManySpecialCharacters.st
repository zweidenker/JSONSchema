tests
testAValidURLWithManySpecialCharacters
	self
		assertValid: '"http://-.~_!$&''()*+,;=:%40:80%2f::::::@example.com"'
		description: 'a valid URL with many special characters'