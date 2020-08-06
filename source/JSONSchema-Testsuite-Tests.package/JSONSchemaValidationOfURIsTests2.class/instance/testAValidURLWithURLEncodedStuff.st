tests
testAValidURLWithURLEncodedStuff
	self
		assertValid: '"http://foo.bar/?q=Test%20URL-encoded%20stuff"'
		description: 'a valid URL with URL-encoded stuff'