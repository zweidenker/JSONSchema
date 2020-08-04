tests
testZEROWIDTHNONJOINERPrecededByVirama
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.1"

	self
		assertValid: '"क्‌ष"'
		description: 'ZERO WIDTH NON-JOINER preceded by Virama'