Class {
	#name : 'JSONSchemaInvalidTypeForDefaultTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Default',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Default'
}

{ #category : 'testing' }
JSONSchemaInvalidTypeForDefaultTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaInvalidTypeForDefaultTests >> schemaString [
	^ '{"properties":{"foo":{"default":[],"type":"integer"}}}'
]

{ #category : 'tests' }
JSONSchemaInvalidTypeForDefaultTests >> testStillValidWhenTheInvalidDefaultIsUsed [
	self
		assertValid: '{}'
		description: 'still valid when the invalid default is used'
]

{ #category : 'tests' }
JSONSchemaInvalidTypeForDefaultTests >> testValidWhenPropertyIsSpecified [
	self
		assertValid: '{"foo":13}'
		description: 'valid when property is specified'
]
