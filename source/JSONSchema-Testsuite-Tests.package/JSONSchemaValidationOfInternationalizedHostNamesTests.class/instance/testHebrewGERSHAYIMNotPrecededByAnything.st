tests
testHebrewGERSHAYIMNotPrecededByAnything
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.6"

	self
		assertInvalid: '"״ב"'
		description: 'Hebrew GERSHAYIM not preceded by anything'