Class {
	#name : 'JSONSchemaRemoteRefContainingRefsItselfTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaRemoteRefContainingRefsItselfTests >> expectedFailures [
	^ #(#testRemoteRefValid #testRemoteRefInvalid)
]

{ #category : 'accessing' }
JSONSchemaRemoteRefContainingRefsItselfTests >> schemaString [
	^ '{"$ref":"http://json-schema.org/draft-07/schema#"}'
]

{ #category : 'tests' }
JSONSchemaRemoteRefContainingRefsItselfTests >> testRemoteRefInvalid [
	self
		assertInvalid: '{"minLength":-1}'
		description: 'remote ref invalid'
]

{ #category : 'tests' }
JSONSchemaRemoteRefContainingRefsItselfTests >> testRemoteRefValid [
	self assertValid: '{"minLength":1}' description: 'remote ref valid'
]
