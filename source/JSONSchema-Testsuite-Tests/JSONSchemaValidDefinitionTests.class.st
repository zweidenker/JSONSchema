Class {
	#name : 'JSONSchemaValidDefinitionTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Definitions',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Definitions'
}

{ #category : 'testing' }
JSONSchemaValidDefinitionTests >> expectedFailures [
	^ #(#testValidDefinitionSchema)
]

{ #category : 'accessing' }
JSONSchemaValidDefinitionTests >> schemaString [
	^ '{"$ref":"http://json-schema.org/draft-07/schema#"}'
]

{ #category : 'tests' }
JSONSchemaValidDefinitionTests >> testValidDefinitionSchema [
	self
		assertValid: '{"definitions":{"foo":{"type":"integer"}}}'
		description: 'valid definition schema'
]
