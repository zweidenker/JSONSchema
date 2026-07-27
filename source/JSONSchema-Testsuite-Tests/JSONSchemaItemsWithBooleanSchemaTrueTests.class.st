Class {
	#name : 'JSONSchemaItemsWithBooleanSchemaTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Items',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Items'
}

{ #category : 'testing' }
JSONSchemaItemsWithBooleanSchemaTrueTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaItemsWithBooleanSchemaTrueTests >> schemaString [
	^ '{"items":true}'
]

{ #category : 'tests' }
JSONSchemaItemsWithBooleanSchemaTrueTests >> testAnyArrayIsValid [
	self assertValid: '[1,"foo",true]' description: 'any array is valid'
]

{ #category : 'tests' }
JSONSchemaItemsWithBooleanSchemaTrueTests >> testEmptyArrayIsValid [
	self assertValid: '[]' description: 'empty array is valid'
]
