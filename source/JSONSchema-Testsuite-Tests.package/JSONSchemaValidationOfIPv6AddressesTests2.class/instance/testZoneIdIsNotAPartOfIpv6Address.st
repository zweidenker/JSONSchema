tests
testZoneIdIsNotAPartOfIpv6Address
	self
		assertInvalid: '"fe80::a%eth1"'
		description: 'zone id is not a part of ipv6 address'