tests
testAValidURLForASimpleTextFile
	self
		assertValid: '"http://www.ietf.org/rfc/rfc2396.txt"'
		description: 'a valid URL for a simple text file'