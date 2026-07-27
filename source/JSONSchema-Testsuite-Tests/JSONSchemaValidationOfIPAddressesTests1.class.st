Class {
	#name : 'JSONSchemaValidationOfIPAddressesTests1',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Format',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Format'
}

{ #category : 'accessing' }
JSONSchemaValidationOfIPAddressesTests1 >> schemaString [
	^ '{"format":"ipv4"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPAddressesTests1 >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPAddressesTests1 >> testIgnoresBooleans [
	self assertValid: 'false' description: 'ignores booleans'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPAddressesTests1 >> testIgnoresFloats [
	self assertValid: '13.7' description: 'ignores floats'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPAddressesTests1 >> testIgnoresIntegers [
	self assertValid: '12' description: 'ignores integers'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPAddressesTests1 >> testIgnoresNull [
	self assertValid: 'null' description: 'ignores null'
]

{ #category : 'tests' }
JSONSchemaValidationOfIPAddressesTests1 >> testIgnoresObjects [
	self assertValid: '{}' description: 'ignores objects'
]
