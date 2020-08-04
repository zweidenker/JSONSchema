tests
testAnIPv6AddressWithTooManyComponents
	self
		assertInvalid: '"1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1"'
		description: 'an IPv6 address with too many components'