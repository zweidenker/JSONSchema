tests
testBeginsWithASpacingCombiningMark
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.2"

	self
		assertInvalid: '"ःhello"'
		description: 'Begins with a Spacing Combining Mark'