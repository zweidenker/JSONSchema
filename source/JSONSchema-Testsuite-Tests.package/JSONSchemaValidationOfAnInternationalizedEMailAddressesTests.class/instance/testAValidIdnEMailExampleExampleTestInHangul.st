tests
testAValidIdnEMailExampleExampleTestInHangul
	self
		assertValid: '"실례@실례.테스트"'
		description: 'a valid idn e-mail (example@example.test in Hangul)'