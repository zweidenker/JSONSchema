Class {
	#name : 'JSONSchemaArrayOfItemsWithNoAdditionalItemsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AdditionalItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AdditionalItems'
}

{ #category : 'testing' }
JSONSchemaArrayOfItemsWithNoAdditionalItemsTests >> expectedFailures [
	^ #(#testEqualNumberOfItemsPresent #testEmptyArray #testFewerNumberOfItemsPresent1 #testFewerNumberOfItemsPresent2 #testAdditionalItemsAreNotPermitted)
]

{ #category : 'accessing' }
JSONSchemaArrayOfItemsWithNoAdditionalItemsTests >> schemaString [
	^ '{"items":[{},{},{}],"additionalItems":false}'
]

{ #category : 'tests' }
JSONSchemaArrayOfItemsWithNoAdditionalItemsTests >> testAdditionalItemsAreNotPermitted [
	self
		assertInvalid: '[1,2,3,4]'
		description: 'additional items are not permitted'
]

{ #category : 'tests' }
JSONSchemaArrayOfItemsWithNoAdditionalItemsTests >> testEmptyArray [
	self assertValid: '[]' description: 'empty array'
]

{ #category : 'tests' }
JSONSchemaArrayOfItemsWithNoAdditionalItemsTests >> testEqualNumberOfItemsPresent [
	self
		assertValid: '[1,2,3]'
		description: 'equal number of items present'
]

{ #category : 'tests' }
JSONSchemaArrayOfItemsWithNoAdditionalItemsTests >> testFewerNumberOfItemsPresent1 [
	self
		assertValid: '[1]'
		description: 'fewer number of items present (1)'
]

{ #category : 'tests' }
JSONSchemaArrayOfItemsWithNoAdditionalItemsTests >> testFewerNumberOfItemsPresent2 [
	self
		assertValid: '[1,2]'
		description: 'fewer number of items present (2)'
]
