tests
testAValidEMailAddress
	self
		assertValid: '"joe.bloggs@example.com"'
		description: 'a valid e-mail address'