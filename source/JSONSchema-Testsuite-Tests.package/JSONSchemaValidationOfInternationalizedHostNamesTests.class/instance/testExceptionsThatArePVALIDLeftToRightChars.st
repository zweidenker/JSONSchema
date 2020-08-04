tests
testExceptionsThatArePVALIDLeftToRightChars
	"https://tools.ietf.org/html/rfc5891#section-4.2.2 https://tools.ietf.org/html/rfc5892#section-2.6"

	self
		assertValid: '"ßς་〇"'
		description: 'Exceptions that are PVALID, left-to-right chars'