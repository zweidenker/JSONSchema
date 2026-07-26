Class {
	#name : 'JSONSchemaRootPointerRefTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaRootPointerRefTests >> expectedFailures [
	^ #(#testRecursiveMatch #testMismatch #testMatch #testRecursiveMismatch)
]

{ #category : 'accessing' }
JSONSchemaRootPointerRefTests >> schemaString [
	^ '{"properties":{"foo":{"$ref":"#"}},"additionalProperties":false}'
]

{ #category : 'tests' }
JSONSchemaRootPointerRefTests >> testMatch [
	self assertValid: '{"foo":false}' description: 'match'
]

{ #category : 'tests' }
JSONSchemaRootPointerRefTests >> testMismatch [
	self assertInvalid: '{"bar":false}' description: 'mismatch'
]

{ #category : 'tests' }
JSONSchemaRootPointerRefTests >> testRecursiveMatch [
	self
		assertValid: '{"foo":{"foo":false}}'
		description: 'recursive match'
]

{ #category : 'tests' }
JSONSchemaRootPointerRefTests >> testRecursiveMismatch [
	self
		assertInvalid: '{"foo":{"bar":false}}'
		description: 'recursive mismatch'
]
