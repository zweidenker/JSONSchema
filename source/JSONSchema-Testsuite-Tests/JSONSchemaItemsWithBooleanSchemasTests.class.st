Class {
	#name : 'JSONSchemaItemsWithBooleanSchemasTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Items',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Items'
}

{ #category : 'accessing' }
JSONSchemaItemsWithBooleanSchemasTests >> schemaString [
	^ '{"items":[true,false]}'
]

{ #category : 'tests' }
JSONSchemaItemsWithBooleanSchemasTests >> testArrayWithOneItemIsValid [
	self assertValid: '[1]' description: 'array with one item is valid'
]

{ #category : 'tests' }
JSONSchemaItemsWithBooleanSchemasTests >> testArrayWithTwoItemsIsInvalid [
	self
		assertInvalid: '[1,"foo"]'
		description: 'array with two items is invalid'
]

{ #category : 'tests' }
JSONSchemaItemsWithBooleanSchemasTests >> testEmptyArrayIsValid [
	self assertValid: '[]' description: 'empty array is valid'
]
