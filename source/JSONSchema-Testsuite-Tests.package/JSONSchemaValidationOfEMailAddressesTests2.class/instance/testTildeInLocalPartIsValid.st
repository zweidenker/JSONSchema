tests
testTildeInLocalPartIsValid
	self
		assertValid: '"te~st@example.com"'
		description: 'tilde in local part is valid'