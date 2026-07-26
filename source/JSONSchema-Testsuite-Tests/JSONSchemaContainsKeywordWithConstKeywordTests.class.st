Class {
	#name : 'JSONSchemaContainsKeywordWithConstKeywordTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Contains',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Contains'
}

{ #category : 'testing' }
JSONSchemaContainsKeywordWithConstKeywordTests >> expectedFailures [
	^ #(#testArrayWithoutItem5IsInvalid)
]

{ #category : 'accessing' }
JSONSchemaContainsKeywordWithConstKeywordTests >> schemaString [
	^ '{"contains":{"const":5}}'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordWithConstKeywordTests >> testArrayWithItem5IsValid [
	self assertValid: '[3,4,5]' description: 'array with item 5 is valid'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordWithConstKeywordTests >> testArrayWithTwoItems5IsValid [
	self
		assertValid: '[3,4,5,5]'
		description: 'array with two items 5 is valid'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordWithConstKeywordTests >> testArrayWithoutItem5IsInvalid [
	self
		assertInvalid: '[1,2,3,4]'
		description: 'array without item 5 is invalid'
]
