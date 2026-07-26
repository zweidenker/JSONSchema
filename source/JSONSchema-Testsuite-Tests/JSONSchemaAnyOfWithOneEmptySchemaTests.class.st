Class {
	#name : 'JSONSchemaAnyOfWithOneEmptySchemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AnyOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AnyOf'
}

{ #category : 'testing' }
JSONSchemaAnyOfWithOneEmptySchemaTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaAnyOfWithOneEmptySchemaTests >> schemaString [
	^ '{"anyOf":[{"type":"number"},{}]}'
]

{ #category : 'tests' }
JSONSchemaAnyOfWithOneEmptySchemaTests >> testNumberIsValid [
	self assertValid: '123' description: 'number is valid'
]

{ #category : 'tests' }
JSONSchemaAnyOfWithOneEmptySchemaTests >> testStringIsValid [
	self assertValid: '"foo"' description: 'string is valid'
]
