tests
testExceptionsThatArePVALIDRightToLeftChars
	"https://tools.ietf.org/html/rfc/rfc5891#section-4.2.2 https://tools.ietf.org/html/rfc5892#section-2.6"

	self
		assertValid: '"۽۾"'
		description: 'Exceptions that are PVALID, right-to-left chars'