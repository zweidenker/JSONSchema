Class {
	#name : 'JSONSchemaRemoteRefTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-RefRemote',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'RefRemote'
}

{ #category : 'testing' }
JSONSchemaRemoteRefTests >> expectedFailures [
	^ #(#testRemoteRefValid #testRemoteRefInvalid)
]

{ #category : 'accessing' }
JSONSchemaRemoteRefTests >> schemaString [
	^ '{"$ref":"http://localhost:1234/integer.json"}'
]

{ #category : 'tests' }
JSONSchemaRemoteRefTests >> testRemoteRefInvalid [
	self assertInvalid: '"a"' description: 'remote ref invalid'
]

{ #category : 'tests' }
JSONSchemaRemoteRefTests >> testRemoteRefValid [
	self assertValid: '1' description: 'remote ref valid'
]
