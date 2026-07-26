Class {
	#name : 'JSONSchemaExclusiveMaximumValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-ExclusiveMaximum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'ExclusiveMaximum'
}

{ #category : 'testing' }
JSONSchemaExclusiveMaximumValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaExclusiveMaximumValidationTests >> schemaString [
	^ '{"exclusiveMaximum":3.0}'
]

{ #category : 'tests' }
JSONSchemaExclusiveMaximumValidationTests >> testAboveTheExclusiveMaximumIsInvalid [
	self
		assertInvalid: '3.5'
		description: 'above the exclusiveMaximum is invalid'
]

{ #category : 'tests' }
JSONSchemaExclusiveMaximumValidationTests >> testBelowTheExclusiveMaximumIsValid [
	self
		assertValid: '2.2'
		description: 'below the exclusiveMaximum is valid'
]

{ #category : 'tests' }
JSONSchemaExclusiveMaximumValidationTests >> testBoundaryPointIsInvalid [
	self assertInvalid: '3.0' description: 'boundary point is invalid'
]

{ #category : 'tests' }
JSONSchemaExclusiveMaximumValidationTests >> testIgnoresNonNumbers [
	self assertValid: '"x"' description: 'ignores non-numbers'
]
