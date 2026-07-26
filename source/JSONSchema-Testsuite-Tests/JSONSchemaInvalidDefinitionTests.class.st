Class {
	#name : 'JSONSchemaInvalidDefinitionTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Definitions',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Definitions'
}

{ #category : 'testing' }
JSONSchemaInvalidDefinitionTests >> expectedFailures [
	^ #(#testInvalidDefinitionSchema)
]

{ #category : 'accessing' }
JSONSchemaInvalidDefinitionTests >> schemaString [
	^ '{"$ref":"http://json-schema.org/draft-07/schema#"}'
]

{ #category : 'tests' }
JSONSchemaInvalidDefinitionTests >> testInvalidDefinitionSchema [
	self
		assertInvalid: '{"definitions":{"foo":{"type":1}}}'
		description: 'invalid definition schema'
]
