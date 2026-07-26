Class {
	#name : 'JSONSchemaItemsContainsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Contains',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Contains'
}

{ #category : 'testing' }
JSONSchemaItemsContainsTests >> expectedFailures [
	^ #(#testDoesNotMatchItemsMatchesContains #testMatchesItemsDoesNotMatchContains #testMatchesNeitherItemsNorContains)
]

{ #category : 'accessing' }
JSONSchemaItemsContainsTests >> schemaString [
	^ '{"items":{"multipleOf":2},"contains":{"multipleOf":3}}'
]

{ #category : 'tests' }
JSONSchemaItemsContainsTests >> testDoesNotMatchItemsMatchesContains [
	self
		assertInvalid: '[3,6,9]'
		description: 'does not match items, matches contains'
]

{ #category : 'tests' }
JSONSchemaItemsContainsTests >> testMatchesBothItemsAndContains [
	self
		assertValid: '[6,12]'
		description: 'matches both items and contains'
]

{ #category : 'tests' }
JSONSchemaItemsContainsTests >> testMatchesItemsDoesNotMatchContains [
	self
		assertInvalid: '[2,4,8]'
		description: 'matches items, does not match contains'
]

{ #category : 'tests' }
JSONSchemaItemsContainsTests >> testMatchesNeitherItemsNorContains [
	self
		assertInvalid: '[1,5]'
		description: 'matches neither items nor contains'
]
