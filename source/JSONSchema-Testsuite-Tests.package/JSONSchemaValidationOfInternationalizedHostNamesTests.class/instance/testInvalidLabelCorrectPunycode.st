tests
testInvalidLabelCorrectPunycode
	"https://tools.ietf.org/html/rfc5890#section-2.3.2.1 https://tools.ietf.org/html/rfc5891#section-4.4 https://tools.ietf.org/html/rfc3492#section-7.1"

	self
		assertInvalid: '"-> $1.00 <--"'
		description: 'invalid label, correct Punycode'