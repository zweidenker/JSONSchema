Class {
	#name : 'JSONSchemaValidationOfIPv6AddressesTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ipv6',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ipv6'
}

{ #category : 'accessing' }
JSONSchemaValidationOfIPv6AddressesTests2 >> schemaString [
	^ '{"format":"ipv6"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> test8Octets [
	self assertValid: '"1:2:3:4:5:6:7:8"' description: '8 octets'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testALongInvalidIpv6BelowLengthLimitFirst [
	self
		assertInvalid: '"100:100:100:100:100:100:255.255.255.255.255"'
		description: 'a long invalid ipv6, below length limit, first'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testALongInvalidIpv6BelowLengthLimitSecond [
	self
		assertInvalid: '"100:100:100:100:100:100:100:255.255.255.255"'
		description: 'a long invalid ipv6, below length limit, second'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testALongValidIpv6 [
	self
		assertValid: '"1000:1000:1000:1000:1000:1000:255.255.255.255"'
		description: 'a long valid ipv6'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testAValidIPv6Address [
	self assertValid: '"::1"' description: 'a valid IPv6 address'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testAnIPv6AddressContainingIllegalCharacters [
	self
		assertInvalid: '"::laptop"'
		description: 'an IPv6 address containing illegal characters'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testAnIPv6AddressWithOutOfRangeValues [
	self
		assertInvalid: '"12345::"'
		description: 'an IPv6 address with out-of-range values'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testAnIPv6AddressWithTooManyComponents [
	self
		assertInvalid: '"1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1"'
		description: 'an IPv6 address with too many components'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testInsufficientOctetsWithoutDoubleColons [
	self
		assertInvalid: '"1:2:3:4:5:6:7"'
		description: 'insufficient octets without double colons'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testIpv4IsNotIpv6 [
	self assertInvalid: '"127.0.0.1"' description: 'ipv4 is not ipv6'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testIpv4SegmentMustHave4Octets [
	self
		assertInvalid: '"1:2:3:4:1.2.3"'
		description: 'ipv4 segment must have 4 octets'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testLeadingColonsIsValid [
	self
		assertValid: '"::42:ff:1"'
		description: 'leading colons is valid'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testLeadingWhitespaceIsInvalid [
	self
		assertInvalid: '"  ::1"'
		description: 'leading whitespace is invalid'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testMissingLeadingOctetIsInvalid [
	self
		assertInvalid: '":2:3:4:5:6:7:8"'
		description: 'missing leading octet is invalid'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testMissingLeadingOctetWithOmittedOctetsLater [
	self
		assertInvalid: '":2:3:4::8"'
		description: 'missing leading octet with omitted octets later'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testMissingTrailingOctetIsInvalid [
	self
		assertInvalid: '"1:2:3:4:5:6:7:"'
		description: 'missing trailing octet is invalid'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testMixedFormatWithDoubleColonsBetweenTheSections [
	self
		assertValid: '"1:2::192.168.0.1"'
		description: 'mixed format with double colons between the sections'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testMixedFormatWithIpv4SectionWithAHexOctet [
	self
		assertInvalid: '"1::2:192.168.ff.1"'
		description: 'mixed format with ipv4 section with a hex octet'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testMixedFormatWithIpv4SectionWithOctetOutOfRange [
	self
		assertInvalid: '"1::2:192.168.256.1"'
		description: 'mixed format with ipv4 section with octet out of range'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testMixedFormatWithLeadingDoubleColonsIpv4MappedIpv6Address [
	self
		assertValid: '"::ffff:192.168.0.1"'
		description: 'mixed format with leading double colons (ipv4-mapped ipv6 address)'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testMixedFormatWithTheIpv4SectionAsDecimalOctets [
	self
		assertValid: '"1::d6:192.168.0.1"'
		description: 'mixed format with the ipv4 section as decimal octets'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testNetmaskIsNotAPartOfIpv6Address [
	self
		assertInvalid: '"fe80::/64"'
		description: 'netmask is not a part of ipv6 address'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testNoColonsIsInvalid [
	self assertInvalid: '"1"' description: 'no colons is invalid'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testNoDigitsIsValid [
	self assertValid: '"::"' description: 'no digits is valid'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testTrailingColonsIsValid [
	self assertValid: '"d6::"' description: 'trailing colons is valid'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testTrailingWhitespaceIsInvalid [
	self
		assertInvalid: '"::1  "'
		description: 'trailing whitespace is invalid'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testTripleColonsIsInvalid [
	self
		assertInvalid: '"1:2:3:4:5:::8"'
		description: 'triple colons is invalid'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testTwoSetsOfDoubleColonsIsInvalid [
	self
		assertInvalid: '"1::d6::42"'
		description: 'two sets of double colons is invalid'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests2 >> testZoneIdIsNotAPartOfIpv6Address [
	self
		assertInvalid: '"fe80::a%eth1"'
		description: 'zone id is not a part of ipv6 address'
]
