tests
testHebrewGERESHPrecededByHebrew
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.5"

	self
		assertValid: '"א׳ב"'
		description: 'Hebrew GERESH preceded by Hebrew'