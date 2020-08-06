tests
testMissingLeadingOctetIsInvalid
	self
		assertInvalid: '":2:3:4:5:6:7:8"'
		description: 'missing leading octet is invalid'