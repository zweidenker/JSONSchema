Class {
	#name : 'JSONSchemaBooleanTypeMatchesBooleansTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Type',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Type'
}

{ #category : 'testing' }
JSONSchemaBooleanTypeMatchesBooleansTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaBooleanTypeMatchesBooleansTests >> schemaString [
	^ '{"type":"boolean"}'
]

{ #category : 'tests' }
JSONSchemaBooleanTypeMatchesBooleansTests >> testAFloatIsNotABoolean [
	self assertInvalid: '1.1' description: 'a float is not a boolean'
]

{ #category : 'tests' }
JSONSchemaBooleanTypeMatchesBooleansTests >> testAStringIsNotABoolean [
	self assertInvalid: '"foo"' description: 'a string is not a boolean'
]

{ #category : 'tests' }
JSONSchemaBooleanTypeMatchesBooleansTests >> testAnArrayIsNotABoolean [
	self assertInvalid: '[]' description: 'an array is not a boolean'
]

{ #category : 'tests' }
JSONSchemaBooleanTypeMatchesBooleansTests >> testAnEmptyStringIsNotABoolean [
	self
		assertInvalid: '""'
		description: 'an empty string is not a boolean'
]

{ #category : 'tests' }
JSONSchemaBooleanTypeMatchesBooleansTests >> testAnIntegerIsNotABoolean [
	self assertInvalid: '1' description: 'an integer is not a boolean'
]

{ #category : 'tests' }
JSONSchemaBooleanTypeMatchesBooleansTests >> testAnObjectIsNotABoolean [
	self assertInvalid: '{}' description: 'an object is not a boolean'
]

{ #category : 'tests' }
JSONSchemaBooleanTypeMatchesBooleansTests >> testFalseIsABoolean [
	self assertValid: 'false' description: 'false is a boolean'
]

{ #category : 'tests' }
JSONSchemaBooleanTypeMatchesBooleansTests >> testNullIsNotABoolean [
	self assertInvalid: 'null' description: 'null is not a boolean'
]

{ #category : 'tests' }
JSONSchemaBooleanTypeMatchesBooleansTests >> testTrueIsABoolean [
	self assertValid: 'true' description: 'true is a boolean'
]

{ #category : 'tests' }
JSONSchemaBooleanTypeMatchesBooleansTests >> testZeroIsNotABoolean [
	self assertInvalid: '0' description: 'zero is not a boolean'
]
