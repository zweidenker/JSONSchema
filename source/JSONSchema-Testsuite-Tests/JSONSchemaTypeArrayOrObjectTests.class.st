Class {
	#name : 'JSONSchemaTypeArrayOrObjectTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Type',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Type'
}

{ #category : 'accessing' }
JSONSchemaTypeArrayOrObjectTests >> schemaString [
	^ '{"type":["array","object"]}'
]

{ #category : 'tests' }
JSONSchemaTypeArrayOrObjectTests >> testArrayIsValid [
	self assertValid: '[1,2,3]' description: 'array is valid'
]

{ #category : 'tests' }
JSONSchemaTypeArrayOrObjectTests >> testNullIsInvalid [
	self assertInvalid: 'null' description: 'null is invalid'
]

{ #category : 'tests' }
JSONSchemaTypeArrayOrObjectTests >> testNumberIsInvalid [
	self assertInvalid: '123' description: 'number is invalid'
]

{ #category : 'tests' }
JSONSchemaTypeArrayOrObjectTests >> testObjectIsValid [
	self assertValid: '{"foo":123}' description: 'object is valid'
]

{ #category : 'tests' }
JSONSchemaTypeArrayOrObjectTests >> testStringIsInvalid [
	self assertInvalid: '"foo"' description: 'string is invalid'
]
