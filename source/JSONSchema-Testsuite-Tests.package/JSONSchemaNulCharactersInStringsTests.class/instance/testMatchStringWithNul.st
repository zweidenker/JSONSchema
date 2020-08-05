tests
testMatchStringWithNul
	self
		assertValid: '"hello\u0000there"'
		description: 'match string with nul'