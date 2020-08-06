tests
testALongInvalidIpv6BelowLengthLimitSecond
	self
		assertInvalid: '"100:100:100:100:100:100:100:255.255.255.255"'
		description: 'a long invalid ipv6, below length limit, second'