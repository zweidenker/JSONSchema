Class {
	#name : 'JSONSchemaValidationOfIDNHostnamesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Format',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Format'
}

{ #category : 'testing' }
JSONSchemaValidationOfIDNHostnamesTests >> expectedFailures [
	^ #(#testIgnoresObjects #testIgnoresBooleans #testIgnoresNull #testIgnoresFloats #testIgnoresIntegers #testIgnoresArrays)
]

{ #category : 'accessing' }
JSONSchemaValidationOfIDNHostnamesTests >> schemaString [
	^ '{"format":"idn-hostname"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfIDNHostnamesTests >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaValidationOfIDNHostnamesTests >> testIgnoresBooleans [
	self assertValid: 'false' description: 'ignores booleans'
]

{ #category : 'tests' }
JSONSchemaValidationOfIDNHostnamesTests >> testIgnoresFloats [
	self assertValid: '13.7' description: 'ignores floats'
]

{ #category : 'tests' }
JSONSchemaValidationOfIDNHostnamesTests >> testIgnoresIntegers [
	self assertValid: '12' description: 'ignores integers'
]

{ #category : 'tests' }
JSONSchemaValidationOfIDNHostnamesTests >> testIgnoresNull [
	self assertValid: 'null' description: 'ignores null'
]

{ #category : 'tests' }
JSONSchemaValidationOfIDNHostnamesTests >> testIgnoresObjects [
	self assertValid: '{}' description: 'ignores objects'
]
