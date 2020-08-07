tests
testAnIPAddressWithout4Components
	self
		assertInvalid: '"127.0"'
		description: 'an IP address without 4 components'