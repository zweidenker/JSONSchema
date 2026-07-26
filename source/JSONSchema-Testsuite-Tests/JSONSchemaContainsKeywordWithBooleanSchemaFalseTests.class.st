Class {
	#name : 'JSONSchemaContainsKeywordWithBooleanSchemaFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Contains',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Contains'
}

{ #category : 'testing' }
JSONSchemaContainsKeywordWithBooleanSchemaFalseTests >> expectedFailures [
	^ #(#testEmptyArrayIsInvalid #testAnyNonEmptyArrayIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaContainsKeywordWithBooleanSchemaFalseTests >> schemaString [
	^ '{"contains":false}'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordWithBooleanSchemaFalseTests >> testAnyNonEmptyArrayIsInvalid [
	self
		assertInvalid: '["foo"]'
		description: 'any non-empty array is invalid'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordWithBooleanSchemaFalseTests >> testEmptyArrayIsInvalid [
	self assertInvalid: '[]' description: 'empty array is invalid'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordWithBooleanSchemaFalseTests >> testNonArraysAreValid [
	self
		assertValid: '"contains does not apply to strings"'
		description: 'non-arrays are valid'
]
