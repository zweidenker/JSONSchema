Class {
	#name : 'JSONSchemaMinPropertiesValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-MinProperties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'MinProperties'
}

{ #category : 'testing' }
JSONSchemaMinPropertiesValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaMinPropertiesValidationTests >> schemaString [
	^ '{"minProperties":1}'
]

{ #category : 'tests' }
JSONSchemaMinPropertiesValidationTests >> testExactLengthIsValid [
	self assertValid: '{"foo":1}' description: 'exact length is valid'
]

{ #category : 'tests' }
JSONSchemaMinPropertiesValidationTests >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaMinPropertiesValidationTests >> testIgnoresOtherNonObjects [
	self assertValid: '12' description: 'ignores other non-objects'
]

{ #category : 'tests' }
JSONSchemaMinPropertiesValidationTests >> testIgnoresStrings [
	self assertValid: '""' description: 'ignores strings'
]

{ #category : 'tests' }
JSONSchemaMinPropertiesValidationTests >> testLongerIsValid [
	self assertValid: '{"foo":1,"bar":2}' description: 'longer is valid'
]

{ #category : 'tests' }
JSONSchemaMinPropertiesValidationTests >> testTooShortIsInvalid [
	self assertInvalid: '{}' description: 'too short is invalid'
]
