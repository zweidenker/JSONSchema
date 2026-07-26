Class {
	#name : 'JSONSchemaValidationOfURITemplatesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Format',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Format'
}

{ #category : 'testing' }
JSONSchemaValidationOfURITemplatesTests >> expectedFailures [
	^ #(#testIgnoresBooleans #testIgnoresObjects #testIgnoresFloats #testIgnoresNull #testIgnoresIntegers #testIgnoresArrays)
]

{ #category : 'accessing' }
JSONSchemaValidationOfURITemplatesTests >> schemaString [
	^ '{"format":"uri-template"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfURITemplatesTests >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaValidationOfURITemplatesTests >> testIgnoresBooleans [
	self assertValid: 'false' description: 'ignores booleans'
]

{ #category : 'tests' }
JSONSchemaValidationOfURITemplatesTests >> testIgnoresFloats [
	self assertValid: '13.7' description: 'ignores floats'
]

{ #category : 'tests' }
JSONSchemaValidationOfURITemplatesTests >> testIgnoresIntegers [
	self assertValid: '12' description: 'ignores integers'
]

{ #category : 'tests' }
JSONSchemaValidationOfURITemplatesTests >> testIgnoresNull [
	self assertValid: 'null' description: 'ignores null'
]

{ #category : 'tests' }
JSONSchemaValidationOfURITemplatesTests >> testIgnoresObjects [
	self assertValid: '{}' description: 'ignores objects'
]
