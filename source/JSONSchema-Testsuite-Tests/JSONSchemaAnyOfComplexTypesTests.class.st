Class {
	#name : 'JSONSchemaAnyOfComplexTypesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AnyOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AnyOf'
}

{ #category : 'testing' }
JSONSchemaAnyOfComplexTypesTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaAnyOfComplexTypesTests >> schemaString [
	^ '{"anyOf":[{"properties":{"bar":{"type":"integer"}},"required":["bar"]},{"properties":{"foo":{"type":"string"}},"required":["foo"]}]}'
]

{ #category : 'tests' }
JSONSchemaAnyOfComplexTypesTests >> testBothAnyOfValidComplex [
	self
		assertValid: '{"foo":"baz","bar":2}'
		description: 'both anyOf valid (complex)'
]

{ #category : 'tests' }
JSONSchemaAnyOfComplexTypesTests >> testFirstAnyOfValidComplex [
	self
		assertValid: '{"bar":2}'
		description: 'first anyOf valid (complex)'
]

{ #category : 'tests' }
JSONSchemaAnyOfComplexTypesTests >> testNeitherAnyOfValidComplex [
	self
		assertInvalid: '{"foo":2,"bar":"quux"}'
		description: 'neither anyOf valid (complex)'
]

{ #category : 'tests' }
JSONSchemaAnyOfComplexTypesTests >> testSecondAnyOfValidComplex [
	self
		assertValid: '{"foo":"baz"}'
		description: 'second anyOf valid (complex)'
]
