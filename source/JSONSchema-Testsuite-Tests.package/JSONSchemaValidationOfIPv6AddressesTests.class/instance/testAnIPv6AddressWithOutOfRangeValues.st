tests
testAnIPv6AddressWithOutOfRangeValues
	self
		assertInvalid: '"12345::"'
		description: 'an IPv6 address with out-of-range values'