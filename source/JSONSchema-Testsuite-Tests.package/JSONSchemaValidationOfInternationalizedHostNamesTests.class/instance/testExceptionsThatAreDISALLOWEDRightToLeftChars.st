tests
testExceptionsThatAreDISALLOWEDRightToLeftChars
	"https://tools.ietf.org/html/rfc5891#section-4.2.2 https://tools.ietf.org/html/rfc5892#section-2.6"

	self
		assertInvalid: '"ـߺ"'
		description: 'Exceptions that are DISALLOWED, right-to-left chars'