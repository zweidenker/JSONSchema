tests
testAnIPv6AddressContainingIllegalCharacters
	self
		assertInvalid: '"::laptop"'
		description: 'an IPv6 address containing illegal characters'