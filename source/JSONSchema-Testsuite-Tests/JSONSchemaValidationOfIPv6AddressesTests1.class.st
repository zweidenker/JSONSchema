Class {
	#name : 'JSONSchemaValidationOfIPv6AddressesTests1',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Format',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Format'
}

{ #category : 'testing' }
JSONSchemaValidationOfIPv6AddressesTests1 >> expectedFailures [
	^ #(#testIgnoresArrays #testIgnoresBooleans #testIgnoresFloats #testIgnoresNull #testIgnoresIntegers #testIgnoresObjects)
]

{ #category : 'accessing' }
JSONSchemaValidationOfIPv6AddressesTests1 >> schemaString [
	^ '{"format":"ipv6"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests1 >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests1 >> testIgnoresBooleans [
	self assertValid: 'false' description: 'ignores booleans'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests1 >> testIgnoresFloats [
	self assertValid: '13.7' description: 'ignores floats'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests1 >> testIgnoresIntegers [
	self assertValid: '12' description: 'ignores integers'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests1 >> testIgnoresNull [
	self assertValid: 'null' description: 'ignores null'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPv6AddressesTests1 >> testIgnoresObjects [
	self assertValid: '{}' description: 'ignores objects'
]
