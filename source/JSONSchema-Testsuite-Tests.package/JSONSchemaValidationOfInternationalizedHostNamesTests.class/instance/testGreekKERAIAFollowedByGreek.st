tests
testGreekKERAIAFollowedByGreek
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.4"

	self
		assertValid: '"α͵β"'
		description: 'Greek KERAIA followed by Greek'