Class {
	#name : 'JSONSchemaObjectTypeMatchesObjectsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Type',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Type'
}

{ #category : 'testing' }
JSONSchemaObjectTypeMatchesObjectsTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaObjectTypeMatchesObjectsTests >> schemaString [
	^ '{"type":"object"}'
]

{ #category : 'tests' }
JSONSchemaObjectTypeMatchesObjectsTests >> testABooleanIsNotAnObject [
	self assertInvalid: 'true' description: 'a boolean is not an object'
]

{ #category : 'tests' }
JSONSchemaObjectTypeMatchesObjectsTests >> testAFloatIsNotAnObject [
	self assertInvalid: '1.1' description: 'a float is not an object'
]

{ #category : 'tests' }
JSONSchemaObjectTypeMatchesObjectsTests >> testAStringIsNotAnObject [
	self assertInvalid: '"foo"' description: 'a string is not an object'
]

{ #category : 'tests' }
JSONSchemaObjectTypeMatchesObjectsTests >> testAnArrayIsNotAnObject [
	self assertInvalid: '[]' description: 'an array is not an object'
]

{ #category : 'tests' }
JSONSchemaObjectTypeMatchesObjectsTests >> testAnIntegerIsNotAnObject [
	self assertInvalid: '1' description: 'an integer is not an object'
]

{ #category : 'tests' }
JSONSchemaObjectTypeMatchesObjectsTests >> testAnObjectIsAnObject [
	self assertValid: '{}' description: 'an object is an object'
]

{ #category : 'tests' }
JSONSchemaObjectTypeMatchesObjectsTests >> testNullIsNotAnObject [
	self assertInvalid: 'null' description: 'null is not an object'
]
