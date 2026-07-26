Class {
	#name : 'JSONSchemaASchemaGivenForItemsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Items',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Items'
}

{ #category : 'testing' }
JSONSchemaASchemaGivenForItemsTests >> expectedFailures [
	^ #(#testWrongTypeOfItems)
]

{ #category : 'accessing' }
JSONSchemaASchemaGivenForItemsTests >> schemaString [
	^ '{"items":{"type":"integer"}}'
]

{ #category : 'tests' }
JSONSchemaASchemaGivenForItemsTests >> testIgnoresNonArrays [
	self assertValid: '{"foo":"bar"}' description: 'ignores non-arrays'
]

{ #category : 'tests' }
JSONSchemaASchemaGivenForItemsTests >> testJavaScriptPseudoArrayIsValid [
	self
		assertValid: '{"0":"invalid","length":1}'
		description: 'JavaScript pseudo-array is valid'
]

{ #category : 'tests' }
JSONSchemaASchemaGivenForItemsTests >> testValidItems [
	self assertValid: '[1,2,3]' description: 'valid items'
]

{ #category : 'tests' }
JSONSchemaASchemaGivenForItemsTests >> testWrongTypeOfItems [
	self assertInvalid: '[1,"x"]' description: 'wrong type of items'
]
