tests
testValidChinesePunycode
	"https://tools.ietf.org/html/rfc5890#section-2.3.2.1 https://tools.ietf.org/html/rfc5891#section-4.4"

	self
		assertValid: '"xn--ihqwcrb4cv8a8dqg056pqjye"'
		description: 'valid Chinese Punycode'