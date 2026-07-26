Class {
	#name : 'JSONSchemaAllOfWithTheFirstEmptySchemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AllOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AllOf'
}

{ #category : 'testing' }
JSONSchemaAllOfWithTheFirstEmptySchemaTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaAllOfWithTheFirstEmptySchemaTests >> schemaString [
	^ '{"allOf":[{},{"type":"number"}]}'
]

{ #category : 'tests' }
JSONSchemaAllOfWithTheFirstEmptySchemaTests >> testNumberIsValid [
	self assertValid: '1' description: 'number is valid'
]

{ #category : 'tests' }
JSONSchemaAllOfWithTheFirstEmptySchemaTests >> testStringIsInvalid [
	self assertInvalid: '"foo"' description: 'string is invalid'
]
