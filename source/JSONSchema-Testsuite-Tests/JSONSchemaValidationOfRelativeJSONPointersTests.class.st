Class {
	#name : 'JSONSchemaValidationOfRelativeJSONPointersTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Format',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Format'
}

{ #category : 'accessing' }
JSONSchemaValidationOfRelativeJSONPointersTests >> schemaString [
	^ '{"format":"relative-json-pointer"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfRelativeJSONPointersTests >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaValidationOfRelativeJSONPointersTests >> testIgnoresBooleans [
	self assertValid: 'false' description: 'ignores booleans'
]

{ #category : 'tests' }
JSONSchemaValidationOfRelativeJSONPointersTests >> testIgnoresFloats [
	self assertValid: '13.7' description: 'ignores floats'
]

{ #category : 'tests' }
JSONSchemaValidationOfRelativeJSONPointersTests >> testIgnoresIntegers [
	self assertValid: '12' description: 'ignores integers'
]

{ #category : 'tests' }
JSONSchemaValidationOfRelativeJSONPointersTests >> testIgnoresNull [
	self assertValid: 'null' description: 'ignores null'
]

{ #category : 'tests' }
JSONSchemaValidationOfRelativeJSONPointersTests >> testIgnoresObjects [
	self assertValid: '{}' description: 'ignores objects'
]
