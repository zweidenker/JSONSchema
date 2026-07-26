Class {
	#name : 'JSONSchemaMaximumValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Maximum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Maximum'
}

{ #category : 'testing' }
JSONSchemaMaximumValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaMaximumValidationTests >> schemaString [
	^ '{"maximum":3.0}'
]

{ #category : 'tests' }
JSONSchemaMaximumValidationTests >> testAboveTheMaximumIsInvalid [
	self assertInvalid: '3.5' description: 'above the maximum is invalid'
]

{ #category : 'tests' }
JSONSchemaMaximumValidationTests >> testBelowTheMaximumIsValid [
	self assertValid: '2.6' description: 'below the maximum is valid'
]

{ #category : 'tests' }
JSONSchemaMaximumValidationTests >> testBoundaryPointIsValid [
	self assertValid: '3.0' description: 'boundary point is valid'
]

{ #category : 'tests' }
JSONSchemaMaximumValidationTests >> testIgnoresNonNumbers [
	self assertValid: '"x"' description: 'ignores non-numbers'
]
