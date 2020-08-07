tests
testAValidURLBasedOnIPv4
	self
		assertValid: '"http://223.255.255.254"'
		description: 'a valid URL based on IPv4'