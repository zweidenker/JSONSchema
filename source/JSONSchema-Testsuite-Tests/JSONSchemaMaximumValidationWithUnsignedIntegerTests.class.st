Class {
	#name : 'JSONSchemaMaximumValidationWithUnsignedIntegerTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Maximum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Maximum'
}

{ #category : 'testing' }
JSONSchemaMaximumValidationWithUnsignedIntegerTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaMaximumValidationWithUnsignedIntegerTests >> schemaString [
	^ '{"maximum":300}'
]

{ #category : 'tests' }
JSONSchemaMaximumValidationWithUnsignedIntegerTests >> testAboveTheMaximumIsInvalid [
	self
		assertInvalid: '300.5'
		description: 'above the maximum is invalid'
]

{ #category : 'tests' }
JSONSchemaMaximumValidationWithUnsignedIntegerTests >> testBelowTheMaximumIsInvalid [
	self
		assertValid: '299.97'
		description: 'below the maximum is invalid'
]

{ #category : 'tests' }
JSONSchemaMaximumValidationWithUnsignedIntegerTests >> testBoundaryPointFloatIsValid [
	self
		assertValid: '300.0'
		description: 'boundary point float is valid'
]

{ #category : 'tests' }
JSONSchemaMaximumValidationWithUnsignedIntegerTests >> testBoundaryPointIntegerIsValid [
	self
		assertValid: '300'
		description: 'boundary point integer is valid'
]
