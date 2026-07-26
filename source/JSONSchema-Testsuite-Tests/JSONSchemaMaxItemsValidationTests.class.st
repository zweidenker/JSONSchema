Class {
	#name : 'JSONSchemaMaxItemsValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-MaxItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'MaxItems'
}

{ #category : 'testing' }
JSONSchemaMaxItemsValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaMaxItemsValidationTests >> schemaString [
	^ '{"maxItems":2}'
]

{ #category : 'tests' }
JSONSchemaMaxItemsValidationTests >> testExactLengthIsValid [
	self assertValid: '[1,2]' description: 'exact length is valid'
]

{ #category : 'tests' }
JSONSchemaMaxItemsValidationTests >> testIgnoresNonArrays [
	self assertValid: '"foobar"' description: 'ignores non-arrays'
]

{ #category : 'tests' }
JSONSchemaMaxItemsValidationTests >> testShorterIsValid [
	self assertValid: '[1]' description: 'shorter is valid'
]

{ #category : 'tests' }
JSONSchemaMaxItemsValidationTests >> testTooLongIsInvalid [
	self assertInvalid: '[1,2,3]' description: 'too long is invalid'
]
