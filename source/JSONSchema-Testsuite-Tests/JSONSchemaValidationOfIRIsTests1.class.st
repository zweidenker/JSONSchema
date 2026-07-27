Class {
	#name : 'JSONSchemaValidationOfIRIsTests1',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Format',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Format'
}

{ #category : 'accessing' }
JSONSchemaValidationOfIRIsTests1 >> schemaString [
	^ '{"format":"iri"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests1 >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests1 >> testIgnoresBooleans [
	self assertValid: 'false' description: 'ignores booleans'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests1 >> testIgnoresFloats [
	self assertValid: '13.7' description: 'ignores floats'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests1 >> testIgnoresIntegers [
	self assertValid: '12' description: 'ignores integers'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests1 >> testIgnoresNull [
	self assertValid: 'null' description: 'ignores null'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests1 >> testIgnoresObjects [
	self assertValid: '{}' description: 'ignores objects'
]
