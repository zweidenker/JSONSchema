Class {
	#name : 'JSONSchemaAnyOfWithBaseSchemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AnyOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AnyOf'
}

{ #category : 'testing' }
JSONSchemaAnyOfWithBaseSchemaTests >> expectedFailures [
	^ #(#testMismatchBaseSchema #testBothAnyOfInvalid #testOneAnyOfValid)
]

{ #category : 'accessing' }
JSONSchemaAnyOfWithBaseSchemaTests >> schemaString [
	^ '{"anyOf":[{"maxLength":2},{"minLength":4}],"type":"string"}'
]

{ #category : 'tests' }
JSONSchemaAnyOfWithBaseSchemaTests >> testBothAnyOfInvalid [
	self assertInvalid: '"foo"' description: 'both anyOf invalid'
]

{ #category : 'tests' }
JSONSchemaAnyOfWithBaseSchemaTests >> testMismatchBaseSchema [
	self assertInvalid: '3' description: 'mismatch base schema'
]

{ #category : 'tests' }
JSONSchemaAnyOfWithBaseSchemaTests >> testOneAnyOfValid [
	self assertValid: '"foobar"' description: 'one anyOf valid'
]
