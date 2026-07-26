Class {
	#name : 'JSONSchemaContainsKeywordValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Contains',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Contains'
}

{ #category : 'testing' }
JSONSchemaContainsKeywordValidationTests >> expectedFailures [
	^ #(#testArrayWithoutItemsMatchingSchemaIsInvalid #testEmptyArrayIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaContainsKeywordValidationTests >> schemaString [
	^ '{"contains":{"minimum":5}}'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordValidationTests >> testArrayWithItemMatchingSchema5IsValid [
	self
		assertValid: '[3,4,5]'
		description: 'array with item matching schema (5) is valid'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordValidationTests >> testArrayWithItemMatchingSchema6IsValid [
	self
		assertValid: '[3,4,6]'
		description: 'array with item matching schema (6) is valid'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordValidationTests >> testArrayWithTwoItemsMatchingSchema56IsValid [
	self
		assertValid: '[3,4,5,6]'
		description: 'array with two items matching schema (5, 6) is valid'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordValidationTests >> testArrayWithoutItemsMatchingSchemaIsInvalid [
	self
		assertInvalid: '[2,3,4]'
		description: 'array without items matching schema is invalid'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordValidationTests >> testEmptyArrayIsInvalid [
	self assertInvalid: '[]' description: 'empty array is invalid'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordValidationTests >> testNotArrayIsValid [
	self assertValid: '{}' description: 'not array is valid'
]
