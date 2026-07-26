Class {
	#name : 'JSONSchemaConstValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Const',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Const'
}

{ #category : 'testing' }
JSONSchemaConstValidationTests >> expectedFailures [
	^ #(#testAnotherValueIsInvalid #testAnotherTypeIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaConstValidationTests >> schemaString [
	^ '{"const":2}'
]

{ #category : 'tests' }
JSONSchemaConstValidationTests >> testAnotherTypeIsInvalid [
	self assertInvalid: '"a"' description: 'another type is invalid'
]

{ #category : 'tests' }
JSONSchemaConstValidationTests >> testAnotherValueIsInvalid [
	self assertInvalid: '5' description: 'another value is invalid'
]

{ #category : 'tests' }
JSONSchemaConstValidationTests >> testSameValueIsValid [
	self assertValid: '2' description: 'same value is valid'
]
