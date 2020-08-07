tests
testAnIPAddressAsAnInteger
	self
		assertInvalid: '"0x7f000001"'
		description: 'an IP address as an integer'