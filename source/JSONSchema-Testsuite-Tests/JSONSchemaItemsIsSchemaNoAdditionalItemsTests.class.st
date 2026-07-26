Class {
	#name : 'JSONSchemaItemsIsSchemaNoAdditionalItemsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AdditionalItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AdditionalItems'
}

{ #category : 'testing' }
JSONSchemaItemsIsSchemaNoAdditionalItemsTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaItemsIsSchemaNoAdditionalItemsTests >> schemaString [
	^ '{"items":{},"additionalItems":false}'
]

{ #category : 'tests' }
JSONSchemaItemsIsSchemaNoAdditionalItemsTests >> testAllItemsMatchSchema [
	self assertValid: '[1,2,3,4,5]' description: 'all items match schema'
]
