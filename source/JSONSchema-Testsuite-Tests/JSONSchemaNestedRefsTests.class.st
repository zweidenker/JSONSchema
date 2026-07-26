Class {
	#name : 'JSONSchemaNestedRefsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaNestedRefsTests >> expectedFailures [
	^ #(#testNestedRefInvalid)
]

{ #category : 'accessing' }
JSONSchemaNestedRefsTests >> schemaString [
	^ '{"definitions":{"a":{"type":"integer"},"b":{"$ref":"#/definitions/a"},"c":{"$ref":"#/definitions/b"}},"$ref":"#/definitions/c"}'
]

{ #category : 'tests' }
JSONSchemaNestedRefsTests >> testNestedRefInvalid [
	self assertInvalid: '"a"' description: 'nested ref invalid'
]

{ #category : 'tests' }
JSONSchemaNestedRefsTests >> testNestedRefValid [
	self assertValid: '5' description: 'nested ref valid'
]
