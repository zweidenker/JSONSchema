Class {
	#name : 'JSONSchemaMinLengthValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-MinLength',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'MinLength'
}

{ #category : 'testing' }
JSONSchemaMinLengthValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaMinLengthValidationTests >> schemaString [
	^ '{"minLength":2}'
]

{ #category : 'tests' }
JSONSchemaMinLengthValidationTests >> testExactLengthIsValid [
	self assertValid: '"fo"' description: 'exact length is valid'
]

{ #category : 'tests' }
JSONSchemaMinLengthValidationTests >> testIgnoresNonStrings [
	self assertValid: '1' description: 'ignores non-strings'
]

{ #category : 'tests' }
JSONSchemaMinLengthValidationTests >> testLongerIsValid [
	self assertValid: '"foo"' description: 'longer is valid'
]

{ #category : 'tests' }
JSONSchemaMinLengthValidationTests >> testOneSupplementaryUnicodeCodePointIsNotLongEnough [
	self
		assertInvalid: '"💩"'
		description: 'one supplementary Unicode code point is not long enough'
]

{ #category : 'tests' }
JSONSchemaMinLengthValidationTests >> testTooShortIsInvalid [
	self assertInvalid: '"f"' description: 'too short is invalid'
]
