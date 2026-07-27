Class {
	#name : 'JSONSchemaAdditionalItemsShouldNotLookInApplicatorsValidCaseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AdditionalItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AdditionalItems'
}

{ #category : 'accessing' }
JSONSchemaAdditionalItemsShouldNotLookInApplicatorsValidCaseTests >> schemaString [
	^ '{"allOf":[{"items":[{"type":"integer"}]}],"additionalItems":{"type":"boolean"}}'
]

{ #category : 'tests' }
JSONSchemaAdditionalItemsShouldNotLookInApplicatorsValidCaseTests >> testItemsDefinedInAllOfAreNotExamined [
	self
		assertValid: '[1,null]'
		description: 'items defined in allOf are not examined'
]
