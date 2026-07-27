Class {
	#name : 'JSONSchemaItemsWithBooleanSchemaFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Items',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Items'
}

{ #category : 'testing' }
JSONSchemaItemsWithBooleanSchemaFalseTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaItemsWithBooleanSchemaFalseTests >> schemaString [
	^ '{"items":false}'
]

{ #category : 'tests' }
JSONSchemaItemsWithBooleanSchemaFalseTests >> testAnyNonEmptyArrayIsInvalid [
	self
		assertInvalid: '[1,"foo",true]'
		description: 'any non-empty array is invalid'
]

{ #category : 'tests' }
JSONSchemaItemsWithBooleanSchemaFalseTests >> testEmptyArrayIsValid [
	self assertValid: '[]' description: 'empty array is valid'
]
