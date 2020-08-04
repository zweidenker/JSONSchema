tests
testMixedFormatWithIpv4SectionWithAHexOctet
	self
		assertInvalid: '"1::2:192.168.ff.1"'
		description: 'mixed format with ipv4 section with a hex octet'