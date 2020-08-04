tests
testExtendedArabicIndicDigitsNotMixedWithArabicIndicDigits
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.9"

	self
		assertValid: '"۰0"'
		description: 'Extended Arabic-Indic digits not mixed with Arabic-Indic digits'