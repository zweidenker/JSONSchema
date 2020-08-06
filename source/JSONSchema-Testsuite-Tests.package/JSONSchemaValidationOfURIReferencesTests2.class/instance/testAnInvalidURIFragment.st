tests
testAnInvalidURIFragment
	self
		assertInvalid: '"#frag\\ment"'
		description: 'an invalid URI fragment'