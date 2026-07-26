Class {
	#name : 'JSONSchemaNestedItemsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Items',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Items'
}

{ #category : 'testing' }
JSONSchemaNestedItemsTests >> expectedFailures [
	^ #(#testNotDeepEnough)
]

{ #category : 'accessing' }
JSONSchemaNestedItemsTests >> schemaString [
	^ '{"items":{"items":{"items":{"items":{"type":"number"},"type":"array"},"type":"array"},"type":"array"},"type":"array"}'
]

{ #category : 'tests' }
JSONSchemaNestedItemsTests >> testNestedArrayWithInvalidType [
	self
		assertInvalid: '[[[["1"]],[[2],[3]]],[[[4],[5],[6]]]]'
		description: 'nested array with invalid type'
]

{ #category : 'tests' }
JSONSchemaNestedItemsTests >> testNotDeepEnough [
	self
		assertInvalid: '[[[1],[2],[3]],[[4],[5],[6]]]'
		description: 'not deep enough'
]

{ #category : 'tests' }
JSONSchemaNestedItemsTests >> testValidNestedArray [
	self
		assertValid: '[[[[1]],[[2],[3]]],[[[4],[5],[6]]]]'
		description: 'valid nested array'
]
