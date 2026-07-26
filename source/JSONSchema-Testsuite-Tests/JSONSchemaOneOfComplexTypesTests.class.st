Class {
	#name : 'JSONSchemaOneOfComplexTypesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-OneOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'OneOf'
}

{ #category : 'testing' }
JSONSchemaOneOfComplexTypesTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaOneOfComplexTypesTests >> schemaString [
	^ '{"oneOf":[{"properties":{"bar":{"type":"integer"}},"required":["bar"]},{"properties":{"foo":{"type":"string"}},"required":["foo"]}]}'
]

{ #category : 'tests' }
JSONSchemaOneOfComplexTypesTests >> testBothOneOfValidComplex [
	self
		assertInvalid: '{"foo":"baz","bar":2}'
		description: 'both oneOf valid (complex)'
]

{ #category : 'tests' }
JSONSchemaOneOfComplexTypesTests >> testFirstOneOfValidComplex [
	self
		assertValid: '{"bar":2}'
		description: 'first oneOf valid (complex)'
]

{ #category : 'tests' }
JSONSchemaOneOfComplexTypesTests >> testNeitherOneOfValidComplex [
	self
		assertInvalid: '{"foo":2,"bar":"quux"}'
		description: 'neither oneOf valid (complex)'
]

{ #category : 'tests' }
JSONSchemaOneOfComplexTypesTests >> testSecondOneOfValidComplex [
	self
		assertValid: '{"foo":"baz"}'
		description: 'second oneOf valid (complex)'
]
