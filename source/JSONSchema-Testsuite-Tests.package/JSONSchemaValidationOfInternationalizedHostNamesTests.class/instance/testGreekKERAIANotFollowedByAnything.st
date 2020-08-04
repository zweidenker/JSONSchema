tests
testGreekKERAIANotFollowedByAnything
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.4"

	self
		assertInvalid: '"α͵"'
		description: 'Greek KERAIA not followed by anything'