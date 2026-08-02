Class {
	#name : 'JSONSchemaAdditionalPropertiesCanExistByItselfTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AdditionalProperties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AdditionalProperties'
}

{ #category : 'accessing' }
JSONSchemaAdditionalPropertiesCanExistByItselfTests >> schemaString [
	^ '{"additionalProperties":{"type":"boolean"}}'
]

{ #category : 'tests' }
JSONSchemaAdditionalPropertiesCanExistByItselfTests >> testAnAdditionalInvalidPropertyIsInvalid [
	self
		assertInvalid: '{"foo":1}'
		description: 'an additional invalid property is invalid'
]

{ #category : 'tests' }
JSONSchemaAdditionalPropertiesCanExistByItselfTests >> testAnAdditionalValidPropertyIsValid [
	self
		assertValid: '{"foo":true}'
		description: 'an additional valid property is valid'
]
