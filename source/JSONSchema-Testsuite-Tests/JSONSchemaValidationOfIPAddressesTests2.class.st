Class {
	#name : 'JSONSchemaValidationOfIPAddressesTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ipv4',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ipv4'
}

{ #category : 'accessing' }
JSONSchemaValidationOfIPAddressesTests2 >> schemaString [
	^ '{"format":"ipv4"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPAddressesTests2 >> testAValidIPAddress [
	self assertValid: '"192.168.0.1"' description: 'a valid IP address'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPAddressesTests2 >> testAnIPAddressAsAnInteger [
	self
		assertInvalid: '"0x7f000001"'
		description: 'an IP address as an integer'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPAddressesTests2 >> testAnIPAddressAsAnIntegerDecimal [
	self
		assertInvalid: '"2130706433"'
		description: 'an IP address as an integer (decimal)'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPAddressesTests2 >> testAnIPAddressWithOutOfRangeValues [
	self
		assertInvalid: '"256.256.256.256"'
		description: 'an IP address with out-of-range values'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPAddressesTests2 >> testAnIPAddressWithTooManyComponents [
	self
		assertInvalid: '"127.0.0.0.1"'
		description: 'an IP address with too many components'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPAddressesTests2 >> testAnIPAddressWithout4Components [
	self
		assertInvalid: '"127.0"'
		description: 'an IP address without 4 components'
]
