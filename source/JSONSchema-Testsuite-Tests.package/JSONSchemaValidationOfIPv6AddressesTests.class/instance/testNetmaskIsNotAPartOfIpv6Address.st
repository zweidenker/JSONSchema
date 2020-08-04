tests
testNetmaskIsNotAPartOfIpv6Address
	self
		assertInvalid: '"fe80::/64"'
		description: 'netmask is not a part of ipv6 address'