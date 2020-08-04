tests
testInvalidPunycode
	"https://tools.ietf.org/html/rfc5891#section-4.4 https://tools.ietf.org/html/rfc5890#section-2.3.2.1"

	self assertInvalid: '"xn--X"' description: 'invalid Punycode'