Class {
	#name : 'JSONSchemaAdditionalPropertiesBeingFalseDoesNotAllowOtherPropertiesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AdditionalProperties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AdditionalProperties'
}

{ #category : 'testing' }
JSONSchemaAdditionalPropertiesBeingFalseDoesNotAllowOtherPropertiesTests >> expectedFailures [
	^ #(#testIgnoresStrings #testIgnoresArrays #testIgnoresOtherNonObjects)
]

{ #category : 'accessing' }
JSONSchemaAdditionalPropertiesBeingFalseDoesNotAllowOtherPropertiesTests >> schemaString [
	^ '{"properties":{"foo":{},"bar":{}},"patternProperties":{"^v":{}},"additionalProperties":false}'
]

{ #category : 'tests' }
JSONSchemaAdditionalPropertiesBeingFalseDoesNotAllowOtherPropertiesTests >> testAnAdditionalPropertyIsInvalid [
	self
		assertInvalid: '{"quux":"boom","foo":1,"bar":2}'
		description: 'an additional property is invalid'
]

{ #category : 'tests' }
JSONSchemaAdditionalPropertiesBeingFalseDoesNotAllowOtherPropertiesTests >> testIgnoresArrays [
	self assertValid: '[1,2,3]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaAdditionalPropertiesBeingFalseDoesNotAllowOtherPropertiesTests >> testIgnoresOtherNonObjects [
	self assertValid: '12' description: 'ignores other non-objects'
]

{ #category : 'tests' }
JSONSchemaAdditionalPropertiesBeingFalseDoesNotAllowOtherPropertiesTests >> testIgnoresStrings [
	self assertValid: '"foobarbaz"' description: 'ignores strings'
]

{ #category : 'tests' }
JSONSchemaAdditionalPropertiesBeingFalseDoesNotAllowOtherPropertiesTests >> testNoAdditionalPropertiesIsValid [
	self
		assertValid: '{"foo":1}'
		description: 'no additional properties is valid'
]

{ #category : 'tests' }
JSONSchemaAdditionalPropertiesBeingFalseDoesNotAllowOtherPropertiesTests >> testPatternPropertiesAreNotAdditionalProperties [
	self
		assertValid: '{"vroom":2,"foo":1}'
		description: 'patternProperties are not additional properties'
]
