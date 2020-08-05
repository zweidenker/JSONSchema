tests
testMissingLeadingOctetWithOmittedOctetsLater
	self
		assertInvalid: '":2:3:4::8"'
		description: 'missing leading octet with omitted octets later'