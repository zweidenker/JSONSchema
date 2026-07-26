Class {
	#name : 'JSONSchemaNumberTypeMatchesNumbersTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Type',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Type'
}

{ #category : 'testing' }
JSONSchemaNumberTypeMatchesNumbersTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaNumberTypeMatchesNumbersTests >> schemaString [
	^ '{"type":"number"}'
]

{ #category : 'tests' }
JSONSchemaNumberTypeMatchesNumbersTests >> testABooleanIsNotANumber [
	self assertInvalid: 'true' description: 'a boolean is not a number'
]

{ #category : 'tests' }
JSONSchemaNumberTypeMatchesNumbersTests >> testAFloatIsANumber [
	self assertValid: '1.1' description: 'a float is a number'
]

{ #category : 'tests' }
JSONSchemaNumberTypeMatchesNumbersTests >> testAFloatWithZeroFractionalPartIsANumberAndAnInteger [
	self
		assertValid: '1.0'
		description: 'a float with zero fractional part is a number (and an integer)'
]

{ #category : 'tests' }
JSONSchemaNumberTypeMatchesNumbersTests >> testAStringIsNotANumber [
	self assertInvalid: '"foo"' description: 'a string is not a number'
]

{ #category : 'tests' }
JSONSchemaNumberTypeMatchesNumbersTests >> testAStringIsStillNotANumberEvenIfItLooksLikeOne [
	self
		assertInvalid: '"1"'
		description: 'a string is still not a number, even if it looks like one'
]

{ #category : 'tests' }
JSONSchemaNumberTypeMatchesNumbersTests >> testAnArrayIsNotANumber [
	self assertInvalid: '[]' description: 'an array is not a number'
]

{ #category : 'tests' }
JSONSchemaNumberTypeMatchesNumbersTests >> testAnIntegerIsANumber [
	self assertValid: '1' description: 'an integer is a number'
]

{ #category : 'tests' }
JSONSchemaNumberTypeMatchesNumbersTests >> testAnObjectIsNotANumber [
	self assertInvalid: '{}' description: 'an object is not a number'
]

{ #category : 'tests' }
JSONSchemaNumberTypeMatchesNumbersTests >> testNullIsNotANumber [
	self assertInvalid: 'null' description: 'null is not a number'
]
