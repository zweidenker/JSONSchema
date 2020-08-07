tests
testTildeBeforeLocalPartIsValid
	self
		assertValid: '"~test@example.com"'
		description: 'tilde before local part is valid'