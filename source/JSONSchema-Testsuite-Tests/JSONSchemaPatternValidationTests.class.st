Class {
	#name : 'JSONSchemaPatternValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Pattern',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Pattern'
}

{ #category : 'testing' }
JSONSchemaPatternValidationTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaPatternValidationTests >> schemaString [
	^ '{"pattern":"^a*$"}'
]

{ #category : 'tests' }
JSONSchemaPatternValidationTests >> testAMatchingPatternIsValid [
	self assertValid: '"aaa"' description: 'a matching pattern is valid'
]

{ #category : 'tests' }
JSONSchemaPatternValidationTests >> testANonMatchingPatternIsInvalid [
	self
		assertInvalid: '"abc"'
		description: 'a non-matching pattern is invalid'
]

{ #category : 'tests' }
JSONSchemaPatternValidationTests >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaPatternValidationTests >> testIgnoresBooleans [
	self assertValid: 'true' description: 'ignores booleans'
]

{ #category : 'tests' }
JSONSchemaPatternValidationTests >> testIgnoresFloats [
	self assertValid: '1.0' description: 'ignores floats'
]

{ #category : 'tests' }
JSONSchemaPatternValidationTests >> testIgnoresIntegers [
	self assertValid: '123' description: 'ignores integers'
]

{ #category : 'tests' }
JSONSchemaPatternValidationTests >> testIgnoresNull [
	self assertValid: 'null' description: 'ignores null'
]

{ #category : 'tests' }
JSONSchemaPatternValidationTests >> testIgnoresObjects [
	self assertValid: '{}' description: 'ignores objects'
]
