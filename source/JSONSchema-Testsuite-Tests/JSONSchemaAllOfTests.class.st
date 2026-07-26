Class {
	#name : 'JSONSchemaAllOfTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AllOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AllOf'
}

{ #category : 'testing' }
JSONSchemaAllOfTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaAllOfTests >> schemaString [
	^ '{"allOf":[{"properties":{"bar":{"type":"integer"}},"required":["bar"]},{"properties":{"foo":{"type":"string"}},"required":["foo"]}]}'
]

{ #category : 'tests' }
JSONSchemaAllOfTests >> testAllOf [
	self assertValid: '{"foo":"baz","bar":2}' description: 'allOf'
]

{ #category : 'tests' }
JSONSchemaAllOfTests >> testMismatchFirst [
	self assertInvalid: '{"bar":2}' description: 'mismatch first'
]

{ #category : 'tests' }
JSONSchemaAllOfTests >> testMismatchSecond [
	self assertInvalid: '{"foo":"baz"}' description: 'mismatch second'
]

{ #category : 'tests' }
JSONSchemaAllOfTests >> testWrongType [
	self
		assertInvalid: '{"foo":"baz","bar":"quux"}'
		description: 'wrong type'
]
