Class {
	#name : 'JSONSchemaAdditionalPropertiesShouldNotLookInApplicatorsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AdditionalProperties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AdditionalProperties'
}

{ #category : 'testing' }
JSONSchemaAdditionalPropertiesShouldNotLookInApplicatorsTests >> expectedFailures [
	^ #(#testPropertiesDefinedInAllOfAreNotExamined)
]

{ #category : 'accessing' }
JSONSchemaAdditionalPropertiesShouldNotLookInApplicatorsTests >> schemaString [
	^ '{"allOf":[{"properties":{"foo":{}}}],"additionalProperties":{"type":"boolean"}}'
]

{ #category : 'tests' }
JSONSchemaAdditionalPropertiesShouldNotLookInApplicatorsTests >> testPropertiesDefinedInAllOfAreNotExamined [
	self
		assertInvalid: '{"foo":1,"bar":true}'
		description: 'properties defined in allOf are not examined'
]
