Class {
	#name : 'JSONSchemaExclusiveMinimumValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-ExclusiveMinimum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'ExclusiveMinimum'
}

{ #category : 'testing' }
JSONSchemaExclusiveMinimumValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaExclusiveMinimumValidationTests >> schemaString [
	^ '{"exclusiveMinimum":1.1}'
]

{ #category : 'tests' }
JSONSchemaExclusiveMinimumValidationTests >> testAboveTheExclusiveMinimumIsValid [
	self
		assertValid: '1.2'
		description: 'above the exclusiveMinimum is valid'
]

{ #category : 'tests' }
JSONSchemaExclusiveMinimumValidationTests >> testBelowTheExclusiveMinimumIsInvalid [
	self
		assertInvalid: '0.6'
		description: 'below the exclusiveMinimum is invalid'
]

{ #category : 'tests' }
JSONSchemaExclusiveMinimumValidationTests >> testBoundaryPointIsInvalid [
	self assertInvalid: '1.1' description: 'boundary point is invalid'
]

{ #category : 'tests' }
JSONSchemaExclusiveMinimumValidationTests >> testIgnoresNonNumbers [
	self assertValid: '"x"' description: 'ignores non-numbers'
]
