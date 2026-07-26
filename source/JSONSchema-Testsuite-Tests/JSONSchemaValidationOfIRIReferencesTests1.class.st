Class {
	#name : 'JSONSchemaValidationOfIRIReferencesTests1',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Format',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Format'
}

{ #category : 'testing' }
JSONSchemaValidationOfIRIReferencesTests1 >> expectedFailures [
	^ #(#testIgnoresBooleans #testIgnoresObjects #testIgnoresFloats #testIgnoresNull #testIgnoresIntegers #testIgnoresArrays)
]

{ #category : 'accessing' }
JSONSchemaValidationOfIRIReferencesTests1 >> schemaString [
	^ '{"format":"iri-reference"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIReferencesTests1 >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIReferencesTests1 >> testIgnoresBooleans [
	self assertValid: 'false' description: 'ignores booleans'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIReferencesTests1 >> testIgnoresFloats [
	self assertValid: '13.7' description: 'ignores floats'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIReferencesTests1 >> testIgnoresIntegers [
	self assertValid: '12' description: 'ignores integers'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIReferencesTests1 >> testIgnoresNull [
	self assertValid: 'null' description: 'ignores null'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIReferencesTests1 >> testIgnoresObjects [
	self assertValid: '{}' description: 'ignores objects'
]
