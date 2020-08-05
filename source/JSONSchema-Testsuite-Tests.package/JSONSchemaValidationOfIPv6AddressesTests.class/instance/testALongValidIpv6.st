tests
testALongValidIpv6
	self
		assertValid: '"1000:1000:1000:1000:1000:1000:255.255.255.255"'
		description: 'a long valid ipv6'