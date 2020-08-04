tests
testAnInvalidIdnEMailAddress
	self
		assertInvalid: '"2962"'
		description: 'an invalid idn e-mail address'