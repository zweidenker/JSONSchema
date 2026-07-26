Class {
	#name : 'JSONSchemaAdditionalPropertiesAreAllowedByDefaultTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AdditionalProperties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AdditionalProperties'
}

{ #category : 'testing' }
JSONSchemaAdditionalPropertiesAreAllowedByDefaultTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaAdditionalPropertiesAreAllowedByDefaultTests >> schemaString [
	^ '{"properties":{"foo":{},"bar":{}}}'
]

{ #category : 'tests' }
JSONSchemaAdditionalPropertiesAreAllowedByDefaultTests >> testAdditionalPropertiesAreAllowed [
	self
		assertValid: '{"quux":true,"foo":1,"bar":2}'
		description: 'additional properties are allowed'
]
