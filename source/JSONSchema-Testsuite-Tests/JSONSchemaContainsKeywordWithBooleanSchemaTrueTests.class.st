Class {
	#name : 'JSONSchemaContainsKeywordWithBooleanSchemaTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Contains',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Contains'
}

{ #category : 'accessing' }
JSONSchemaContainsKeywordWithBooleanSchemaTrueTests >> schemaString [
	^ '{"contains":true}'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordWithBooleanSchemaTrueTests >> testAnyNonEmptyArrayIsValid [
	self
		assertValid: '["foo"]'
		description: 'any non-empty array is valid'
]

{ #category : 'tests' }
JSONSchemaContainsKeywordWithBooleanSchemaTrueTests >> testEmptyArrayIsInvalid [
	self assertInvalid: '[]' description: 'empty array is invalid'
]
