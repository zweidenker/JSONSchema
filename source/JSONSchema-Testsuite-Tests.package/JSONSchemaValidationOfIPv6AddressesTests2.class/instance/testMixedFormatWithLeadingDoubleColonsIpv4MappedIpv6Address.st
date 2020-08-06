tests
testMixedFormatWithLeadingDoubleColonsIpv4MappedIpv6Address
	self
		assertValid: '"::ffff:192.168.0.1"'
		description: 'mixed format with leading double colons (ipv4-mapped ipv6 address)'