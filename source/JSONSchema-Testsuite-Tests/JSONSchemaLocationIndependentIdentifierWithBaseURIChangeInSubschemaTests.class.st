Class {
	#name : 'JSONSchemaLocationIndependentIdentifierWithBaseURIChangeInSubschemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaLocationIndependentIdentifierWithBaseURIChangeInSubschemaTests >> expectedFailures [
	^ #(#testMismatch #testMatch)
]

{ #category : 'accessing' }
JSONSchemaLocationIndependentIdentifierWithBaseURIChangeInSubschemaTests >> schemaString [
	^ '{"allOf":[{"$ref":"http://localhost:1234/nested.json#foo"}],"definitions":{"A":{"definitions":{"B":{"$id":"#foo","type":"integer"}},"$id":"nested.json"}},"$id":"http://localhost:1234/root"}'
]

{ #category : 'tests' }
JSONSchemaLocationIndependentIdentifierWithBaseURIChangeInSubschemaTests >> testMatch [
	self assertValid: '1' description: 'match'
]

{ #category : 'tests' }
JSONSchemaLocationIndependentIdentifierWithBaseURIChangeInSubschemaTests >> testMismatch [
	self assertInvalid: '"a"' description: 'mismatch'
]
