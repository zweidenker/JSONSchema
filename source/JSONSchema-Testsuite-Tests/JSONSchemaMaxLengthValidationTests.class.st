Class {
	#name : 'JSONSchemaMaxLengthValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-MaxLength',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'MaxLength'
}

{ #category : 'testing' }
JSONSchemaMaxLengthValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaMaxLengthValidationTests >> schemaString [
	^ '{"maxLength":2}'
]

{ #category : 'tests' }
JSONSchemaMaxLengthValidationTests >> testExactLengthIsValid [
	self assertValid: '"fo"' description: 'exact length is valid'
]

{ #category : 'tests' }
JSONSchemaMaxLengthValidationTests >> testIgnoresNonStrings [
	self assertValid: '100' description: 'ignores non-strings'
]

{ #category : 'tests' }
JSONSchemaMaxLengthValidationTests >> testShorterIsValid [
	self assertValid: '"f"' description: 'shorter is valid'
]

{ #category : 'tests' }
JSONSchemaMaxLengthValidationTests >> testTooLongIsInvalid [
	self assertInvalid: '"foo"' description: 'too long is invalid'
]

{ #category : 'tests' }
JSONSchemaMaxLengthValidationTests >> testTwoSupplementaryUnicodeCodePointsIsLongEnough [
	self
		assertValid: '"💩💩"'
		description: 'two supplementary Unicode code points is long enough'
]
