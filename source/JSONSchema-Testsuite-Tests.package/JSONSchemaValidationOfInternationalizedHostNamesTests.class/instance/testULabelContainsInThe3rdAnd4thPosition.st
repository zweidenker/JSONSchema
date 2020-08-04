tests
testULabelContainsInThe3rdAnd4thPosition
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.1 https://tools.ietf.org/html/rfc5890#section-2.3.2.1"

	self
		assertInvalid: '"XN--aa---o47jg78q"'
		description: 'U-label contains "--" in the 3rd and 4th position'