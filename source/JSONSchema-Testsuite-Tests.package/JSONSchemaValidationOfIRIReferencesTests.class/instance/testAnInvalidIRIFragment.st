tests
testAnInvalidIRIFragment
	self
		assertInvalid: '"#ƒräg\\mênt"'
		description: 'an invalid IRI fragment'