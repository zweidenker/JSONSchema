tests
testMixedFormatWithTheIpv4SectionAsDecimalOctets
	self
		assertValid: '"1::d6:192.168.0.1"'
		description: 'mixed format with the ipv4 section as decimal octets'