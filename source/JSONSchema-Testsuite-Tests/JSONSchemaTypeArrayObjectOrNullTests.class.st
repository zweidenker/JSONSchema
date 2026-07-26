Class {
	#name : 'JSONSchemaTypeArrayObjectOrNullTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Type',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Type'
}

{ #category : 'testing' }
JSONSchemaTypeArrayObjectOrNullTests >> expectedFailures [
	^ #(#testStringIsInvalid #testObjectIsValid #testNullIsValid #testArrayIsValid #testNumberIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaTypeArrayObjectOrNullTests >> schemaString [
	^ '{"type":["array","object","null"]}'
]

{ #category : 'tests' }
JSONSchemaTypeArrayObjectOrNullTests >> testArrayIsValid [
	self assertValid: '[1,2,3]' description: 'array is valid'
]

{ #category : 'tests' }
JSONSchemaTypeArrayObjectOrNullTests >> testNullIsValid [
	self assertValid: 'null' description: 'null is valid'
]

{ #category : 'tests' }
JSONSchemaTypeArrayObjectOrNullTests >> testNumberIsInvalid [
	self assertInvalid: '123' description: 'number is invalid'
]

{ #category : 'tests' }
JSONSchemaTypeArrayObjectOrNullTests >> testObjectIsValid [
	self assertValid: '{"foo":123}' description: 'object is valid'
]

{ #category : 'tests' }
JSONSchemaTypeArrayObjectOrNullTests >> testStringIsInvalid [
	self assertInvalid: '"foo"' description: 'string is invalid'
]
