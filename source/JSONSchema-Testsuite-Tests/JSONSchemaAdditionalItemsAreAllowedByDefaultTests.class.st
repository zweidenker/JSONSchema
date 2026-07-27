Class {
	#name : 'JSONSchemaAdditionalItemsAreAllowedByDefaultTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AdditionalItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AdditionalItems'
}

{ #category : 'accessing' }
JSONSchemaAdditionalItemsAreAllowedByDefaultTests >> schemaString [
	^ '{"items":[{"type":"integer"}]}'
]

{ #category : 'tests' }
JSONSchemaAdditionalItemsAreAllowedByDefaultTests >> testOnlyTheFirstItemIsValidated [
	self
		assertValid: '[1,"foo",false]'
		description: 'only the first item is validated'
]
