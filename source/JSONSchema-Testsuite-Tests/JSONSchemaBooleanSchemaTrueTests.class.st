Class {
	#name : 'JSONSchemaBooleanSchemaTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-BooleanSchema',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'BooleanSchema'
}

{ #category : 'testing' }
JSONSchemaBooleanSchemaTrueTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaBooleanSchemaTrueTests >> schemaString [
	^ 'true'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaTrueTests >> testArrayIsValid [
	self assertValid: '["foo"]' description: 'array is valid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaTrueTests >> testBooleanFalseIsValid [
	self assertValid: 'false' description: 'boolean false is valid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaTrueTests >> testBooleanTrueIsValid [
	self assertValid: 'true' description: 'boolean true is valid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaTrueTests >> testEmptyArrayIsValid [
	self assertValid: '[]' description: 'empty array is valid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaTrueTests >> testEmptyObjectIsValid [
	self assertValid: '{}' description: 'empty object is valid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaTrueTests >> testNullIsValid [
	self assertValid: 'null' description: 'null is valid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaTrueTests >> testNumberIsValid [
	self assertValid: '1' description: 'number is valid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaTrueTests >> testObjectIsValid [
	self assertValid: '{"foo":"bar"}' description: 'object is valid'
]

{ #category : 'tests' }
JSONSchemaBooleanSchemaTrueTests >> testStringIsValid [
	self assertValid: '"foo"' description: 'string is valid'
]
