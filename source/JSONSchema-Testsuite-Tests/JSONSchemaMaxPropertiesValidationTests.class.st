Class {
	#name : 'JSONSchemaMaxPropertiesValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-MaxProperties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'MaxProperties'
}

{ #category : 'testing' }
JSONSchemaMaxPropertiesValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaMaxPropertiesValidationTests >> schemaString [
	^ '{"maxProperties":2}'
]

{ #category : 'tests' }
JSONSchemaMaxPropertiesValidationTests >> testExactLengthIsValid [
	self
		assertValid: '{"foo":1,"bar":2}'
		description: 'exact length is valid'
]

{ #category : 'tests' }
JSONSchemaMaxPropertiesValidationTests >> testIgnoresArrays [
	self assertValid: '[1,2,3]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaMaxPropertiesValidationTests >> testIgnoresOtherNonObjects [
	self assertValid: '12' description: 'ignores other non-objects'
]

{ #category : 'tests' }
JSONSchemaMaxPropertiesValidationTests >> testIgnoresStrings [
	self assertValid: '"foobar"' description: 'ignores strings'
]

{ #category : 'tests' }
JSONSchemaMaxPropertiesValidationTests >> testShorterIsValid [
	self assertValid: '{"foo":1}' description: 'shorter is valid'
]

{ #category : 'tests' }
JSONSchemaMaxPropertiesValidationTests >> testTooLongIsInvalid [
	self
		assertInvalid: '{"foo":1,"bar":2,"baz":3}'
		description: 'too long is invalid'
]
