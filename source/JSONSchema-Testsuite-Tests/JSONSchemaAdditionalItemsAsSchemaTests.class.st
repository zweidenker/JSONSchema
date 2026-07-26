Class {
	#name : 'JSONSchemaAdditionalItemsAsSchemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AdditionalItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AdditionalItems'
}

{ #category : 'testing' }
JSONSchemaAdditionalItemsAsSchemaTests >> expectedFailures [
	^ #(#testAdditionalItemsMatchSchema #testAdditionalItemsDoNotMatchSchema)
]

{ #category : 'accessing' }
JSONSchemaAdditionalItemsAsSchemaTests >> schemaString [
	^ '{"items":[{}],"additionalItems":{"type":"integer"}}'
]

{ #category : 'tests' }
JSONSchemaAdditionalItemsAsSchemaTests >> testAdditionalItemsDoNotMatchSchema [
	self
		assertInvalid: '[null,2,3,"foo"]'
		description: 'additional items do not match schema'
]

{ #category : 'tests' }
JSONSchemaAdditionalItemsAsSchemaTests >> testAdditionalItemsMatchSchema [
	self
		assertValid: '[null,2,3,4]'
		description: 'additional items match schema'
]
