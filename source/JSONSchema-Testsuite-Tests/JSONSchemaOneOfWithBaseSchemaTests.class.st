Class {
	#name : 'JSONSchemaOneOfWithBaseSchemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-OneOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'OneOf'
}

{ #category : 'testing' }
JSONSchemaOneOfWithBaseSchemaTests >> expectedFailures [
	^ #(#testOneOneOfValid #testMismatchBaseSchema #testBothOneOfValid)
]

{ #category : 'accessing' }
JSONSchemaOneOfWithBaseSchemaTests >> schemaString [
	^ '{"oneOf":[{"minLength":2},{"maxLength":4}],"type":"string"}'
]

{ #category : 'tests' }
JSONSchemaOneOfWithBaseSchemaTests >> testBothOneOfValid [
	self assertInvalid: '"foo"' description: 'both oneOf valid'
]

{ #category : 'tests' }
JSONSchemaOneOfWithBaseSchemaTests >> testMismatchBaseSchema [
	self assertInvalid: '3' description: 'mismatch base schema'
]

{ #category : 'tests' }
JSONSchemaOneOfWithBaseSchemaTests >> testOneOneOfValid [
	self assertValid: '"foobar"' description: 'one oneOf valid'
]
