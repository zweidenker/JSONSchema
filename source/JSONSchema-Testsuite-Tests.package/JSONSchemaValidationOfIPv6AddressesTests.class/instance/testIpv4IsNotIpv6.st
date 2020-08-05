tests
testIpv4IsNotIpv6
	self assertInvalid: '"127.0.0.1"' description: 'ipv4 is not ipv6'