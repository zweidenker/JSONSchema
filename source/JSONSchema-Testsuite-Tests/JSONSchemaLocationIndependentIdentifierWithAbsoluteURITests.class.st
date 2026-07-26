Class {
	#name : 'JSONSchemaLocationIndependentIdentifierWithAbsoluteURITests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaLocationIndependentIdentifierWithAbsoluteURITests >> expectedFailures [
	^ #(#testMismatch #testMatch)
]

{ #category : 'accessing' }
JSONSchemaLocationIndependentIdentifierWithAbsoluteURITests >> schemaString [
	^ '{"allOf":[{"$ref":"http://localhost:1234/bar#foo"}],"definitions":{"A":{"$id":"http://localhost:1234/bar#foo","type":"integer"}}}'
]

{ #category : 'tests' }
JSONSchemaLocationIndependentIdentifierWithAbsoluteURITests >> testMatch [
	self assertValid: '1' description: 'match'
]

{ #category : 'tests' }
JSONSchemaLocationIndependentIdentifierWithAbsoluteURITests >> testMismatch [
	self assertInvalid: '"a"' description: 'mismatch'
]
