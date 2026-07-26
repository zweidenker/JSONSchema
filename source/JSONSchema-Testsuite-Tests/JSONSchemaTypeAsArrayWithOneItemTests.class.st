Class {
	#name : 'JSONSchemaTypeAsArrayWithOneItemTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Type',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Type'
}

{ #category : 'testing' }
JSONSchemaTypeAsArrayWithOneItemTests >> expectedFailures [
	^ #(#testStringIsValid #testNumberIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaTypeAsArrayWithOneItemTests >> schemaString [
	^ '{"type":["string"]}'
]

{ #category : 'tests' }
JSONSchemaTypeAsArrayWithOneItemTests >> testNumberIsInvalid [
	self assertInvalid: '123' description: 'number is invalid'
]

{ #category : 'tests' }
JSONSchemaTypeAsArrayWithOneItemTests >> testStringIsValid [
	self assertValid: '"foo"' description: 'string is valid'
]
