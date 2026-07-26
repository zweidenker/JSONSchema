Class {
	#name : 'JSONSchemaAllOfWithTheLastEmptySchemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AllOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AllOf'
}

{ #category : 'testing' }
JSONSchemaAllOfWithTheLastEmptySchemaTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaAllOfWithTheLastEmptySchemaTests >> schemaString [
	^ '{"allOf":[{"type":"number"},{}]}'
]

{ #category : 'tests' }
JSONSchemaAllOfWithTheLastEmptySchemaTests >> testNumberIsValid [
	self assertValid: '1' description: 'number is valid'
]

{ #category : 'tests' }
JSONSchemaAllOfWithTheLastEmptySchemaTests >> testStringIsInvalid [
	self assertInvalid: '"foo"' description: 'string is invalid'
]
