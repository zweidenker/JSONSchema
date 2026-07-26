Class {
	#name : 'JSONSchemaValidationOfHostNamesTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Hostname',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Hostname'
}

{ #category : 'testing' }
JSONSchemaValidationOfHostNamesTests2 >> expectedFailures [
	^ #(#testAHostNameContainingIllegalCharacters #testEndsWithHyphen #testMaximumLabelLength #testAHostNameStartingWithAnIllegalCharacter #testAValidHostName #testContainsUnderscore #testStartsWithHyphen #testStartsWithUnderscore #testAValidPunycodedIDNHostname #testExceedsMaximumLabelLength #testEndsWithUnderscore #testAHostNameWithAComponentTooLong)
]

{ #category : 'accessing' }
JSONSchemaValidationOfHostNamesTests2 >> schemaString [
	^ '{"format":"hostname"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostNamesTests2 >> testAHostNameContainingIllegalCharacters [
	self
		assertInvalid: '"not_a_valid_host_name"'
		description: 'a host name containing illegal characters'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostNamesTests2 >> testAHostNameStartingWithAnIllegalCharacter [
	self
		assertInvalid: '"-a-host-name-that-starts-with--"'
		description: 'a host name starting with an illegal character'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostNamesTests2 >> testAHostNameWithAComponentTooLong [
	self
		assertInvalid:
			'"a-vvvvvvvvvvvvvvvveeeeeeeeeeeeeeeerrrrrrrrrrrrrrrryyyyyyyyyyyyyyyy-long-host-name-component"'
		description: 'a host name with a component too long'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostNamesTests2 >> testAValidHostName [
	self
		assertValid: '"www.example.com"'
		description: 'a valid host name'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostNamesTests2 >> testAValidPunycodedIDNHostname [
	self
		assertValid: '"xn--4gbwdl.xn--wgbh1c"'
		description: 'a valid punycoded IDN hostname'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostNamesTests2 >> testContainsUnderscore [
	self assertInvalid: '"host_name"' description: 'contains underscore'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostNamesTests2 >> testEndsWithHyphen [
	self assertInvalid: '"hostname-"' description: 'ends with hyphen'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostNamesTests2 >> testEndsWithUnderscore [
	self assertInvalid: '"hostname_"' description: 'ends with underscore'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostNamesTests2 >> testExceedsMaximumLabelLength [
	self
		assertInvalid:
			'"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijkl.com"'
		description: 'exceeds maximum label length'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostNamesTests2 >> testMaximumLabelLength [
	self
		assertValid:
			'"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijk.com"'
		description: 'maximum label length'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostNamesTests2 >> testStartsWithHyphen [
	self assertInvalid: '"-hostname"' description: 'starts with hyphen'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostNamesTests2 >> testStartsWithUnderscore [
	self
		assertInvalid: '"_hostname"'
		description: 'starts with underscore'
]
