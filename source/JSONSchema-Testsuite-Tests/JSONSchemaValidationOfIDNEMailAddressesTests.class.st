Class {
	#name : 'JSONSchemaValidationOfIDNEMailAddressesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Format',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Format'
}

{ #category : 'accessing' }
JSONSchemaValidationOfIDNEMailAddressesTests >> schemaString [
	^ '{"format":"idn-email"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfIDNEMailAddressesTests >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaValidationOfIDNEMailAddressesTests >> testIgnoresBooleans [
	self assertValid: 'false' description: 'ignores booleans'
]

{ #category : 'tests' }
JSONSchemaValidationOfIDNEMailAddressesTests >> testIgnoresFloats [
	self assertValid: '13.7' description: 'ignores floats'
]

{ #category : 'tests' }
JSONSchemaValidationOfIDNEMailAddressesTests >> testIgnoresIntegers [
	self assertValid: '12' description: 'ignores integers'
]

{ #category : 'tests' }
JSONSchemaValidationOfIDNEMailAddressesTests >> testIgnoresNull [
	self assertValid: 'null' description: 'ignores null'
]

{ #category : 'tests' }
JSONSchemaValidationOfIDNEMailAddressesTests >> testIgnoresObjects [
	self assertValid: '{}' description: 'ignores objects'
]
