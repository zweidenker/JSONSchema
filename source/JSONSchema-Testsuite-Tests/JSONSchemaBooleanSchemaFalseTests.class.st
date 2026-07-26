Class {
	#name : 'JSONSchemaBooleanSchemaFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-BooleanSchema',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'BooleanSchema'
}

{ #category : 'testing' }
JSONSchemaBooleanSchemaFalseTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaBooleanSchemaFalseTests >> schemaString [
	^ 'false'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaFalseTests >> testArrayIsInvalid [
	self assertInvalid: '["foo"]' description: 'array is invalid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaFalseTests >> testBooleanFalseIsInvalid [
	self assertInvalid: 'false' description: 'boolean false is invalid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaFalseTests >> testBooleanTrueIsInvalid [
	self assertInvalid: 'true' description: 'boolean true is invalid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaFalseTests >> testEmptyArrayIsInvalid [
	self assertInvalid: '[]' description: 'empty array is invalid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaFalseTests >> testEmptyObjectIsInvalid [
	self assertInvalid: '{}' description: 'empty object is invalid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaFalseTests >> testNullIsInvalid [
	self assertInvalid: 'null' description: 'null is invalid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaFalseTests >> testNumberIsInvalid [
	self assertInvalid: '1' description: 'number is invalid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaFalseTests >> testObjectIsInvalid [
	self assertInvalid: '{"foo":"bar"}' description: 'object is invalid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaFalseTests >> testStringIsInvalid [
	self assertInvalid: '"foo"' description: 'string is invalid'
]
