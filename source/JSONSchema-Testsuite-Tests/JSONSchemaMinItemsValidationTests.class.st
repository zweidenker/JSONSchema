Class {
	#name : 'JSONSchemaMinItemsValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-MinItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'MinItems'
}

{ #category : 'testing' }
JSONSchemaMinItemsValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaMinItemsValidationTests >> schemaString [
	^ '{"minItems":1}'
]

{ #category : 'tests' }
JSONSchemaMinItemsValidationTests >> testExactLengthIsValid [
	self assertValid: '[1]' description: 'exact length is valid'
]

{ #category : 'tests' }
JSONSchemaMinItemsValidationTests >> testIgnoresNonArrays [
	self assertValid: '""' description: 'ignores non-arrays'
]

{ #category : 'tests' }
JSONSchemaMinItemsValidationTests >> testLongerIsValid [
	self assertValid: '[1,2]' description: 'longer is valid'
]

{ #category : 'tests' }
JSONSchemaMinItemsValidationTests >> testTooShortIsInvalid [
	self assertInvalid: '[]' description: 'too short is invalid'
]
