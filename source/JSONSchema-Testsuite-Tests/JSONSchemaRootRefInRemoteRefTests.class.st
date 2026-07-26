Class {
	#name : 'JSONSchemaRootRefInRemoteRefTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-RefRemote',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'RefRemote'
}

{ #category : 'testing' }
JSONSchemaRootRefInRemoteRefTests >> expectedFailures [
	^ #(#testObjectIsInvalid #testNullIsValid #testStringIsValid)
]

{ #category : 'accessing' }
JSONSchemaRootRefInRemoteRefTests >> schemaString [
	^ '{"properties":{"name":{"$ref":"name.json#/definitions/orNull"}},"$id":"http://localhost:1234/object","type":"object"}'
]

{ #category : 'tests' }
JSONSchemaRootRefInRemoteRefTests >> testNullIsValid [
	self assertValid: '{"name":null}' description: 'null is valid'
]

{ #category : 'tests' }
JSONSchemaRootRefInRemoteRefTests >> testObjectIsInvalid [
	self
		assertInvalid: '{"name":{"name":null}}'
		description: 'object is invalid'
]

{ #category : 'tests' }
JSONSchemaRootRefInRemoteRefTests >> testStringIsValid [
	self assertValid: '{"name":"foo"}' description: 'string is valid'
]
