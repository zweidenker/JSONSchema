tests
testAnInvalidURIReference
	self
		assertInvalid: '"\\\\WINDOWS\\fileshare"'
		description: 'an invalid URI Reference'