Class {
	#name : 'JSONSchemaAdditionalItemsAsFalseWithoutItemsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AdditionalItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AdditionalItems'
}

{ #category : 'testing' }
JSONSchemaAdditionalItemsAsFalseWithoutItemsTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaAdditionalItemsAsFalseWithoutItemsTests >> schemaString [
	^ '{"additionalItems":false}'
]

{ #category : 'tests' }
JSONSchemaAdditionalItemsAsFalseWithoutItemsTests >> testIgnoresNonArrays [
	self assertValid: '{"foo":"bar"}' description: 'ignores non-arrays'
]

{ #category : 'tests' }
JSONSchemaAdditionalItemsAsFalseWithoutItemsTests >> testItemsDefaultsToEmptySchemaSoEverythingIsValid [
	self
		assertValid: '[1,2,3,4,5]'
		description: 'items defaults to empty schema so everything is valid'
]
