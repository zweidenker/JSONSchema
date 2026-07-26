Class {
	#name : 'JSONSchemaNotTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Not',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Not'
}

{ #category : 'testing' }
JSONSchemaNotTests >> expectedFailures [
	^ #(#testDisallowed #testAllowed)
]

{ #category : 'accessing' }
JSONSchemaNotTests >> schemaString [
	^ '{"not":{"type":"integer"}}'
]

{ #category : 'tests' }
JSONSchemaNotTests >> testAllowed [
	self assertValid: '"foo"' description: 'allowed'
]

{ #category : 'tests' }
JSONSchemaNotTests >> testDisallowed [
	self assertInvalid: '1' description: 'disallowed'
]
