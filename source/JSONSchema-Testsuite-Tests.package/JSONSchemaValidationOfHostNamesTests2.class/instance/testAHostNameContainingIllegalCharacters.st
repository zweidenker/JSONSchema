tests
testAHostNameContainingIllegalCharacters
	self
		assertInvalid: '"not_a_valid_host_name"'
		description: 'a host name containing illegal characters'