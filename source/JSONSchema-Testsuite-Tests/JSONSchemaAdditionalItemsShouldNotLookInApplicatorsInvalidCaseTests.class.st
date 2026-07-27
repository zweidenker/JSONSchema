Class {
	#name : 'JSONSchemaAdditionalItemsShouldNotLookInApplicatorsInvalidCaseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AdditionalItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AdditionalItems'
}

{ #category : 'accessing' }
JSONSchemaAdditionalItemsShouldNotLookInApplicatorsInvalidCaseTests >> schemaString [
	^ '{"allOf":[{"items":[{"type":"integer"},{"type":"string"}]}],"items":[{"type":"integer"}],"additionalItems":{"type":"boolean"}}'
]

{ #category : 'tests' }
JSONSchemaAdditionalItemsShouldNotLookInApplicatorsInvalidCaseTests >> testItemsDefinedInAllOfAreNotExamined [
	self
		assertInvalid: '[1,"hello"]'
		description: 'items defined in allOf are not examined'
]
