Class {
	#name : 'JSONSchemaNotMultipleTypesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Not',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Not'
}

{ #category : 'testing' }
JSONSchemaNotMultipleTypesTests >> expectedFailures [
	^ #(#testMismatch #testOtherMismatch #testValid)
]

{ #category : 'accessing' }
JSONSchemaNotMultipleTypesTests >> schemaString [
	^ '{"not":{"type":["integer","boolean"]}}'
]

{ #category : 'tests' }
JSONSchemaNotMultipleTypesTests >> testMismatch [
	self assertInvalid: '1' description: 'mismatch'
]

{ #category : 'tests' }
JSONSchemaNotMultipleTypesTests >> testOtherMismatch [
	self assertInvalid: 'true' description: 'other mismatch'
]

{ #category : 'tests' }
JSONSchemaNotMultipleTypesTests >> testValid [
	self assertValid: '"foo"' description: 'valid'
]
