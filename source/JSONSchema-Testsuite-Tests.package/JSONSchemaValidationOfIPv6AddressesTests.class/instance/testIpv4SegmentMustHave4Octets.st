tests
testIpv4SegmentMustHave4Octets
	self
		assertInvalid: '"1:2:3:4:1.2.3"'
		description: 'ipv4 segment must have 4 octets'