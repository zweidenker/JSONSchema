tests
testMixedFormatWithIpv4SectionWithOctetOutOfRange
	self
		assertInvalid: '"1::2:192.168.256.1"'
		description: 'mixed format with ipv4 section with octet out of range'