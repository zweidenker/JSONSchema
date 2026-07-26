Class {
	#name : 'JSONSchemaMinimumValidationWithSignedIntegerTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Minimum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Minimum'
}

{ #category : 'testing' }
JSONSchemaMinimumValidationWithSignedIntegerTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaMinimumValidationWithSignedIntegerTests >> schemaString [
	^ '{"minimum":-2}'
]

{ #category : 'tests' }
JSONSchemaMinimumValidationWithSignedIntegerTests >> testBoundaryPointIsValid [
	self assertValid: '-2' description: 'boundary point is valid'
]

{ #category : 'tests' }
JSONSchemaMinimumValidationWithSignedIntegerTests >> testBoundaryPointWithFloatIsValid [
	self
		assertValid: '-2.0'
		description: 'boundary point with float is valid'
]

{ #category : 'tests' }
JSONSchemaMinimumValidationWithSignedIntegerTests >> testFloatBelowTheMinimumIsInvalid [
	self
		assertInvalid: '-2.0001'
		description: 'float below the minimum is invalid'
]

{ #category : 'tests' }
JSONSchemaMinimumValidationWithSignedIntegerTests >> testIgnoresNonNumbers [
	self assertValid: '"x"' description: 'ignores non-numbers'
]

{ #category : 'tests' }
JSONSchemaMinimumValidationWithSignedIntegerTests >> testIntBelowTheMinimumIsInvalid [
	self
		assertInvalid: '-3'
		description: 'int below the minimum is invalid'
]

{ #category : 'tests' }
JSONSchemaMinimumValidationWithSignedIntegerTests >> testNegativeAboveTheMinimumIsValid [
	self
		assertValid: '-1'
		description: 'negative above the minimum is valid'
]

{ #category : 'tests' }
JSONSchemaMinimumValidationWithSignedIntegerTests >> testPositiveAboveTheMinimumIsValid [
	self
		assertValid: '0'
		description: 'positive above the minimum is valid'
]
