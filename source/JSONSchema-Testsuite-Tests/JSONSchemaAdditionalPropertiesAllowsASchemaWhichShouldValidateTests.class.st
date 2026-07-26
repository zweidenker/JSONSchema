Class {
	#name : 'JSONSchemaAdditionalPropertiesAllowsASchemaWhichShouldValidateTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AdditionalProperties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AdditionalProperties'
}

{ #category : 'testing' }
JSONSchemaAdditionalPropertiesAllowsASchemaWhichShouldValidateTests >> expectedFailures [
	^ #(#testAnAdditionalInvalidPropertyIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaAdditionalPropertiesAllowsASchemaWhichShouldValidateTests >> schemaString [
	^ '{"properties":{"foo":{},"bar":{}},"additionalProperties":{"type":"boolean"}}'
]

{ #category : 'tests' }
JSONSchemaAdditionalPropertiesAllowsASchemaWhichShouldValidateTests >> testAnAdditionalInvalidPropertyIsInvalid [
	self
		assertInvalid: '{"quux":12,"foo":1,"bar":2}'
		description: 'an additional invalid property is invalid'
]

{ #category : 'tests' }
JSONSchemaAdditionalPropertiesAllowsASchemaWhichShouldValidateTests >> testAnAdditionalValidPropertyIsValid [
	self
		assertValid: '{"quux":true,"foo":1,"bar":2}'
		description: 'an additional valid property is valid'
]

{ #category : 'tests' }
JSONSchemaAdditionalPropertiesAllowsASchemaWhichShouldValidateTests >> testNoAdditionalPropertiesIsValid [
	self
		assertValid: '{"foo":1}'
		description: 'no additional properties is valid'
]
