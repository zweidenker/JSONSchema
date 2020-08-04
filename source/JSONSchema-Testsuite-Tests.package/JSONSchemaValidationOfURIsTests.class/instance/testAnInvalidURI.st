tests
testAnInvalidURI
	self
		assertInvalid: '"\\\\WINDOWS\\fileshare"'
		description: 'an invalid URI'