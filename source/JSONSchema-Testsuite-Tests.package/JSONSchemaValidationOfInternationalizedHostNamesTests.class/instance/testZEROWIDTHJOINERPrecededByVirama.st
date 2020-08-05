tests
testZEROWIDTHJOINERPrecededByVirama
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.2 https://www.unicode.org/review/pr-37.pdf"

	self
		assertValid: '"क्‍ष"'
		description: 'ZERO WIDTH JOINER preceded by Virama'