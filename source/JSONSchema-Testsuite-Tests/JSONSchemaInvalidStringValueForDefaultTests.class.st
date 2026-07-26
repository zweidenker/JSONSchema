Class {
	#name : 'JSONSchemaInvalidStringValueForDefaultTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Default',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Default'
}

{ #category : 'testing' }
JSONSchemaInvalidStringValueForDefaultTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaInvalidStringValueForDefaultTests >> schemaString [
	^ '{"properties":{"bar":{"minLength":4,"default":"bad","type":"string"}}}'
]

{ #category : 'tests' }
JSONSchemaInvalidStringValueForDefaultTests >> testStillValidWhenTheInvalidDefaultIsUsed [
	self
		assertValid: '{}'
		description: 'still valid when the invalid default is used'
]

{ #category : 'tests' }
JSONSchemaInvalidStringValueForDefaultTests >> testValidWhenPropertyIsSpecified [
	self
		assertValid: '{"bar":"good"}'
		description: 'valid when property is specified'
]
