Class {
	#name : 'JSONSchemaStringTypeMatchesStringsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Type',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Type'
}

{ #category : 'testing' }
JSONSchemaStringTypeMatchesStringsTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaStringTypeMatchesStringsTests >> schemaString [
	^ '{"type":"string"}'
]

{ #category : 'tests' }
JSONSchemaStringTypeMatchesStringsTests >> test1IsNotAString [
	self assertInvalid: '1' description: '1 is not a string'
]

{ #category : 'tests' }
JSONSchemaStringTypeMatchesStringsTests >> testABooleanIsNotAString [
	self assertInvalid: 'true' description: 'a boolean is not a string'
]

{ #category : 'tests' }
JSONSchemaStringTypeMatchesStringsTests >> testAFloatIsNotAString [
	self assertInvalid: '1.1' description: 'a float is not a string'
]

{ #category : 'tests' }
JSONSchemaStringTypeMatchesStringsTests >> testAStringIsAString [
	self assertValid: '"foo"' description: 'a string is a string'
]

{ #category : 'tests' }
JSONSchemaStringTypeMatchesStringsTests >> testAStringIsStillAStringEvenIfItLooksLikeANumber [
	self
		assertValid: '"1"'
		description: 'a string is still a string, even if it looks like a number'
]

{ #category : 'tests' }
JSONSchemaStringTypeMatchesStringsTests >> testAnArrayIsNotAString [
	self assertInvalid: '[]' description: 'an array is not a string'
]

{ #category : 'tests' }
JSONSchemaStringTypeMatchesStringsTests >> testAnEmptyStringIsStillAString [
	self
		assertValid: '""'
		description: 'an empty string is still a string'
]

{ #category : 'tests' }
JSONSchemaStringTypeMatchesStringsTests >> testAnObjectIsNotAString [
	self assertInvalid: '{}' description: 'an object is not a string'
]

{ #category : 'tests' }
JSONSchemaStringTypeMatchesStringsTests >> testNullIsNotAString [
	self assertInvalid: 'null' description: 'null is not a string'
]
