tests
testAnIPAddressWithTooManyComponents
	self
		assertInvalid: '"127.0.0.0.1"'
		description: 'an IP address with too many components'