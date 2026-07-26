Class {
	#name : 'JSONSchemaRefWithinRemoteRefTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-RefRemote',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'RefRemote'
}

{ #category : 'testing' }
JSONSchemaRefWithinRemoteRefTests >> expectedFailures [
	^ #(#testRefWithinRefInvalid #testRefWithinRefValid)
]

{ #category : 'accessing' }
JSONSchemaRefWithinRemoteRefTests >> schemaString [
	^ '{"$ref":"http://localhost:1234/subSchemas.json#/refToInteger"}'
]

{ #category : 'tests' }
JSONSchemaRefWithinRemoteRefTests >> testRefWithinRefInvalid [
	self assertInvalid: '"a"' description: 'ref within ref invalid'
]

{ #category : 'tests' }
JSONSchemaRefWithinRemoteRefTests >> testRefWithinRefValid [
	self assertValid: '1' description: 'ref within ref valid'
]
