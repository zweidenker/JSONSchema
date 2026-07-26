Class {
	#name : 'JSONSchemaAllOfWithOneEmptySchemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AllOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AllOf'
}

{ #category : 'testing' }
JSONSchemaAllOfWithOneEmptySchemaTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaAllOfWithOneEmptySchemaTests >> schemaString [
	^ '{"allOf":[{}]}'
]

{ #category : 'tests' }
JSONSchemaAllOfWithOneEmptySchemaTests >> testAnyDataIsValid [
	self assertValid: '1' description: 'any data is valid'
]
