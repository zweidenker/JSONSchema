Class {
	#name : 'JSONSchemaMultipleTypesCanBeSpecifiedInAnArrayTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Type',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Type'
}

{ #category : 'accessing' }
JSONSchemaMultipleTypesCanBeSpecifiedInAnArrayTests >> schemaString [
	^ '{"type":["integer","string"]}'
]

{ #category : 'tests' }
JSONSchemaMultipleTypesCanBeSpecifiedInAnArrayTests >> testABooleanIsInvalid [
	self assertInvalid: 'true' description: 'a boolean is invalid'
]

{ #category : 'tests' }
JSONSchemaMultipleTypesCanBeSpecifiedInAnArrayTests >> testAFloatIsInvalid [
	self assertInvalid: '1.1' description: 'a float is invalid'
]

{ #category : 'tests' }
JSONSchemaMultipleTypesCanBeSpecifiedInAnArrayTests >> testAStringIsValid [
	self assertValid: '"foo"' description: 'a string is valid'
]

{ #category : 'tests' }
JSONSchemaMultipleTypesCanBeSpecifiedInAnArrayTests >> testAnArrayIsInvalid [
	self assertInvalid: '[]' description: 'an array is invalid'
]

{ #category : 'tests' }
JSONSchemaMultipleTypesCanBeSpecifiedInAnArrayTests >> testAnIntegerIsValid [
	self assertValid: '1' description: 'an integer is valid'
]

{ #category : 'tests' }
JSONSchemaMultipleTypesCanBeSpecifiedInAnArrayTests >> testAnObjectIsInvalid [
	self assertInvalid: '{}' description: 'an object is invalid'
]

{ #category : 'tests' }
JSONSchemaMultipleTypesCanBeSpecifiedInAnArrayTests >> testNullIsInvalid [
	self assertInvalid: 'null' description: 'null is invalid'
]
