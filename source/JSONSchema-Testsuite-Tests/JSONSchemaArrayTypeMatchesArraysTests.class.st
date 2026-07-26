Class {
	#name : 'JSONSchemaArrayTypeMatchesArraysTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Type',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Type'
}

{ #category : 'testing' }
JSONSchemaArrayTypeMatchesArraysTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaArrayTypeMatchesArraysTests >> schemaString [
	^ '{"type":"array"}'
]

{ #category : 'tests' }
JSONSchemaArrayTypeMatchesArraysTests >> testABooleanIsNotAnArray [
	self assertInvalid: 'true' description: 'a boolean is not an array'
]

{ #category : 'tests' }
JSONSchemaArrayTypeMatchesArraysTests >> testAFloatIsNotAnArray [
	self assertInvalid: '1.1' description: 'a float is not an array'
]

{ #category : 'tests' }
JSONSchemaArrayTypeMatchesArraysTests >> testAStringIsNotAnArray [
	self assertInvalid: '"foo"' description: 'a string is not an array'
]

{ #category : 'tests' }
JSONSchemaArrayTypeMatchesArraysTests >> testAnArrayIsAnArray [
	self assertValid: '[]' description: 'an array is an array'
]

{ #category : 'tests' }
JSONSchemaArrayTypeMatchesArraysTests >> testAnIntegerIsNotAnArray [
	self assertInvalid: '1' description: 'an integer is not an array'
]

{ #category : 'tests' }
JSONSchemaArrayTypeMatchesArraysTests >> testAnObjectIsNotAnArray [
	self assertInvalid: '{}' description: 'an object is not an array'
]

{ #category : 'tests' }
JSONSchemaArrayTypeMatchesArraysTests >> testNullIsNotAnArray [
	self assertInvalid: 'null' description: 'null is not an array'
]
