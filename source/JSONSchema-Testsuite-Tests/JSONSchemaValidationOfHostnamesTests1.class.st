Class {
	#name : 'JSONSchemaValidationOfHostnamesTests1',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Format',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Format'
}

{ #category : 'testing' }
JSONSchemaValidationOfHostnamesTests1 >> expectedFailures [
	^ #(#testIgnoresBooleans #testIgnoresObjects #testIgnoresFloats #testIgnoresNull #testIgnoresIntegers #testIgnoresArrays)
]

{ #category : 'accessing' }
JSONSchemaValidationOfHostnamesTests1 >> schemaString [
	^ '{"format":"hostname"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostnamesTests1 >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostnamesTests1 >> testIgnoresBooleans [
	self assertValid: 'false' description: 'ignores booleans'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostnamesTests1 >> testIgnoresFloats [
	self assertValid: '13.7' description: 'ignores floats'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostnamesTests1 >> testIgnoresIntegers [
	self assertValid: '12' description: 'ignores integers'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostnamesTests1 >> testIgnoresNull [
	self assertValid: 'null' description: 'ignores null'
]

{ #category : 'tests' }
JSONSchemaValidationOfHostnamesTests1 >> testIgnoresObjects [
	self assertValid: '{}' description: 'ignores objects'
]
