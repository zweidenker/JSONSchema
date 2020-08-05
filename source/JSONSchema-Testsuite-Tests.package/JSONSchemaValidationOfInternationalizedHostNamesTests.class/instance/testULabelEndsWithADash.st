tests
testULabelEndsWithADash
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.1"

	self
		assertInvalid: '"hello-"'
		description: 'U-label ends with a dash'