Class {
	#name : 'JSONSchemaValidationOfDateStringsTests1',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Format',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Format'
}

{ #category : 'testing' }
JSONSchemaValidationOfDateStringsTests1 >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaValidationOfDateStringsTests1 >> schemaString [
	^ '{"format":"date"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateStringsTests1 >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateStringsTests1 >> testIgnoresBooleans [
	self assertValid: 'false' description: 'ignores booleans'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateStringsTests1 >> testIgnoresFloats [
	self assertValid: '13.7' description: 'ignores floats'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateStringsTests1 >> testIgnoresIntegers [
	self assertValid: '12' description: 'ignores integers'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateStringsTests1 >> testIgnoresNull [
	self assertValid: 'null' description: 'ignores null'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateStringsTests1 >> testIgnoresObjects [
	self assertValid: '{}' description: 'ignores objects'
]
