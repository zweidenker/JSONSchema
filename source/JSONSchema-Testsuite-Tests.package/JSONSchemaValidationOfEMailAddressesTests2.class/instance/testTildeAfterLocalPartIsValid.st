tests
testTildeAfterLocalPartIsValid
	self
		assertValid: '"test~@example.com"'
		description: 'tilde after local part is valid'