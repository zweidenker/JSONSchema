Class {
	#name : 'JSONSchemaMinimumValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Minimum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Minimum'
}

{ #category : 'testing' }
JSONSchemaMinimumValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaMinimumValidationTests >> schemaString [
	^ '{"minimum":1.1}'
]

{ #category : 'tests' }
JSONSchemaMinimumValidationTests >> testAboveTheMinimumIsValid [
	self assertValid: '2.6' description: 'above the minimum is valid'
]

{ #category : 'tests' }
JSONSchemaMinimumValidationTests >> testBelowTheMinimumIsInvalid [
	self assertInvalid: '0.6' description: 'below the minimum is invalid'
]

{ #category : 'tests' }
JSONSchemaMinimumValidationTests >> testBoundaryPointIsValid [
	self assertValid: '1.1' description: 'boundary point is valid'
]

{ #category : 'tests' }
JSONSchemaMinimumValidationTests >> testIgnoresNonNumbers [
	self assertValid: '"x"' description: 'ignores non-numbers'
]
