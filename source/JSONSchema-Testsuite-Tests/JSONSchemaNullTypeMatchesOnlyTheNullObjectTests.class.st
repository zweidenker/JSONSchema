Class {
	#name : 'JSONSchemaNullTypeMatchesOnlyTheNullObjectTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Type',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Type'
}

{ #category : 'testing' }
JSONSchemaNullTypeMatchesOnlyTheNullObjectTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaNullTypeMatchesOnlyTheNullObjectTests >> schemaString [
	^ '{"type":"null"}'
]

{ #category : 'tests' }
JSONSchemaNullTypeMatchesOnlyTheNullObjectTests >> testAFloatIsNotNull [
	self assertInvalid: '1.1' description: 'a float is not null'
]

{ #category : 'tests' }
JSONSchemaNullTypeMatchesOnlyTheNullObjectTests >> testAStringIsNotNull [
	self assertInvalid: '"foo"' description: 'a string is not null'
]

{ #category : 'tests' }
JSONSchemaNullTypeMatchesOnlyTheNullObjectTests >> testAnArrayIsNotNull [
	self assertInvalid: '[]' description: 'an array is not null'
]

{ #category : 'tests' }
JSONSchemaNullTypeMatchesOnlyTheNullObjectTests >> testAnEmptyStringIsNotNull [
	self assertInvalid: '""' description: 'an empty string is not null'
]

{ #category : 'tests' }
JSONSchemaNullTypeMatchesOnlyTheNullObjectTests >> testAnIntegerIsNotNull [
	self assertInvalid: '1' description: 'an integer is not null'
]

{ #category : 'tests' }
JSONSchemaNullTypeMatchesOnlyTheNullObjectTests >> testAnObjectIsNotNull [
	self assertInvalid: '{}' description: 'an object is not null'
]

{ #category : 'tests' }
JSONSchemaNullTypeMatchesOnlyTheNullObjectTests >> testFalseIsNotNull [
	self assertInvalid: 'false' description: 'false is not null'
]

{ #category : 'tests' }
JSONSchemaNullTypeMatchesOnlyTheNullObjectTests >> testNullIsNull [
	self assertValid: 'null' description: 'null is null'
]

{ #category : 'tests' }
JSONSchemaNullTypeMatchesOnlyTheNullObjectTests >> testTrueIsNotNull [
	self assertInvalid: 'true' description: 'true is not null'
]

{ #category : 'tests' }
JSONSchemaNullTypeMatchesOnlyTheNullObjectTests >> testZeroIsNotNull [
	self assertInvalid: '0' description: 'zero is not null'
]
