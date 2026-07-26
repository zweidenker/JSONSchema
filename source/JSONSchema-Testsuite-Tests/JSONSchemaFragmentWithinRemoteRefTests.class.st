Class {
	#name : 'JSONSchemaFragmentWithinRemoteRefTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-RefRemote',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'RefRemote'
}

{ #category : 'testing' }
JSONSchemaFragmentWithinRemoteRefTests >> expectedFailures [
	^ #(#testRemoteFragmentValid #testRemoteFragmentInvalid)
]

{ #category : 'accessing' }
JSONSchemaFragmentWithinRemoteRefTests >> schemaString [
	^ '{"$ref":"http://localhost:1234/subSchemas.json#/integer"}'
]

{ #category : 'tests' }
JSONSchemaFragmentWithinRemoteRefTests >> testRemoteFragmentInvalid [
	self assertInvalid: '"a"' description: 'remote fragment invalid'
]

{ #category : 'tests' }
JSONSchemaFragmentWithinRemoteRefTests >> testRemoteFragmentValid [
	self assertValid: '1' description: 'remote fragment valid'
]
