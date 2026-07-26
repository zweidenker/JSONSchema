Class {
	#name : 'JSONSchemaRequiredValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Required',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Required'
}

{ #category : 'testing' }
JSONSchemaRequiredValidationTests >> expectedFailures [
	^ #(#testIgnoresArrays #testIgnoresStrings #testIgnoresOtherNonObjects)
]

{ #category : 'accessing' }
JSONSchemaRequiredValidationTests >> schemaString [
	^ '{"properties":{"foo":{},"bar":{}},"required":["foo"]}'
]

{ #category : 'tests' }
JSONSchemaRequiredValidationTests >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaRequiredValidationTests >> testIgnoresOtherNonObjects [
	self assertValid: '12' description: 'ignores other non-objects'
]

{ #category : 'tests' }
JSONSchemaRequiredValidationTests >> testIgnoresStrings [
	self assertValid: '""' description: 'ignores strings'
]

{ #category : 'tests' }
JSONSchemaRequiredValidationTests >> testNonPresentRequiredPropertyIsInvalid [
	self
		assertInvalid: '{"bar":1}'
		description: 'non-present required property is invalid'
]

{ #category : 'tests' }
JSONSchemaRequiredValidationTests >> testPresentRequiredPropertyIsValid [
	self
		assertValid: '{"foo":1}'
		description: 'present required property is valid'
]
