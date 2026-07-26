Class {
	#name : 'JSONSchemaLocationIndependentIdentifierTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaLocationIndependentIdentifierTests >> expectedFailures [
	^ #(#testMismatch #testMatch)
]

{ #category : 'accessing' }
JSONSchemaLocationIndependentIdentifierTests >> schemaString [
	^ '{"allOf":[{"$ref":"#foo"}],"definitions":{"A":{"$id":"#foo","type":"integer"}}}'
]

{ #category : 'tests' }
JSONSchemaLocationIndependentIdentifierTests >> testMatch [
	self assertValid: '1' description: 'match'
]

{ #category : 'tests' }
JSONSchemaLocationIndependentIdentifierTests >> testMismatch [
	self assertInvalid: '"a"' description: 'mismatch'
]
