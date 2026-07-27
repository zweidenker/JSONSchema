Class {
	#name : 'JSONSchemaAnArrayOfSchemasForItemsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Items',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Items'
}

{ #category : 'accessing' }
JSONSchemaAnArrayOfSchemasForItemsTests >> schemaString [
	^ '{"items":[{"type":"integer"},{"type":"string"}]}'
]

{ #category : 'tests' }
JSONSchemaAnArrayOfSchemasForItemsTests >> testArrayWithAdditionalItems [
	self
		assertValid: '[1,"foo",true]'
		description: 'array with additional items'
]

{ #category : 'tests' }
JSONSchemaAnArrayOfSchemasForItemsTests >> testCorrectTypes [
	self assertValid: '[1,"foo"]' description: 'correct types'
]

{ #category : 'tests' }
JSONSchemaAnArrayOfSchemasForItemsTests >> testEmptyArray [
	self assertValid: '[]' description: 'empty array'
]

{ #category : 'tests' }
JSONSchemaAnArrayOfSchemasForItemsTests >> testIncompleteArrayOfItems [
	self assertValid: '[1]' description: 'incomplete array of items'
]

{ #category : 'tests' }
JSONSchemaAnArrayOfSchemasForItemsTests >> testJavaScriptPseudoArrayIsValid [
	self
		assertValid: '{"length":2,"0":"invalid","1":"valid"}'
		description: 'JavaScript pseudo-array is valid'
]

{ #category : 'tests' }
JSONSchemaAnArrayOfSchemasForItemsTests >> testWrongTypes [
	self assertInvalid: '["foo",1]' description: 'wrong types'
]
