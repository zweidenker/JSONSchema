Class {
	#name : 'JSONSchemaValidationOfRegexesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Format',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Format'
}

{ #category : 'accessing' }
JSONSchemaValidationOfRegexesTests >> schemaString [
	^ '{"format":"regex"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfRegexesTests >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaValidationOfRegexesTests >> testIgnoresBooleans [
	self assertValid: 'false' description: 'ignores booleans'
]

{ #category : 'tests' }
JSONSchemaValidationOfRegexesTests >> testIgnoresFloats [
	self assertValid: '13.7' description: 'ignores floats'
]

{ #category : 'tests' }
JSONSchemaValidationOfRegexesTests >> testIgnoresIntegers [
	self assertValid: '12' description: 'ignores integers'
]

{ #category : 'tests' }
JSONSchemaValidationOfRegexesTests >> testIgnoresNull [
	self assertValid: 'null' description: 'ignores null'
]

{ #category : 'tests' }
JSONSchemaValidationOfRegexesTests >> testIgnoresObjects [
	self assertValid: '{}' description: 'ignores objects'
]
