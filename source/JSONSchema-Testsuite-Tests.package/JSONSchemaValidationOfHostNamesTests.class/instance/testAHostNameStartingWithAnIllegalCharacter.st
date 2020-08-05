tests
testAHostNameStartingWithAnIllegalCharacter
	self
		assertInvalid: '"-a-host-name-that-starts-with--"'
		description: 'a host name starting with an illegal character'